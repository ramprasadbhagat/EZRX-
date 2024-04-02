import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PaymentSummaryDetailsBlocMock
    extends MockBloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState>
    implements PaymentSummaryDetailsBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class AppRouterMock extends Mock implements AppRouter {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

void main() {
  late AppRouter autoRouterMock;
  late NewPaymentBloc newPaymentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlocMock;
  late PaymentInvoiceInfoPdf fakePaymentInvoiceInfoPdf;
  late PaymentSummaryDetails fakePaymentSummaryDetails;
  late PaymentSummaryBloc mockPaymentSummaryBloc;
  late List<PaymentItem> paymentList;
  const fakeMockId = 'mock-id';
  const fakeError = Left(ApiFailure.other('fake-error'));

  final paymentAdviceFailed = find.byKey(WidgetKeys.paymentAdviceFailed);
  final confirmBottomSheetConfirmButton =
      find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
  final confirmBottomSheetCancelButton =
      find.byKey(WidgetKeys.confirmBottomSheetCancelButton);

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouterMock());
    locator.registerSingleton<MixpanelService>(MockMixpanelService());
    registerFallbackValue((Route route) {
      return route.settings.name == PaymentPageRoute.name;
    });
    registerFallbackValue(Uint8List(0));

    autoRouterMock = locator<AppRouterMock>();
    paymentList = await PaymentItemLocalDataSource().getPaymentItems();
    newPaymentBlocMock = NewPaymentBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
    mockPaymentSummaryBloc = PaymentSummaryBlocMock();

    fakePaymentInvoiceInfoPdf =
        await NewPaymentLocalDataSource().getPaymentInvoiceInfoPdf();

    fakePaymentSummaryDetails =
        await PaymentItemLocalDataSource().getPaymentSummaryDetails();
  });

  setUp(() {
    when(() => newPaymentBlocMock.state).thenReturn(
      NewPaymentState.initial(),
    );
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => paymentSummaryDetailsBlocMock.state).thenReturn(
      PaymentSummaryDetailsState.initial(),
    );
    when(() => mockPaymentSummaryBloc.state)
        .thenReturn(PaymentSummaryState.initial());
  });

  void findAndTapRichText({required Element parent, required String text}) {
    final paragraph = parent.renderObject as RenderParagraph;

    paragraph.text.visitChildren((dynamic span) {
      if (span.text != text) return true;

      (span.recognizer as TapGestureRecognizer).onTap!();
      return false;
    });
  }

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      useMediaQuery: true,
      usingLocalization: true,
      routeName: PaymentAdviceCreatedPageRoute.name,
      providers: [
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<PaymentSummaryDetailsBloc>(
          create: (context) => paymentSummaryDetailsBlocMock,
        ),
        BlocProvider<PaymentSummaryBloc>(
          create: (context) => mockPaymentSummaryBloc,
        ),
      ],
      child: const PaymentAdviceCreatedPage(),
    );
  }

  group('Payment Advice Created Page Test =>', () {
    group('Payment Advice Created Page Test for Bank In Method', () {
      testWidgets('Test Display', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.paymentAdviceBodyAPLSection),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.paymentCancelAdviceButton), findsNothing);
        expect(
          find.byKey(WidgetKeys.paymentBankInAdviceMessage),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.paymentGatewayAdviceMessage),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.paymentAdvicePleaseNote), findsOneWidget);
        expect(find.byKey(WidgetKeys.paymentAdviceNextStep), findsNothing);
        expect(
          find.byKey(WidgetKeys.paymentSavePdfButtonSection),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.paymentSummarySection), findsNothing);
        expect(find.byKey(WidgetKeys.paymentAdviceButton), findsOneWidget);
      });

      testWidgets('Display Buttons Test', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final paymentSummaryButtonFinder =
            find.byKey(WidgetKeys.paymentSummaryButton);
        final downloadAdviceButtonFinder =
            find.byKey(WidgetKeys.downloadAdviceButton);
        expect(paymentSummaryButtonFinder, findsOneWidget);
        expect(downloadAdviceButtonFinder, findsOneWidget);
      });

      testWidgets('On Tap Payment Summary Button Test', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        );
        when(
          () => autoRouterMock.popAndPush(
            const PaymentSummaryPageRoute(),
          ),
        ).thenAnswer((invocation) => Future.value());
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final paymentSummaryButtonFinder =
            find.byKey(WidgetKeys.paymentSummaryButton);
        await tester.tap(paymentSummaryButtonFinder);
        verify(
          () => autoRouterMock.popAndPush(
            const PaymentSummaryPageRoute(),
          ),
        ).called(1);
      });

      testWidgets('Show Snackbar When Download Success', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            salesOrganisation: fakePHSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        );
        final expectStates = [
          NewPaymentState.initial().copyWith(
            isSavingInvoicePdf: true,
            salesOrganisation: fakePHSalesOrganisation,
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
          ),
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            salesOrganisation: fakePHSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        ];

        whenListen(newPaymentBlocMock, Stream.fromIterable(expectStates));

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final downloadAdviceButtonFinder =
            find.byKey(WidgetKeys.downloadAdviceButton);
        expect(downloadAdviceButtonFinder, findsOneWidget);
        await tester.tap(downloadAdviceButtonFinder);
        await tester.pump();
        await tester.pump();

        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        expect(find.text('Download Successful'.tr()), findsOneWidget);
      });

      testWidgets('Show Snackbar When Download Failure', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            salesOrganisation: fakePHSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        );
        final expectStates = [
          NewPaymentState.initial().copyWith(
            isSavingInvoicePdf: true,
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ];

        whenListen(newPaymentBlocMock, Stream.fromIterable(expectStates));

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final downloadAdviceButtonFinder =
            find.byKey(WidgetKeys.downloadAdviceButton);
        expect(downloadAdviceButtonFinder, findsOneWidget);
        await tester.tap(downloadAdviceButtonFinder);
        await tester.pump();
        await tester.pump();

        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        expect(find.text('fake-error'.tr()), findsOneWidget);
      });

      testWidgets('Tap on Payment Summary', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
          ),
        );
        when(() => autoRouterMock.pushNamed('payments/payment_summary'))
            .thenAnswer((invocation) => Future.value());
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final richTextElement = find
            .textContaining(
              'You can check your payment status from the.'.tr(),
              findRichText: true,
            )
            .evaluate()
            .single;
        findAndTapRichText(
          parent: richTextElement,
          text: 'Payment summary'.tr(),
        );
        await tester.pumpAndSettle();
        verify(
          () => autoRouterMock.pushNamed('payments/payment_summary'),
        ).called(1);
      });

      testWidgets('Display Rich Text With Bank In', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.text('Please note'.tr()), findsOneWidget);
        expect(
          find.textContaining(
            'You can check your payment status from the.'.tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'If payment request fails, you may choose to retry payment or delete the failed payment advice then generate a new payment advice.'
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Please note that system-generated payment advice(s) will be automatically deleted if payment is not received within 30 days.'
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
      });
    });

    group('Payment Advice Created Page Test for Payment Gateway Method', () {
      testWidgets('Test Display', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Payment Gateway'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.paymentAdviceBodyAPLSection),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.paymentCancelAdviceButton), findsNothing);
        expect(find.byKey(WidgetKeys.paymentBankInAdviceMessage), findsNothing);
        expect(
          find.byKey(WidgetKeys.paymentGatewayAdviceMessage),
          findsOneWidget,
        );
        expect(find.byKey(WidgetKeys.paymentAdvicePleaseNote), findsNothing);
        expect(find.byKey(WidgetKeys.paymentAdviceNextStep), findsOneWidget);
        expect(find.byKey(WidgetKeys.paymentSummarySection), findsOneWidget);
        expect(find.byKey(WidgetKeys.paymentAdviceButton), findsNothing);
        // expect(
        //   find.byKey(WidgetKeys.paymentAdviceDocumentHeader),
        //   findsOneWidget,
        // );

        // await tester.dragUntilVisible(
        //   find.byKey(WidgetKeys.paymentSavePdfButtonSection),
        //   find.byType(ListView),
        //   const Offset(0.0, -200),
        // );
        // expect(
        //   find.byKey(WidgetKeys.paymentSavePdfButtonSection),
        //   findsNothing,
        // );
      });
    });

    group('Payment Advice Created Page Test for SG QR Code Method', () {
      testWidgets('Test Display', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('QR Code'),
            ),
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty()
                .copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.paymentAdviceBodyAPLSection),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.paymentCancelAdviceButton), findsNothing);
        expect(find.byKey(WidgetKeys.paymentBankInAdviceMessage), findsNothing);
        expect(
          find.byKey(WidgetKeys.paymentGatewayAdviceMessage),
          findsOneWidget,
        );
        expect(find.byKey(WidgetKeys.paymentAdviceNextStep), findsNothing);
        expect(find.byKey(WidgetKeys.paymentAdvicePleaseNote), findsOneWidget);

        expect(find.byKey(WidgetKeys.paymentSummarySection), findsNothing);
        expect(find.byKey(WidgetKeys.paymentAdviceButton), findsOneWidget);

        expect(
          find.byKey(WidgetKeys.paymentSavePdfButtonSection),
          findsNothing,
        );
      });
    });

    group('Payment Advice Created Page Test for ID APL Method', () {
      testWidgets('Test Display', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Virtual Accounts Transfer'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.paymentAdviceBodyAPLSection),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.paymentCancelAdviceButton),
          findsOneWidget,
        );
        expect(find.byKey(WidgetKeys.paymentBankInAdviceMessage), findsNothing);
        expect(
          find.byKey(WidgetKeys.paymentGatewayAdviceMessage),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.paymentAdviceNextStep), findsNothing);
        expect(find.byKey(WidgetKeys.paymentAdvicePleaseNote), findsNothing);

        expect(find.byKey(WidgetKeys.paymentSummarySection), findsNothing);
        expect(find.byKey(WidgetKeys.paymentAdviceButton), findsNothing);
        expect(
          find.byKey(WidgetKeys.paymentSavePdfButtonSection),
          findsNothing,
        );
      });

      testWidgets('On Tap Cancel Advice Button', (tester) async {
        when(() => newPaymentBlocMock.state).thenAnswer(
          (invocation) => NewPaymentState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => paymentSummaryDetailsBlocMock.state).thenAnswer(
          (invocation) => PaymentSummaryDetailsState.initial().copyWith(
            details: fakePaymentSummaryDetails,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final deleteButtonFinder = find.byKey(WidgetKeys.deleteAdviceButtonKey);
        expect(deleteButtonFinder, findsOneWidget);
        await tester.tap(deleteButtonFinder);
        await tester.pumpAndSettle();
        expect(find.byType(DeleteCancelAdviceBottomSheet), findsOneWidget);
      });

      testWidgets('Show snack bar when cancel success', (tester) async {
        final expectState = [
          PaymentSummaryDetailsState.initial().copyWith(
            isCancelingAdvice: true,
          ),
          PaymentSummaryDetailsState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right('')),
          ),
        ];
        whenListen(
          paymentSummaryDetailsBlocMock,
          Stream.fromIterable(expectState),
        );
        when(() => newPaymentBlocMock.state).thenAnswer(
          (invocation) => NewPaymentState.initial()
              .copyWith(salesOrganisation: fakeIDSalesOrganisation),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        expect(find.text('Payment cancel successfully'.tr()), findsOneWidget);
      });
    });

    group('Payment Advice Created Page Test for Common Widget', () {
      testWidgets('Display Rich Text Test', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.text('Next steps and notes'.tr()), findsOneWidget);
        expect(
          find.textContaining(
            'It may take a few seconds for the payment gateway to open in a new browser tab.'
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Please do not click on the back button or refresh/cancel the page while the payment gateway is loading.'
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'You may download the payment advice after the payment process or through the payment summary page.'
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'The payment advice copy will be sent to the email associated with this account.'
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'If there\'s any error in the selected invoice/credit notes, please '
                .tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );

        expect(
          find.textContaining(
            ' this payment advice and generate a new payment advice.'.tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Disclaimer: eZRx+ does not store your card information'.tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
      });

      testWidgets('On Tap Delete', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final richTextElement = find
            .textContaining(
              'If there\'s any error in the selected invoice/credit notes, please '
                  .tr(),
              findRichText: true,
            )
            .evaluate()
            .single;
        findAndTapRichText(parent: richTextElement, text: 'delete'.tr());
        await tester.pumpAndSettle();

        verify(
          () => paymentSummaryDetailsBlocMock.add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              details: PaymentSummaryDetails.fromPaymentInvoicePDF(
                PaymentInvoiceInfoPdf.empty(),
              ),
            ),
          ),
        ).called(1);
        expect(find.text('${'Delete payment advice'.tr()}?'), findsOneWidget);
        expect(
          find.text(
            'Once deleted, payment advice cannot be recovered. You will be required to create a new payment advice to complete payment.'
                .tr(),
          ),
          findsOneWidget,
        );
      });

      testWidgets('On Tap Delete info PDF note empty', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
              paymentID: fakeMockId,
              paymentItems: paymentList,
              zzAdvice: fakeMockId,
              paymentBatchAdditionalInfo: fakeMockId,
            ),
            salesOrganisation: fakeMYSalesOrganisation,
            selectedPaymentMethod: NewPaymentMethod(
              options: <PaymentMethodOption>[],
              paymentMethod: PaymentMethodValue('Virtual Accounts Transfer'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final richTextElement = find
            .textContaining(
              'If there\'s any error in the selected invoice/credit notes, please '
                  .tr(),
              findRichText: true,
            )
            .evaluate()
            .single;
        findAndTapRichText(parent: richTextElement, text: 'delete'.tr());

        verify(
          () => paymentSummaryDetailsBlocMock.add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              details: PaymentSummaryDetails.empty().copyWith(
                paymentAmount: paymentList.totalInInvoice,
                paymentID: StringValue(fakeMockId),
                transactionCurrency: Currency(
                  paymentList.first.transactionCurrency,
                ),
                createdDate: DateTimeStringValue(''),
                adviceExpiry: AdviceExpiryValue(''),
                zzAdvice: StringValue(fakeMockId),
                paymentBatchAdditionalInfo: StringValue(fakeMockId),
                accountingDocExternalReference: '',
                paymentItems: paymentList,
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('Hide When paymentInvoiceInfoPdf Empty', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.pdfView), findsNothing);
      });
      testWidgets('Show PdfPreview', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            paymentInvoiceInfoPdf: fakePaymentInvoiceInfoPdf,
            customerPaymentInfo: CustomerPaymentInfo.empty().copyWith(
              createdDate: DateTimeStringValue('2023-10-12'),
              adviceExpiry: AdviceExpiryValue('30 days'),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.pdfView),
          find.byType(ListView),
          const Offset(0, -500),
        );
        await tester.pump();
        expect(find.byKey(WidgetKeys.pdfView), findsOneWidget);
      });

      testWidgets('On Tap Pay Now Button And Get Url', (tester) async {
        final fakeUrl = Uri.parse('fake-url');
        when(() => autoRouterMock.pushNamed<Uri>('payments/payments_webview'))
            .thenAnswer((invocation) => Future.value(fakeUrl));
        when(
          () => autoRouterMock.pushAndPopUntil(
            const PaymentCompletedPageRoute(),
            predicate: any(named: 'predicate'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final buttonFinder = find.byKey(WidgetKeys.payButton);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.pushNamed<Uri>('payments/payments_webview'))
            .called(1);
        verify(
          () => trackMixpanelEvent(
            MixpanelEvents.paymentSuccess,
            props: {
              MixpanelProps.paymentAmount: 0,
              MixpanelProps.paymentMethod: '',
              MixpanelProps.paymentDocumentCount: 0,
              MixpanelProps.paymentAdviceId: '',
            },
          ),
        ).called(1);
        verify(
          () => newPaymentBlocMock.add(
            NewPaymentEvent.updatePaymentGateway(
              paymentUrl: fakeUrl,
            ),
          ),
        ).called(1);
        verify(
          () => autoRouterMock.pushAndPopUntil(
            const PaymentCompletedPageRoute(),
            predicate: any(named: 'predicate'),
          ),
        ).called(1);
      });

      testWidgets('On Tap Pay Now Button But Cannot Get Url', (tester) async {
        when(() => autoRouterMock.pushNamed<Uri>('payments/payments_webview'))
            .thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final buttonFinder = find.byKey(WidgetKeys.payButton);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.pushNamed<Uri>('payments/payments_webview'))
            .called(1);
        verify(
          () => trackMixpanelEvent(
            MixpanelEvents.paymentFailure,
            props: {
              MixpanelProps.errorMessage: 'Payment failed in webview',
              MixpanelProps.paymentMethod: '',
              MixpanelProps.paymentDocumentCount: 0,
              MixpanelProps.paymentAdviceId: '',
            },
          ),
        ).called(1);
        verify(
          () => autoRouterMock.popUntilRouteWithPath(
            'payments',
          ),
        ).called(1);
      });

      testWidgets(
          '=> Test Invoice/credit already in use dialog and click payment summary',
          (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isLoading: true,
            ),
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption: optionOf(fakeError),
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        when(
          () => autoRouterMock.pushAndPopUntil(
            const PaymentSummaryPageRoute(),
            predicate: any(named: 'predicate'),
          ),
        ).thenAnswer((invocation) => Future.value());
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: find.text('Invoice/credit already in use'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsOneWidget,
        );
        await tester.tap(confirmBottomSheetConfirmButton);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsNothing,
        );
      });

      testWidgets('=> Test Invoice/credit already in use dialog and click back',
          (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isLoading: true,
            ),
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption: optionOf(fakeError),
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        when(
          () => autoRouterMock.pushAndPopUntil(
            const NewPaymentPageRoute(),
            predicate: any(named: 'predicate'),
          ),
        ).thenAnswer((invocation) => Future.value());
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: find.text('Invoice/credit already in use'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetCancelButton,
          ),
          findsOneWidget,
        );
        await tester.tap(confirmBottomSheetCancelButton);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsNothing,
        );
      });

      testWidgets('After get customerPayment success and fetch PDF Invoice',
          (tester) async {
        final expectStates = [
          NewPaymentState.initial().copyWith(
            isLoading: true,
          ),
          NewPaymentState.initial().copyWith(
            isLoading: false,
            customerPaymentInfo:
                CustomerPaymentInfo.empty().copyWith(zzAdvice: 'fake-zzadvice'),
          ),
        ];

        whenListen(newPaymentBlocMock, Stream.fromIterable(expectStates));

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verify(
          () => newPaymentBlocMock.add(
            const NewPaymentEvent.fetchInvoiceInfoPdf(),
          ),
        ).called(1);
      });
    });
    group('APL Payment Method Test', () {
      testWidgets('Apl payment non fetch Payment Summary DetailsInfo',
          (tester) async {
        final paymentMethodOption = PaymentMethodOption.empty().copyWith(
          bankOptionId: BankOptionId('permata'),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    paymentMethodOption.copyWith(
                      bankOptionId: BankOptionId('mandiri'),
                    ),
                  ],
                ),
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [paymentMethodOption],
                ),
              ],
              isCreatingVirtualAccount: true,
            ),
            NewPaymentState.initial().copyWith(
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    paymentMethodOption.copyWith(
                      bankOptionId: BankOptionId('mandiri'),
                    ),
                  ],
                ),
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [paymentMethodOption],
                ),
              ],
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verifyNever(
          () => paymentSummaryDetailsBlocMock.add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              details: PaymentSummaryDetails.empty(),
            ),
          ),
        );
      });

      testWidgets('Apl payment fetch Payment Summary DetailsInfo',
          (tester) async {
        final paymentMethodOption = PaymentMethodOption.empty().copyWith(
          bankOptionId: BankOptionId('permata'),
        );
        final createVirtualAccount =
            CreateVirtualAccount.empty().copyWith(id: 'mock-id');

        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              createVirtualAccount: createVirtualAccount,
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    paymentMethodOption.copyWith(
                      bankOptionId: BankOptionId('mandiri'),
                    ),
                  ],
                ),
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [paymentMethodOption],
                ),
              ],
              isCreatingVirtualAccount: true,
            ),
            NewPaymentState.initial().copyWith(
              createVirtualAccount: createVirtualAccount,
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    paymentMethodOption.copyWith(
                      bankOptionId: BankOptionId('mandiri'),
                    ),
                  ],
                ),
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [paymentMethodOption],
                ),
              ],
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verify(
          () => paymentSummaryDetailsBlocMock.add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              details: PaymentSummaryDetails.empty().copyWith(
                paymentID: StringValue(createVirtualAccount.id),
                zzAdvice: StringValue(createVirtualAccount.id),
              ),
            ),
          ),
        ).called(1);
      });

      testWidgets('Apl payment Unable to create new payment', (tester) async {
        final paymentMethodOption = PaymentMethodOption.empty().copyWith(
          bankOptionId: BankOptionId('permata'),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    paymentMethodOption.copyWith(
                      bankOptionId: BankOptionId('mandiri'),
                    ),
                  ],
                ),
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [paymentMethodOption],
                ),
              ],
              isCreatingVirtualAccount: true,
            ),
            NewPaymentState.initial().copyWith(
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    paymentMethodOption.copyWith(
                      bankOptionId: BankOptionId('mandiri'),
                    ),
                  ],
                ),
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [paymentMethodOption],
                ),
              ],
              failureOrSuccessOption: optionOf(fakeError),
              isCreatingVirtualAccount: false,
              createVirtualAccountFailed: true,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          paymentAdviceFailed,
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: paymentAdviceFailed,
            matching: find.text('Payment Failed!'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: paymentAdviceFailed,
            matching: find.text(
              'Sorry your payment creation is failed, please do try again later',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: paymentAdviceFailed,
            matching: find.text(
              'Payment summary',
            ),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
