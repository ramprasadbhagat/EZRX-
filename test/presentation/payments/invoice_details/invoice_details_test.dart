import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;

  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CreditAndInvoiceItem fakeInvoice;
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();

    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();

    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      accountingDocumentItem: '001',
      invoiceProcessingStatus: StatusType('Cleared'),
    );

    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<CreditAndInvoiceDetailsBloc>(
            create: (context) => creditAndInvoiceDetailsBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: InvoiceDetailsPage(
          invoiceItem: fakeInvoice,
        ),
      ),
    );
  }

  group('Invoice Details Screen Test', () {
    testWidgets('=> LoadingImage  Test', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );

      await getWidget(tester);
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.invoiceDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsNothing);

      await tester.pump();
    });
  });

  // testWidgets('=> BasicInformationSection test', (tester) async {
  //   final expectedState = [
  //     CreditAndInvoiceDetailsState.initial().copyWith(
  //       failureOrSuccessOption: none(),
  //       isLoading: true,
  //     ),
  //     CreditAndInvoiceDetailsState.initial().copyWith(
  //       isLoading: false,
  //       failureOrSuccessOption: optionOf(const Right('')),
  //       details: fakeCreditAndInvoiceDetails,
  //     ),
  //   ];
  //   whenListen(
  //       creditAndInvoiceDetailsBlocMock, Stream.fromIterable(expectedState));

  //   await getWidget(tester);

  //   await tester.pump(const Duration(milliseconds: 100));

  //   expect(find.byType(BasicInformationSection), findsOneWidget);

  //   final findBasicInformationText = find.text('Basic Information'.tr());
  //   expect(findBasicInformationText, findsOneWidget);

  //   final findCustomerNameText = find.text('Customer Name'.tr());
  //   expect(findCustomerNameText, findsOneWidget);

  //   final findPayerText = find.text('Payer'.tr());
  //   expect(findPayerText, findsOneWidget);

  //   final findShipToText = find.text('Ship To'.tr());
  //   expect(findShipToText, findsOneWidget);
  // });

  // testWidgets('=> CreditAndInvoiceDetailsSection test', (tester) async {
  //   final expectedState = [
  //     CreditAndInvoiceDetailsState.initial().copyWith(
  //       failureOrSuccessOption: none(),
  //       isLoading: true,
  //     ),
  //     CreditAndInvoiceDetailsState.initial().copyWith(
  //       isLoading: false,
  //       failureOrSuccessOption: optionOf(const Right('')),
  //       details: fakeCreditAndInvoiceDetails,
  //     ),
  //   ];
  //   whenListen(
  //       creditAndInvoiceDetailsBlocMock, Stream.fromIterable(expectedState));

  //   await getWidget(tester);

  //   await tester.pump(const Duration(milliseconds: 100));

  //   expect(find.byType(InvoiceDetailsSection), findsOneWidget);

  //   final findBasicInformationText = find.text('Invoice Details'.tr());
  //   expect(findBasicInformationText, findsOneWidget);

  //   final findDueDateText = find.text('Due Date'.tr());
  //   expect(findDueDateText, findsOneWidget);

  //   final findInvoiceNumberText = find.text('Invoice Number'.tr());
  //   expect(findInvoiceNumberText, findsOneWidget);

  //   final findInvoiceDateText = find.text('Invoice Date'.tr());
  //   expect(findInvoiceDateText, findsOneWidget);

  //   final findInvoiceAmountText = find.text('Invoice Amount'.tr());
  //   expect(findInvoiceAmountText, findsOneWidget);

  //   final findOrderIDText = find.text('Order ID'.tr());
  //   expect(findOrderIDText, findsOneWidget);

  //   final findStatusText = find.text('Status'.tr());
  //   expect(findStatusText, findsOneWidget);
  // });

  // group('=> InvoiceItemsSection test', () {
  //   testWidgets('=> InvoiceItemsSection loading test', (tester) async {
  //     final expectedState = [
  //       CreditAndInvoiceDetailsState.initial().copyWith(
  //         failureOrSuccessOption: none(),
  //         isLoading: true,
  //       ),
  //     ];
  //     whenListen(creditAndInvoiceDetailsBlocMock,
  //         Stream.fromIterable(expectedState));

  //     await getWidget(tester);

  //     await tester.pump(const Duration(milliseconds: 100));

  //     expect(find.byType(InvoiceItemsSection), findsOneWidget);

  //     expect(find.byType(LoadingShimmer), findsOneWidget);
  //   });
  //   testWidgets('=> Invoice Items empty', (tester) async {
  //     final expectedState = [
  //       CreditAndInvoiceDetailsState.initial().copyWith(
  //         failureOrSuccessOption: none(),
  //         isLoading: true,
  //       ),
  //       CreditAndInvoiceDetailsState.initial().copyWith(
  //         isLoading: false,
  //         failureOrSuccessOption: optionOf(const Right('')),
  //         details: <CustomerDocumentDetail>[],
  //       ),
  //     ];
  //     whenListen(creditAndInvoiceDetailsBlocMock,
  //         Stream.fromIterable(expectedState));

  //     await getWidget(tester);
  //     await tester.pumpAndSettle();

  //     expect(find.byType(InvoiceItemsSection), findsOneWidget);

  //     expect(find.text('No files found'.tr()), findsOneWidget);
  //   });

  //   testWidgets('=> Invoice Items not empty', (tester) async {
  //     final expectedState = [
  //       CreditAndInvoiceDetailsState.initial().copyWith(
  //         failureOrSuccessOption: none(),
  //         isLoading: true,
  //       ),
  //       CreditAndInvoiceDetailsState.initial().copyWith(
  //         isLoading: false,
  //         failureOrSuccessOption: optionOf(const Right('')),
  //         details: fakeCreditAndInvoiceDetails,
  //       ),
  //     ];
  //     whenListen(creditAndInvoiceDetailsBlocMock,
  //         Stream.fromIterable(expectedState));

  //     await getWidget(tester);
  //     await tester.pumpAndSettle();

  //     expect(find.byType(InvoiceItemsSection), findsOneWidget);

  //     final findInvoiceItemDetailsText =
  //         find.text('Invoice Item Details'.tr());
  //     expect(findInvoiceItemDetailsText, findsOneWidget);

  //     final findTypeText = find.text('Type'.tr());
  //     expect(findTypeText, findsAtLeastNWidgets(1));

  //     final findNumberText = find.text('Number'.tr());
  //     expect(findNumberText, findsAtLeastNWidgets(1));

  //     final findDescriptionText = find.text('Description'.tr());
  //     expect(findDescriptionText, findsAtLeastNWidgets(1));

  //     final findUnitOfMeasureText = find.text('Unit of Measure'.tr());
  //     expect(findUnitOfMeasureText, findsAtLeastNWidgets(1));

  //     final findQuantityText = find.text('Quantity'.tr());
  //     expect(findQuantityText, findsAtLeastNWidgets(1));

  //     final findUnitPriceText = find.text('Unit Price'.tr());
  //     expect(findUnitPriceText, findsAtLeastNWidgets(1));

  //     final findTotalPriceText = find.text('Total Price'.tr());
  //     expect(findTotalPriceText, findsAtLeastNWidgets(1));

  //     final findMaterialText = find.text('Material'.tr());
  //     expect(findMaterialText, findsAtLeastNWidgets(1));

  //     final findReferenceSDSDocumentText =
  //         find.text('Reference SDS Document'.tr());
  //     expect(findReferenceSDSDocumentText, findsAtLeastNWidgets(1));

  //     final findReferenceSDSDocumentCategoryText =
  //         find.text('Reference SDS Document Category'.tr());
  //     expect(findReferenceSDSDocumentCategoryText, findsAtLeastNWidgets(1));

  //     final findReferenceSDSDocumentItemText =
  //         find.text('Reference SDS Document Item'.tr());
  //     expect(findReferenceSDSDocumentItemText, findsAtLeastNWidgets(1));

  //     final findSalesMeasureISOUnitText =
  //         find.text('Sales Measure ISO Unit'.tr());
  //     expect(findSalesMeasureISOUnitText, findsAtLeastNWidgets(1));

  //     final findTaxAmountText = find.text('Tax Amount'.tr());
  //     expect(findTaxAmountText, findsAtLeastNWidgets(1));
  //   });
  // });
  // });
}
