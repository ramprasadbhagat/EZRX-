import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_invoice/download_e_invoice_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_details_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/order_number_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/summary.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class ViewByOrderDetailsBlocMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class ViewByItemDetailsBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class DownloadEInvoiceBlocMock
    extends MockBloc<DownloadEInvoiceEvent, DownloadEInvoiceState>
    implements DownloadEInvoiceBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

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
  late ProductImageBlocMock productImageBlocMock;
  late ViewByOrderBlocMock viewByOrderBlocMock;
  late ViewByOrderDetailsBlocMock viewByOrderDetailsBlocMock;
  late ViewByItemDetailsBlocMock viewByItemDetailsBlocMock;
  late DownloadEInvoiceBlocMock downloadEInvoiceBlocMock;
  late DownloadPaymentAttachmentsBlocMock downloadPaymentAttachmentsBlocMock;
  late CreditAndInvoiceItem fakeInvoice;
  late CustomerDocumentDetail fakeInvoiceDetail;
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerFactory<ViewByOrderBloc>(() => viewByOrderBlocMock);
    locator
        .registerFactory<DownloadEInvoiceBloc>(() => downloadEInvoiceBlocMock);

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
    productImageBlocMock = ProductImageBlocMock();
    viewByOrderBlocMock = ViewByOrderBlocMock();
    viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
    viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
    downloadEInvoiceBlocMock = DownloadEInvoiceBlocMock();
    downloadPaymentAttachmentsBlocMock = DownloadPaymentAttachmentsBlocMock();

    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      orderId: StringValue('1234567'),
      accountingDocumentItem: '001',
      invoiceProcessingStatus: StatusType('Cleared'),
      documentReferenceID: StringValue('0810055826'),
    );
    fakeInvoiceDetail = CustomerDocumentDetail.empty().copyWith(
      salesDocumentItemType: StringValue('fake-salesDocumentItemType'),
      billingDocumentItem: '000010',
      materialNumber: MaterialNumber('000000000023046005'),
      billingDocumentItemText: "COZAARTABS50MG30'S",
      billingQuantity: IntegerValue('3'),
      billingQuantityUnit: 'BOX',
      salesMeasureISOUnit: 'BX',
      referenceSDDocument: '0800055109',
      referenceSDDocumentItem: '000010',
      referenceSDDocumentCategory: 'J',
      grossAmount: 0,
      netAmount: 360,
      taxAmount: 0,
      batchNumber: BatchNumber('V3475'),
      expiryDate: DateTimeStringValue('20500718'),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('fake-principalName'),
        principalCode: PrincipalCode('fake-principleCode'),
      ),
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
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => viewByOrderBlocMock.state)
        .thenReturn(ViewByOrderState.initial());
    when(() => viewByOrderDetailsBlocMock.state)
        .thenReturn(ViewByOrderDetailsState.initial());
    when(() => viewByItemDetailsBlocMock.state)
        .thenReturn(ViewByItemDetailsState.initial());
    when(() => downloadEInvoiceBlocMock.state)
        .thenReturn(DownloadEInvoiceState.initial());
    when(() => downloadPaymentAttachmentsBlocMock.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
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
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => viewByOrderBlocMock,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => viewByOrderDetailsBlocMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => viewByItemDetailsBlocMock,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => downloadPaymentAttachmentsBlocMock,
          ),
        ],
        child: const InvoiceDetailsPage(),
      ),
    );
  }

  group('Invoice Details Screen Test', () {
    group(' => Download e-invoice button test', () {
      testWidgets(' => download e-invoice button visible', (tester) async {
        when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
          CreditAndInvoiceDetailsState.initial().copyWith(
            itemsInfo: [fakeInvoiceDetail],
            basicInfo: fakeInvoice,
          ),
        );
        when(() => downloadEInvoiceBlocMock.state).thenReturn(
          DownloadEInvoiceState.initial().copyWith(
            eInvoice:
                DownloadPaymentAttachment.empty().copyWith(url: 'fake_url'),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();

        final downloadEInvoiceButton =
            find.byKey(WidgetKeys.downloadEInvoiceButton);
        expect(downloadEInvoiceButton, findsOneWidget);
        await tester.tap(downloadEInvoiceButton);
        await tester.pumpAndSettle();
      });
      testWidgets(' => download e-invoice button invisible', (tester) async {
        await getWidget(tester);
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.downloadEInvoiceButton), findsNothing);
      });
    });

    testWidgets(' => LoadingImage Test', (tester) async {
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
    });

    testWidgets(' => Detail page view Test', (tester) async {
      final expectedState = [
        CreditAndInvoiceDetailsState.initial().copyWith(
          isLoading: true,
          itemsInfo: [fakeInvoiceDetail],
        ),
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [fakeInvoiceDetail],
        ),
      ];

      whenListen(
        creditAndInvoiceDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsNothing);

      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.invoiceDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsOneWidget);
    });

    testWidgets(' => Show loading widget when order number section is loading',
        (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [fakeInvoiceDetail],
          basicInfo: fakeInvoice,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: true,
        ),
      );

      await getWidget(tester);
      await tester.pump();
      expect(find.byKey(WidgetKeys.invoiceDetailsPageListView), findsOneWidget);
      expect(find.byType(InvoiceDetailsSection), findsOneWidget);
      expect(find.byType(OrderNumberSection), findsOneWidget);
      expect(find.textContaining('Order number'), findsOneWidget);
      expect(
        find.byKey(
          WidgetKeys.invoiceDetailsOrderNumberLoading,
        ),
        findsOneWidget,
      );
    });
    testWidgets(' => Detail page order number onTap Test', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [fakeInvoiceDetail],
          basicInfo: fakeInvoice,
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.invoiceDetailsPageListView), findsOneWidget);
      expect(find.byType(InvoiceDetailsSection), findsOneWidget);
      expect(find.byType(OrderNumberSection), findsOneWidget);
      expect(find.textContaining('Order number'), findsOneWidget);
      final invoiceDetailsOrderNumberButton =
          find.byKey(WidgetKeys.invoiceDetailsOrderNumberButton);
      expect(
        invoiceDetailsOrderNumberButton,
        findsOneWidget,
      );
      await tester.tap(invoiceDetailsOrderNumberButton);
      await tester.pump();
      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: SearchKey.searchFilter(
              fakeInvoice.orderId.getOrCrash(),
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets(' => Order number section listen when onTap Test',
        (tester) async {
      final fakeViewByOrder = ViewByOrder.empty().copyWith(
        orderHeaders: [
          OrderHistoryDetails.empty(),
        ],
      );

      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(basicInfo: fakeInvoice),
      );
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial(),
          ViewByOrderState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(unit)),
            viewByOrderList: fakeViewByOrder,
            searchKey: SearchKey('test'),
          )
        ]),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      verify(
        () => viewByOrderDetailsBlocMock.add(
          ViewByOrderDetailsEvent.setOrderDetails(
            orderHistoryDetails: fakeViewByOrder.orderHeaders.first,
          ),
        ),
      ).called(1);
      verify(
        () => viewByItemDetailsBlocMock.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey(
              fakeInvoice.orderId.getOrDefaultValue(''),
            ),
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.name, ViewByOrderDetailsPageRoute.name);
    });

    testWidgets(
        ' => Order number section listen when onTap Test - failure case',
        (tester) async {
      const failureMessage = 'fakeMessage';
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(basicInfo: fakeInvoice),
      );
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial().copyWith(isFetching: true),
          ViewByOrderState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other(failureMessage))),
            searchKey: SearchKey.searchFilter('fake_searchKey'),
          )
        ]),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(
            failureMessage,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(' => Display invoice summary with ID market', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [fakeInvoiceDetail],
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.invoiceDetailsPageListView), findsOneWidget);
      expect(find.byType(InvoiceSummary), findsOneWidget);
    });

    testWidgets(' => Display invoice item section', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [fakeInvoiceDetail],
        ),
      );

      await getWidget(tester);
      await tester.pump();

      await tester.dragUntilVisible(
        find.byKey(
          WidgetKeys.invoiceDetailMaterialUnitPrice,
        ),
        find.byKey(
          WidgetKeys.invoiceDetailsPageListView,
        ),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle();

      expect(
        (tester.widget(
          find.byKey(WidgetKeys.invoiceDetailMaterialUnitPrice),
        ) as PriceComponent)
            .price,
        fakeInvoiceDetail.unitGrossPrice.toString(),
      );
      expect(
        find.descendant(
          of: find.byType(CommonTileItem),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text.toPlainText().contains(
                      StringUtils.displayPrice(
                        fakeMYSalesOrgConfigs,
                        fakeInvoiceDetail.netAmount,
                      ),
                    ),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Find Gov.No in Invoice Details Page', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(basicInfo: fakeInvoice),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await getWidget(tester);
      await tester.pump();

      final documentReferenceID =
          find.byKey(WidgetKeys.balanceTextRow('Gov. no', '0810055826'));
      expect(documentReferenceID, findsOneWidget);
    });
  });
}
