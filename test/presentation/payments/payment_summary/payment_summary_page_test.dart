import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class PaymentInProgressBlocMock
    extends MockBloc<PaymentInProgressEvent, PaymentInProgressState>
    implements PaymentInProgressBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class OutstandingInvoicesBlocMock
    extends MockBloc<OutstandingInvoicesEvent, OutstandingInvoicesState>
    implements OutstandingInvoicesBloc {}

class PaymentSummaryFilterBlocMock
    extends MockBloc<PaymentSummaryFilterEvent, PaymentSummaryFilterState>
    implements PaymentSummaryFilterBloc {}

class PaymentSummaryDetailBlocMock
    extends MockBloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState>
    implements PaymentSummaryDetailsBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class AvailableCreditsBlocMock
    extends MockBloc<AvailableCreditsEvent, AvailableCreditsState>
    implements AvailableCreditsBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

final locator = GetIt.instance;

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementBloc announcementBlocMock;
  late PaymentSummaryBloc paymentSummaryBloc;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;
  late PaymentSummaryFilterBloc paymentSummaryFilterBloc;
  late PaymentInProgressBloc paymentInProgressBlocMock;
  late EligibilityBloc eligibilityBloc;
  late List<PaymentSummaryDetails> paymentSummaryList;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late PaymentSummaryDetailBlocMock paymentSummaryDetailBlocMock;
  late AvailableCreditsBlocMock availableCreditsBlocMock;
  late NewPaymentBlocMock newPaymentBlocMock;

  final fakeToDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now().subtract(
        const Duration(days: 30),
      ),
    ),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    paymentSummaryList = [
      PaymentSummaryDetails.empty().copyWith(
        paymentAmount: 200,
        status: StatusType('In Progress'),
      )
    ];
  });
  setUp(() async {
    authBlocMock = AuthBlocMock();
    autoRouterMock = locator<AppRouter>();
    announcementBlocMock = AnnouncementBlocMock();
    paymentSummaryBloc = PaymentSummaryBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    paymentInProgressBlocMock = PaymentInProgressBlocMock();
    paymentSummaryFilterBloc = PaymentSummaryFilterBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    paymentSummaryDetailBlocMock = PaymentSummaryDetailBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
  });

  group('Payment Summary', () {
    setUp(() {
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => paymentSummaryBloc.state)
          .thenReturn(PaymentSummaryState.initial());
      when(() => downloadPaymentAttachmentsBloc.state)
          .thenReturn(DownloadPaymentAttachmentsState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => paymentSummaryFilterBloc.state)
          .thenReturn(PaymentSummaryFilterState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => paymentInProgressBlocMock.state)
          .thenReturn(PaymentInProgressState.initial());
      when(() => paymentSummaryDetailBlocMock.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => outstandingInvoicesBlocMock.state)
          .thenReturn(OutstandingInvoicesState.initial());
      when(() => availableCreditsBlocMock.state)
          .thenReturn(AvailableCreditsState.initial());
      when(() => newPaymentBlocMock.state)
          .thenReturn(NewPaymentState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<PaymentSummaryBloc>(
            create: (context) => paymentSummaryBloc,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => downloadPaymentAttachmentsBloc,
          ),
          BlocProvider<PaymentSummaryFilterBloc>(
            create: (context) => paymentSummaryFilterBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<PaymentInProgressBloc>(
            create: (context) => paymentInProgressBlocMock,
          ),
          BlocProvider<PaymentSummaryDetailsBloc>(
            create: (context) => paymentSummaryDetailBlocMock,
          ),
          BlocProvider<OutstandingInvoicesBloc>(
            create: (context) => outstandingInvoicesBlocMock,
          ),
          BlocProvider<AvailableCreditsBloc>(
            create: (context) => availableCreditsBlocMock,
          ),
          BlocProvider<NewPaymentBloc>(
            create: (context) => newPaymentBlocMock,
          ),
        ],
        child: const Scaffold(
          body: PaymentSummaryPage(),
        ),
      );
    }

    testWidgets('Payment Summary floatingActionButton Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      expect(
        find.byType(ScaleButton),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary Filter Status Initial - For SG Market',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.paymentSummaryFilterIcon));
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Pending', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('In Progress', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Failed', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful', false)),
        findsNothing,
      );
    });

    testWidgets(
        'Payment Summary Filter Status Initial - For Other Market (Except SG)',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          salesOrg: SalesOrg('2001'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.paymentSummaryFilterIcon));
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('In Progress', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Failed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Pending', false)),
        findsNothing,
      );
    });

    testWidgets('Payment Summary Filter Status Initial - For TH Market',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          salesOrg: SalesOrg('2900'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.paymentSummaryFilterIcon));
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('In Progress', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Failed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Pending', false)),
        findsNothing,
      );
    });

    testWidgets('Payment summary in progress amount test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: paymentSummaryList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('MYR'),
          ),
        ),
      );
      when(() => paymentInProgressBlocMock.state).thenReturn(
        PaymentInProgressState.initial().copyWith(
          amount: StringValue('200'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final paymentInProgress =
          find.text('In-progress: MYR 200.00', findRichText: true);
      expect(paymentInProgress, findsOneWidget);
    });
    testWidgets('Payment Summary tap download icon Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.cloud_download_outlined));
      await tester.pumpAndSettle();

      verify(
        () => downloadPaymentAttachmentsBloc.add(
          const DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(),
        ),
      ).called(1);
    });
    testWidgets('Payment Summary download icon failed Test', (tester) async {
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial(),
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
          ),
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsOneWidget,
      );

      await tester.tap(
        find.byIcon(Icons.cloud_download_outlined),
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      expect(
        find.widgetWithText(CustomSnackBar, 'Fake-error'),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary download icon success Test', (tester) async {
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(true)),
          ),
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(
        find.byIcon(Icons.cloud_download_outlined),
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      expect(
        find.byType(CustomSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary tap newPayment icon Test', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          user: fakeClientUser,
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byType(ScaleButton),
        findsOneWidget,
      );

      await tester.tap(find.byType(ScaleButton));

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: OutstandingInvoiceFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        ),
      ).called(1);
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      ).called(1);
      verify(
        () => newPaymentBlocMock.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            user: fakeClientUser,
          ),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary searchField and Filter Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.widgetWithText(
          TextFormField,
          'Search by payment advice / voucher no.',
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.paymentSummaryFilterIcon));
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.openFilterBottomSheet(
            appliedFilter: PaymentSummaryFilter.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary list not empty Test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          salesOrganization: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          details: [
            PaymentSummaryDetails.empty().copyWith(
              status: StatusType('In Progress'),
            )
          ],
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('Payment Summary user filter success Test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          appliedFilter: PaymentSummaryFilter.empty().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('300'),
            filterStatuses: [StatusType('In Progress')],
          ),
          details: [
            PaymentSummaryDetails.empty().copyWith(
              paymentAmount: 250,
              status: StatusType('In Progress'),
            )
          ],
        ),
      );

      whenListen(
        paymentSummaryBloc,
        Stream.fromIterable([
          PaymentSummaryState.initial(),
          PaymentSummaryState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
          ),
        ]),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.widgetWithText(CustomBadge, '3'), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('Payment Summary list empty Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('Payment Summary tap PaymentSummaryGroupItem Test',
        (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: [
            PaymentSummaryDetails.empty().copyWith(
              paymentAmount: 250,
              status: StatusType('In Progress'),
            )
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byType(ListTile),
        findsOneWidget,
      );

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryDetailBlocMock.add(
          PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
            salesOrganization: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            paymentSummaryDetails: PaymentSummaryDetails.empty().copyWith(
              paymentAmount: 250,
              status: StatusType('In Progress'),
            ),
          ),
        ),
      ).called(1);

      expect(
        find.byType(Divider),
        findsNothing,
      );
    });
    testWidgets('Payment Summary search Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(
          WidgetKeys.genericKey(
            key: paymentSummaryBloc.state.searchKey.searchValueOrEmpty,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      await tester.enterText(find.byType(TextFormField), 'fake-keyword');
      await tester.pump(const Duration(seconds: 2));

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter('fake-keyword'),
          ),
        ),
      ).called(1);
    });
    testWidgets('Payment Summary search submitted Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(
          WidgetKeys.genericKey(
            key: paymentSummaryBloc.state.searchKey.searchValueOrEmpty,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      await tester.enterText(find.byType(TextFormField), 'fake-keyword');
      await tester.pump(const Duration(seconds: 2));
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(SearchKey.searchFilter('fake-keyword').isValid(), true);

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter('fake-keyword'),
          ),
        ),
      ).called(2);
    });
    testWidgets('Payment Summary search onClear Test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          searchKey: SearchKey.searchFilter('fake-keyword'),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      expect(
        find.byIcon(Icons.clear),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump(const Duration(seconds: 2));

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary filter bottom sheet Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);
    });

    testWidgets('Payment Summary filter status Test', (tester) async {
      whenListen(
        paymentSummaryFilterBloc,
        Stream.fromIterable([
          PaymentSummaryFilterState.initial().copyWith(
            filter: PaymentSummaryFilter.empty()
                .copyWith(filterStatuses: [StatusType('In Progress')]),
          )
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);

      expect(find.byType(CheckboxListTile).first, findsOneWidget);

      await tester.tap(find.text('In Progress'));

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.statusChanged(
            StatusType('In Progress'),
            false,
          ),
        ),
      ).called(1);
    });
    testWidgets('Payment Summary filter resetButton Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);

      expect(find.byKey(WidgetKeys.filterResetButton), findsOneWidget);

      await tester.tap(find.byKey(WidgetKeys.filterResetButton));
      await tester.pumpAndSettle();
    });
    testWidgets('Payment Summary filter applyButton Test', (tester) async {
      whenListen(
        paymentSummaryFilterBloc,
        Stream.fromIterable([
          PaymentSummaryFilterState.initial().copyWith(
            filter: PaymentSummaryFilter.empty()
                .copyWith(filterStatuses: [StatusType('In Progress')]),
          )
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);

      expect(find.byKey(WidgetKeys.filterApplyButton), findsOneWidget);
      await tester.tap(
        find.byKey(WidgetKeys.filterApplyButton),
        warnIfMissed: false,
      );
      await tester.pump();

      verify(
        () => paymentSummaryFilterBloc.add(
          const PaymentSummaryFilterEvent.validateFilters(),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary toDocumentDateField',
        (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.toDocumentDateField), findsOneWidget);

      await tester.tap(find.byKey(WidgetKeys.toDocumentDateField));
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'.tr()));
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.setCreatedDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary fromDocumentDateField',
        (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.fromDocumentDateField), findsOneWidget);

      await tester.tap(find.byKey(WidgetKeys.fromDocumentDateField));
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'.tr()));
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.setCreatedDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary amountValueFrom', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.amountValueFrom), findsOneWidget);

      await tester.enterText(find.byKey(WidgetKeys.amountValueFrom), '100');
      await tester.pump();

      verify(
        () => paymentSummaryFilterBloc.add(
          const PaymentSummaryFilterEvent.amountValueFromChanged(
            '100',
          ),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary amountValueTo', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.amountValueTo), findsOneWidget);
      await tester.enterText(find.byKey(WidgetKeys.amountValueTo), '100');
      await tester.pump();

      verify(
        () => paymentSummaryFilterBloc.add(
          const PaymentSummaryFilterEvent.amountValueToChanged(
            '100',
          ),
        ),
      ).called(1);
    });

    testWidgets('Test onRefresh', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.dragFrom(const Offset(100, 300), const Offset(100, 1000));
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            searchKey: SearchKey.searchFilter(''),
            appliedFilter: PaymentSummaryFilter.empty(),
          ),
        ),
      ).called(1);
    });
    testWidgets(
        '=> AmountValueError Test when amountValueTo greater than amountValueFrom',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: PaymentSummaryFilter.empty().copyWith(
            amountValueFrom: RangeValue('15'),
            amountValueTo: RangeValue('12'),
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);

      await tester.tap(
        find.byKey(WidgetKeys.paymentSummaryFilter),
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      final findInvalidText = find.text('Invalid Amount range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });
  });
}
