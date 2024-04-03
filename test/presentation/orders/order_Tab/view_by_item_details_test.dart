import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/presentation/core/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart'
    as payment_term;

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ViewByItemDetailsBlockMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class CustomerLicenseBlocMock
    extends MockBloc<CustomerLicenseEvent, CustomerLicenseState>
    implements CustomerLicenseBloc {}

class ReOrderPermissionBlocMock
    extends MockBloc<ReOrderPermissionEvent, ReOrderPermissionState>
    implements ReOrderPermissionBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AllInvoicesBlocMock extends MockBloc<AllInvoicesEvent, AllInvoicesState>
    implements AllInvoicesBloc {}

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class ViewByOrderDetailsBlocMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class MockProductImageBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByItemsBloc viewByItemsBlocMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late AuthBloc mockAuthBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late ViewByOrderBloc viewByOrderBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late OrderHistoryItem fakeOrderHistoryItem;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late CartBloc cartBlocMock;
  late AllInvoicesBloc allInvoicesBlocMock;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late MixpanelService mixpanelServiceMock;
  late List<CreditAndInvoiceItem> fakeItemList;
  late ViewByOrder fakeOrder;
  late OrderHistory mockViewByItemsOrderHistory;
  late ProductImageBloc mockProductImageBloc;
  late MaterialPriceBloc materialPriceBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late List<CustomerLicense> customerLicense;

  const fakeCreatedDate = '20230412';
  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => viewByOrderBlocMock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());

    autoRouterMock = locator<AppRouter>();
    mixpanelServiceMock = MixpanelServiceMock();
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    locator.registerFactory<MixpanelService>(() => mixpanelServiceMock);
    locator.registerFactory<ReOrderPermissionBloc>(
      () => reOrderPermissionBlocMock,
    );
    locator.registerFactory<AllInvoicesBloc>(
      () => allInvoicesBlocMock,
    );

    fakeItemList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
    fakeOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    mockViewByItemsOrderHistory =
        await ViewByItemLocalDataSource().getViewByItems();
    fakeOrderHistoryItem = mockViewByItemsOrderHistory.orderHistoryItems
        .firstWhere((e) => e.isTypeMaterial)
        .copyWith(
          status: OrderStepValue('Picking in progress'),
          createdDate: DateTimeStringValue(fakeCreatedDate),
          governmentMaterialCode: 'fakegovernmentMaterialCode',
          batch: StringValue('fake-batch-number'),
          expiryDate: DateTimeStringValue('2023-10-04'),
          invoiceData: InvoiceData.empty()
              .copyWith(invoiceNumber: StringValue('123456')),
        );

    customerLicense =
        await CustomerLicenseLocalDataSource().getCustomerLicense();
  });
  group('Order History Details By Item Page', () {
    setUp(() async {
      cartBlocMock = CartBlocMock();
      viewByItemsBlocMock = ViewByItemsBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailsBlockMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      viewByOrderBlocMock = ViewByOrderBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      allInvoicesBlocMock = AllInvoicesBlocMock();
      creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
      viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();
      mockAuthBloc = MockAuthBloc();
      mockProductImageBloc = MockProductImageBloc();
      materialPriceBlocMock = MaterialPriceBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();

      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => viewByItemsBlocMock.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => viewByOrderBlocMock.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => viewByItemDetailsBlocMock.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial());
      //when(() => autoRouterMock.current).thenReturn(routeData);
      when(() => creditAndInvoiceDetailsBlocMock.state)
          .thenReturn(CreditAndInvoiceDetailsState.initial());
      when(() => viewByOrderDetailsBlocMock.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => poAttachmentBlocMock.state)
          .thenReturn(PoAttachmentState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeClientUser,
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfoWithCustomerGrp4,
        ),
      );
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial(),
      );
      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial(),
      );
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        useMediaQuery: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<ViewByItemsBloc>(
            create: (context) => viewByItemsBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => viewByOrderBlocMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => viewByItemDetailsBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: ((context) => eligibilityBlocMock),
          ),
          BlocProvider<ProductImageBloc>(
            create: ((context) => productImageBlocMock),
          ),
          BlocProvider<CartBloc>(
            create: ((context) => cartBlocMock),
          ),
          BlocProvider<ReOrderPermissionBloc>(
            create: ((context) => reOrderPermissionBlocMock),
          ),
          BlocProvider<CreditAndInvoiceDetailsBloc>(
            create: ((context) => creditAndInvoiceDetailsBlocMock),
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: ((context) => viewByOrderDetailsBlocMock),
          ),
          BlocProvider<AllInvoicesBloc>(
            create: ((context) => allInvoicesBlocMock),
          ),
          BlocProvider<PoAttachmentBloc>(
            create: ((context) => poAttachmentBlocMock),
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: ((context) => materialPriceBlocMock),
          ),
          BlocProvider<PaymentCustomerInformationBloc>(
            create: ((context) => paymentCustomerInformationBlocMock),
          ),
          BlocProvider<CustomerLicenseBloc>(
            create: (context) => customerLicenseBlocMock,
          ),
        ],
        child: const Material(
          child: ViewByItemDetailsPage(),
        ),
      );
    }

    testWidgets('loaderImage  test ', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final viewByOrderDetailsPageListView = find.byKey(WidgetKeys.scrollList);
      expect(viewByOrderDetailsPageListView, findsNothing);
    });

    testWidgets(
        'Show material combination code with GMC part when Government material code is enabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final combinationCode = find.text(
        '${fakeOrderHistoryItem.materialNumber.displayMatNo} | ${fakeOrderHistoryItem.governmentMaterialCode}',
      );
      expect(combinationCode, findsOneWidget);
    });

    testWidgets(
        'Show material combination code without GMC part when Government material code is disabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final materialNumber =
          find.text(fakeOrderHistoryItem.materialNumber.displayMatNo);
      expect(materialNumber, findsWidgets);
      final combinationCode = find.text(
        '${fakeOrderHistoryItem.materialNumber.displayMatNo} | ${fakeOrderHistoryItem.governmentMaterialCode}',
      );
      expect(combinationCode, findsNothing);
    });

    testWidgets(
        'test isAccountSuspended banner and buy again button is disabled when ship to code is blocked',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
          shipToInfo: fakeBlockedShipToInfo,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final customerBlockedBanner =
          find.byKey(WidgetKeys.customerBlockedBanner);

      expect(customerBlockedBanner, findsOneWidget);
      final button = find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
      await tester.tap(button);
      verifyNever(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.fetchItem(
            orderHistoryDetail: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            item: fakeOrderHistoryItem,
          ),
        ),
      );
    });

    testWidgets(
        'test isAccountSuspended banner and buy again button is disabled when customer code is blocked',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
          customerCodeInfo: fakeBlockedCustomerCodeInfo,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final customerBlockedBanner =
          find.byKey(WidgetKeys.customerBlockedBanner);

      expect(customerBlockedBanner, findsOneWidget);
      final button = find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
      await tester.tap(button);
      verifyNever(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.fetchItem(
            orderHistoryDetail: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            item: fakeOrderHistoryItem,
          ),
        ),
      );
    });

    testWidgets('When disableDeliveryDate is false', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryStatuses: [],
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final statusTrackerSection = find.byType(StatusTrackerSection);

      expect(statusTrackerSection, findsOneWidget);
      await tester.tap(statusTrackerSection);
      await tester.pump();
      final expectedDelivery = find.textContaining('Expected delivery');
      expect(expectedDelivery, findsOneWidget);
    });
    testWidgets('When disableDeliveryDate is true ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryStatuses: [],
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final statusTrackerSection = find.byType(
        StatusTrackerSection,
      );

      expect(statusTrackerSection, findsOneWidget);
      await tester.tap(statusTrackerSection);
      await tester.pump();
      final expectedDelivery = find.textContaining('Expected delivery');
      expect(expectedDelivery, findsNothing);
    });
    testWidgets('When enableSpecialInstructions is false', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsNothing);
    });

    testWidgets('When enableSpecialInstructions is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets('When enableReferenceNote is false', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final referenceNote = find.textContaining('Reference note');
      expect(referenceNote, findsNothing);
    });

    testWidgets('When enableReferenceNote is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final referenceNote = find.textContaining('Reference note');
      expect(referenceNote, findsOneWidget);
    });
    testWidgets('Find Order created Status', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryStatuses: [],
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            status: OrderStepValue('Order created'),
          ),
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final statusTrackerSection = find.byType(
        StatusTrackerSection,
      );

      expect(statusTrackerSection, findsOneWidget);
      await tester.tap(statusTrackerSection);
      await tester.pump();
      final expectedDelivery = find.textContaining('Order created');
      expect(expectedDelivery, findsWidgets);
    });

    testWidgets(
        ' => Hide Batch and EXP info when salesOrgConfig BatchNumDisplay is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem,
            ],
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${fakeOrderHistoryItem.expiryDate.dateOrDashString})',
      );
      expect(expectedDelivery, findsNothing);
    });

    testWidgets(
        ' => Display Batch and EXP info when salesOrgConfig BatchNumDisplay is true',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${fakeOrderHistoryItem.expiryDate.dateOrDashString})',
        findRichText: true,
      );
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets('on Offer material', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            promoStatus: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -500),
      );
      await tester.pump();
      expect(find.byWidget(ProductTag.onOfferIcon()), findsOneWidget);
    });

    testWidgets('bundle material', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            isBundle: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      await tester.pump();
      expect(find.byWidget(ProductTag.bundleOfferIcon()), findsOneWidget);
    });

    group('Buy again button -', () {
      setUp(() {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );

        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: fakeOrderHistoryItem,
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
          ),
        );
      });

      testWidgets('is visible when user role is not sales rep', (tester) async {
        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: fakeOrderHistoryItem,
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeRootAdminUser,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final button = find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
        await tester.tap(button);
        await tester.pump();

        verify(
          () => mixpanelServiceMock.trackEvent(
            eventName: MixpanelEvents.buyAgainClicked,
            properties: any(named: 'properties'),
          ),
        ).called(1);

        verify(
          () => reOrderPermissionBlocMock.add(
            ReOrderPermissionEvent.fetchItem(
              orderHistoryDetail: OrderHistory.empty().copyWith(
                orderHistoryItems: [fakeOrderHistoryItem],
              ),
              item: fakeOrderHistoryItem,
            ),
          ),
        ).called(1);
      });

      testWidgets('is not visible when user role is sales rep', (tester) async {
        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: fakeOrderHistoryItem,
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeInternalSalesRepUser,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton),
          findsNothing,
        );
      });
      testWidgets(
          'is not visible when user role is not customer for covid order',
          (tester) async {
        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem:
                fakeOrderHistoryItem.copyWith(orderType: DocumentType('ZPVF')),
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeRootAdminUser,
            salesOrgConfig: SalesOrganisationConfigs.empty()
                .copyWith(salesOrg: SalesOrg('2500')),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton),
          findsNothing,
        );
      });
      testWidgets('is visible when user role is customer for covid order',
          (tester) async {
        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem:
                fakeOrderHistoryItem.copyWith(orderType: DocumentType('ZPVF')),
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeClientUser,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton),
          findsOneWidget,
        );
      });

      testWidgets(
          'is snackbar visible when user role is not customer for covid order',
          (tester) async {
        final expectedState = [
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              Right(
                OrderHistory.empty().copyWith(
                  orderHistoryItems: [fakeOrderHistoryItem],
                ),
              ),
            ),
            orderHistoryItem:
                fakeOrderHistoryItem.copyWith(orderType: DocumentType('ZPVF')),
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeRootAdminUser,
            salesOrgConfig: SalesOrganisationConfigs.empty()
                .copyWith(salesOrg: SalesOrg('2500')),
          ),
        ];
        whenListen(
          viewByItemDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.text('You can’t re-order this order'),
          findsNothing,
        );
      });

      testWidgets('nothing happens when tap while loading', (tester) async {
        when(() => reOrderPermissionBlocMock.state).thenReturn(
          ReOrderPermissionState.initial().copyWith(isFetching: true),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final button = find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
        await tester.tap(button);
        await tester.pump();

        verifyNever(
          () => mixpanelServiceMock.trackEvent(
            eventName: MixpanelEvents.buyAgainClicked,
            properties: any(named: 'properties'),
          ),
        );

        verifyNever(
          () => reOrderPermissionBlocMock.add(
            ReOrderPermissionEvent.fetchItem(
              orderHistoryDetail: OrderHistory.empty().copyWith(
                orderHistoryItems: [fakeOrderHistoryItem],
              ),
              item: fakeOrderHistoryItem,
            ),
          ),
        );
      });

      testWidgets('show snackbar when checking permission failure',
          (tester) async {
        const fakeMessage = 'fake-message';
        whenListen(
          reOrderPermissionBlocMock,
          Stream.fromIterable([
            ReOrderPermissionState.initial().copyWith(isFetching: true),
            ReOrderPermissionState.initial().copyWith(
              isFetching: false,
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(fakeMessage))),
            ),
          ]),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        expect(
          tester
              .widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage))
              .data,
          fakeMessage.tr(),
        );
      });

      testWidgets('add to cart and redirect to cart page when reorder is valid',
          (tester) async {
        final fakeItem = MaterialInfo.empty().copyWith(
          quantity: MaterialQty(fakeOrderHistoryItem.qty),
        );
        whenListen(
          reOrderPermissionBlocMock,
          Stream.fromIterable([
            ReOrderPermissionState.initial().copyWith(isFetching: true),
            ReOrderPermissionState.initial().copyWith(
              isFetching: false,
              validOrderItems: [fakeItem],
            ),
          ]),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        verify(
          () => cartBlocMock.add(
            CartEvent.addHistoryItemsToCart(
              items: [fakeItem],
              counterOfferDetails: RequestCounterOfferDetails.empty(),
            ),
          ),
        ).called(1);
        expect(autoRouterMock.current.path, 'orders/cart');
      });
    });

    testWidgets('Header section test for VN', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeVNSalesOrgConfigs,
          user: fakeRootAdminUser,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final orderNumberSectionFinder = find.byType(OrderNumberSection);
      expect(orderNumberSectionFinder, findsOneWidget);
      final viewByItemsOrderDetailOrderDate =
          find.byKey(WidgetKeys.viewByItemsOrderDetailOrderDate);
      expect(viewByItemsOrderDetailOrderDate, findsOneWidget);
      final invoiceSectionFinder = find.byType(InvoiceNumberSection);
      expect(invoiceSectionFinder, findsOneWidget);
      final viewByItemsOrderDetailPoReference =
          find.byKey(WidgetKeys.viewByItemsOrderDetailPoReference);
      expect(viewByItemsOrderDetailPoReference, findsOneWidget);
      final viewByItemsOrderDetailsContactPerson =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsContactPerson);
      expect(viewByItemsOrderDetailsContactPerson, findsOneWidget);
      final viewByItemsOrderDetailsContactNumber =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsContactNumber);
      expect(viewByItemsOrderDetailsContactNumber, findsOneWidget);
    });

    testWidgets('Header section test For TH', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
          user: fakeRootAdminUser,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final orderNumberSectionFinder = find.byType(OrderNumberSection);
      expect(orderNumberSectionFinder, findsOneWidget);
      final viewByItemsOrderDetailOrderDate =
          find.byKey(WidgetKeys.viewByItemsOrderDetailOrderDate);
      expect(viewByItemsOrderDetailOrderDate, findsOneWidget);
      final invoiceSectionFinder = find.byType(InvoiceNumberSection);
      expect(invoiceSectionFinder, findsOneWidget);
      final viewByItemsOrderDetailPoReference =
          find.byKey(WidgetKeys.viewByItemsOrderDetailPoReference);
      expect(viewByItemsOrderDetailPoReference, findsOneWidget);
      final viewByItemsOrderDetailsRequestedDeliveryDate =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsRequestedDeliveryDate);
      expect(viewByItemsOrderDetailsRequestedDeliveryDate, findsOneWidget);
      final viewByItemAttachmentSection =
          find.byType(ViewByItemAttachmentSection);
      expect(viewByItemAttachmentSection, findsOneWidget);
    });

    testWidgets('Invoice Number section loading test ', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loadingWidgetFinder =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsInvoiceNumberLoading);
      expect(loadingWidgetFinder, findsOneWidget);
    });
    testWidgets('Invoice Number section failure test ', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );
      final expectedStates = [
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake_error'))),
          items: fakeItemList,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verifyNever(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: fakeItemList.first,
          ),
        ),
      );
    });
    testWidgets('Invoice Number section test salesRep', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeSalesRepUser.copyWith(disablePaymentAccess: true),
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );

      final expectedStates = [
        AllInvoicesState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(fakeItemList)),
          items: fakeItemList,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      ).called(1);
      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: fakeItemList.first,
          ),
        ),
      ).called(1);
      final invoiceNoTextFinder = find.text(
        fakeOrderHistoryItem.invoiceData.invoiceNumber.getOrDefaultValue(''),
      );
      expect(invoiceNoTextFinder, findsWidgets);
      final iconFinder =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsInvoiceNumberButton);
      expect(iconFinder, findsNothing);
    });

    testWidgets('Invoice Number section test rootadmin', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeRootAdminUser,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );

      final expectedStates = [
        AllInvoicesState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(fakeItemList)),
          items: fakeItemList,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      ).called(1);
      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: fakeItemList.first,
          ),
        ),
      ).called(1);
      final invoiceNoTextFinder = find.text(
        fakeOrderHistoryItem.invoiceData.invoiceNumber.getOrDefaultValue(''),
      );
      expect(invoiceNoTextFinder, findsWidgets);
      final iconFinder =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsInvoiceNumberButton);
      expect(iconFinder, findsOneWidget);
      await tester.tap(iconFinder);
      await tester.pump();
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter().copyWith(
              searchKey: SearchKey.searchFilter(
                fakeOrderHistoryItem.invoiceData.invoiceNumber
                    .getOrDefaultValue(''),
              ),
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets('Order Number section loading test ', (tester) async {
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loadingWidgetFinder =
          find.byKey(WidgetKeys.viewByOrderOrderNumberLoading);
      expect(loadingWidgetFinder, findsOneWidget);
    });

    testWidgets('Order Number section failure test ', (tester) async {
      const failureMessage = 'fakeMessage';
      final expectedStates = [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
        ),
        ViewByOrderState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other(failureMessage))),
          searchKey: SearchKey.searchFilter('fake_searchKey'),
        ),
      ];
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verifyNever(
        () => viewByOrderDetailsBlocMock.add(
          ViewByOrderDetailsEvent.setOrderDetails(
            orderHistoryDetails: fakeOrder.orderHeaders.first,
          ),
        ),
      );
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
    testWidgets('Order Number section test ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeRootAdminUser,
          shipToInfo: fakeShipToInfo,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      );

      final expectedStates = [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
        ),
        ViewByOrderState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(fakeOrder)),
          viewByOrderList: fakeOrder,
          searchKey: SearchKey('fake_searchKey'),
        ),
      ];
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            user: fakeRootAdminUser,
            sortDirection: 'desc',
            shipToInfo: fakeShipToInfo,
          ),
        ),
      ).called(1);
      verify(
        () => viewByOrderDetailsBlocMock.add(
          ViewByOrderDetailsEvent.setOrderDetails(
            orderHistoryDetails: fakeOrder.orderHeaders.first,
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.name, ViewByOrderDetailsPageRoute.name);

      final orderNoTextFinder = find.textContaining(
        fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
        findRichText: true,
      );
      expect(orderNoTextFinder, findsWidgets);
      final iconFinder = find.byKey(WidgetKeys.viewByOrderOrderNumberButton);
      expect(iconFinder, findsOneWidget);
      await tester.tap(iconFinder);
      await tester.pump();
      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: SearchKey.searchFilter(
              fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
            ),
            isDetailsPage: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('Attachment Section test with no data', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByItemAttachmentSection =
          find.byType(ViewByItemAttachmentSection);
      expect(viewByItemAttachmentSection, findsOneWidget);
      final attachmentSection = find.textContaining('Attachments');
      expect(attachmentSection, findsOneWidget);
      final noAttachmentSection =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsNoAttachments);
      expect(noAttachmentSection, findsOneWidget);
    });

    testWidgets('Attachment Section test with data', (tester) async {
      final fakeOrderHistoryItemWithAttachments = fakeOrderHistoryItem.copyWith(
        orderHistoryItemPoAttachments: [
          PoDocuments.empty().copyWith(name: 'fake_name1', url: 'fake_url1'),
        ],
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItemWithAttachments,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithAttachments],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByItemAttachmentSection =
          find.byType(ViewByItemAttachmentSection);
      expect(viewByItemAttachmentSection, findsOneWidget);
      final attachmentSection = find.textContaining('Attachments');
      expect(attachmentSection, findsOneWidget);
      final attachmentDownloadButton =
          find.byKey(WidgetKeys.genericKey(key: 'fake_name1DownloadButton'));
      expect(attachmentDownloadButton, findsOneWidget);
      await tester.tap(attachmentDownloadButton);
      await tester.pump();
      verify(
        () => poAttachmentBlocMock.add(
          PoAttachmentEvent.downloadFile(
            files: [
              fakeOrderHistoryItemWithAttachments
                  .orderHistoryItemPoAttachments.first,
            ],
          ),
        ),
      ).called(1);
    });
    testWidgets('Attachment Section view more test with data', (tester) async {
      final fakeOrderHistoryItemWithAttachments = fakeOrderHistoryItem.copyWith(
        orderHistoryItemPoAttachments: [
          PoDocuments.empty().copyWith(name: 'fake_name1', url: 'fake_url1'),
          PoDocuments.empty().copyWith(name: 'fake_name2', url: 'fake_url2'),
        ],
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isExpanded: true,
          orderHistoryItem: fakeOrderHistoryItemWithAttachments,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithAttachments],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByItemAttachmentSection =
          find.byType(ViewByItemAttachmentSection);
      expect(viewByItemAttachmentSection, findsOneWidget);
      final attachmentSection = find.textContaining('Attachments');
      expect(attachmentSection, findsOneWidget);
      final attachmentDownloadButton =
          find.byKey(WidgetKeys.genericKey(key: 'fake_name1DownloadButton'));
      expect(attachmentDownloadButton, findsOneWidget);
      final viewByItemsOrderDetailsShowMoreAttachments =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsShowMoreAttachments);
      expect(viewByItemsOrderDetailsShowMoreAttachments, findsOneWidget);
      await tester.tap(viewByItemsOrderDetailsShowMoreAttachments);
      await tester.pump();
      verify(
        () => viewByItemDetailsBlocMock.add(
          const ViewByItemDetailsEvent.updateIsExpanded(
            isExpanded: false,
          ),
        ),
      ).called(1);
    });
    testWidgets('Attachment Section Download Success test', (tester) async {
      final fakeOrderHistoryItemWithAttachments = fakeOrderHistoryItem.copyWith(
        orderHistoryItemPoAttachments: [
          PoDocuments.empty().copyWith(name: 'fake_name1', url: 'fake_url1'),
        ],
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isExpanded: true,
          orderHistoryItem: fakeOrderHistoryItemWithAttachments,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithAttachments],
          ),
        ),
      );
      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
        ),
        PoAttachmentState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Right(PermissionStatus)),
          fileOperationMode: FileOperationMode.download,
        ),
      ];
      whenListen(
        poAttachmentBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByItemAttachmentSection =
          find.byType(ViewByItemAttachmentSection);
      expect(viewByItemAttachmentSection, findsOneWidget);
      final attachmentSection = find.textContaining('Attachments');
      expect(attachmentSection, findsOneWidget);
    });

    testWidgets('Attachment Section Download failure test', (tester) async {
      final fakeOrderHistoryItemWithAttachments = fakeOrderHistoryItem.copyWith(
        orderHistoryItemPoAttachments: [
          PoDocuments.empty().copyWith(name: 'fake_name1', url: 'fake_url1'),
        ],
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isExpanded: true,
          orderHistoryItem: fakeOrderHistoryItemWithAttachments,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithAttachments],
          ),
        ),
      );
      final expectedStates = [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
        ),
        PoAttachmentState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fakeMessage'))),
          fileOperationMode: FileOperationMode.download,
        ),
      ];
      whenListen(
        poAttachmentBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByItemAttachmentSection =
          find.byType(ViewByItemAttachmentSection);
      expect(viewByItemAttachmentSection, findsOneWidget);
      final attachmentSection = find.textContaining('Attachments');
      expect(attachmentSection, findsOneWidget);
      final successMsg =
          find.textContaining('Attachments downloaded successfully.');
      expect(successMsg, findsNothing);
    });

    testWidgets('When contact person is empty - NA should display',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.balanceTextRow('Contact person', 'NA')),
        findsOneWidget,
      );
    });
    testWidgets(' => QuantityAndPriceWithTax test for TH market',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            unitPrice: 60,
            qty: 30,
            tax: 126,
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final expectedNetPrice = find.text(
        'THB 1,800.00',
        findRichText: true,
      );
      expect(expectedNetPrice, findsOneWidget);
      final taxPercentage = find.text(
        '(210.0% ${'tax'.tr()})',
      );
      expect(taxPercentage, findsOneWidget);

      final expectedPrice = find.text(
        'THB 5,580.00',
        findRichText: true,
      );
      expect(expectedPrice, findsOneWidget);
    });

    testWidgets(' => Order history Tax calculation test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            unitPrice: 136.5,
            qty: 5,
            tax: 68.25,
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final expectedTax = find.text(
        '(50.0% tax)',
      );
      expect(expectedTax, findsOneWidget);
    });
    // TODO:Revisit while ID tax improvement
    // testWidgets(' => QuantityAndPriceWithTax test for ID market',
    //     (tester) async {
    //   when(() => eligibilityBlocMock.state).thenReturn(
    //     EligibilityState.initial().copyWith(
    //       salesOrganisation: SalesOrganisation.empty().copyWith(
    //         salesOrg: SalesOrg('1900'),
    //       ),
    //       salesOrgConfigs: fakeIDSalesOrgConfigs,
    //     ),
    //   );
    //   when(() => viewByItemDetailsBlocMock.state).thenReturn(
    //     ViewByItemDetailsState.initial().copyWith(
    //       isLoading: true,
    //     ),
    //   );
    //   final expectedStates = [
    //     ViewByItemDetailsState.initial().copyWith(
    //       orderHistoryItem: fakeOrderHistoryItem.copyWith(
    //         unitPrice: 116640,
    //         qty: 5,
    //         tax: 12830.4,
    //       ),
    //     ),
    //   ];
    //   whenListen(
    //     viewByItemDetailsBlocMock,
    //     Stream.fromIterable(expectedStates),
    //   );
    //   await tester.pumpWidget(getScopedWidget());
    //   await tester.pumpAndSettle();
    //   final expectedNetPrice = find.text(
    //     'IDR 583,200.00',
    //     findRichText: true,
    //   );
    //   expect(expectedNetPrice, findsOneWidget);
    //   await tester.pump();
    //   final taxPercentage = find.text(
    //     '(11.0% ${'tax'.tr()})',
    //   );
    //   expect(taxPercentage, findsOneWidget);
    //   await tester.pump();
    //   final expectedPrice = find.text(
    //     'IDR 647,352.00',
    //     findRichText: true,
    //   );
    //   expect(expectedPrice, findsOneWidget);
    // });

    testWidgets(' => QuantityAndPriceWithTax test for MY market',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            unitPrice: 60,
            qty: 30,
            tax: 126,
            totalPrice: 1926.00,
          ),
        ),
      ];
      whenListen(
        viewByItemDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final expectedPrice = find.text(
        'MYR 1,926.00',
        findRichText: true,
      );
      expect(expectedPrice, findsOneWidget);
    });

    testWidgets(
        'test view by item details item has price not available for PnG',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem: mockViewByItemsOrderHistory.orderHistoryItems.last,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              mockViewByItemsOrderHistory.orderHistoryItems.last,
            ],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('external_sales_rep'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final priceNotAvailableFinder = find.text(
        'Price Not Available',
        findRichText: true,
      );
      expect(priceNotAvailableFinder, findsNWidgets(2));
    });

    testWidgets(
        'List price strike through price visible, if final price is less than list price && enableListPrice = true',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));

      final fakeOrderHistoryItemWithCounterOffer =
          fakeOrderHistoryItem.copyWith(
        originPrice: 100.1,
        unitPrice: 98.0,
        isCounterOffer: true,
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItemWithCounterOffer,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithCounterOffer],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.dragUntilVisible(
        find.byType(ItemDetailsSection),
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains('100.1'),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'List price strike through price not visible, if final price is less than list price && enableListPrice = false',
        (tester) async {
      final fakeOrderHistoryItemWithCounterOffer =
          fakeOrderHistoryItem.copyWith(
        originPrice: 100.1,
        unitPrice: 98.0,
        isCounterOffer: true,
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItemWithCounterOffer,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithCounterOffer],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains('100.1'),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });

    testWidgets(
        'List price strike through price not visible, if final price is greater than list price && enableListPrice = true',
        (tester) async {
      const originPrice = 80.0;
      const unitPrice = 100.0;
      final fakeOrderHistoryItemWithCounterOffer =
          fakeOrderHistoryItem.copyWith(
        originPrice: 80,
        unitPrice: unitPrice,
        isCounterOffer: true,
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItemWithCounterOffer.copyWith(
            originPrice: originPrice,
            unitPrice: unitPrice,
          ),
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithCounterOffer],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains('$originPrice'),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });

    testWidgets('BillToInfo when enable bill to true', (tester) async {
      await tester.binding.setSurfaceSize(const Size(600, 900));

      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeKHSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
        ),
      );

      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation:
              await PaymentCustomerInformationLocalDataSource()
                  .getPaymentCustomerInformation(),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.payerInformation), findsOneWidget);
    });

    testWidgets('BillToInfo when enable bill to true billToInfo is empty',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeKHSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
        ),
      );

      when(() => paymentCustomerInformationBlocMock.state).thenAnswer(
        (invocation) => PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: PaymentCustomerInformation.empty(),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.payerInformation), findsNothing);
    });

    testWidgets('BillToInfo when enable bill to false', (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeTWSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.payerInformation), findsNothing);
    });

    testWidgets(
        'Display counter offer requested for PnG materials with price not available',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      final pnGMaterial =
          mockViewByItemsOrderHistory.orderHistoryItems.last.copyWith(
        originPrice: 80.00,
        isCounterOffer: true,
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem: pnGMaterial,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [pnGMaterial],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final priceNotAvailableFinder = find.text(
        'Price Not Available',
        findRichText: true,
      );
      expect(priceNotAvailableFinder, findsNWidgets(2));

      final requestedCounterOfferKey =
          find.text('Requested counter offer'.tr());
      expect(requestedCounterOfferKey, findsOneWidget);
    });

    testWidgets('Test Payment Term when disable payment term display is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: OrderHistory.empty().copyWith(
            orderBasicInformation: OrderHistoryBasicInfo.empty().copyWith(
              paymentTerm: payment_term.PaymentTerm.empty().copyWith(
                paymentTermCode: 'K001',
                paymentTermDescription: '30 Days from EOM, due EOM',
              ),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentTerm), findsOneWidget);

      expect(find.text('K001-30 Days from EOM, due EOM'), findsOneWidget);
    });

    testWidgets('Test Payment Term when disable payment term display is enable',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            disablePaymentTermsDisplay:
                true, //need this value to test this scenario
          ),
        ),
      );

      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: OrderHistory.empty().copyWith(
            orderBasicInformation: OrderHistoryBasicInfo.empty().copyWith(
              paymentTerm: payment_term.PaymentTerm.empty().copyWith(
                paymentTermCode: 'K001',
                paymentTermDescription: '30 Days from EOM, due EOM',
              ),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentTerm), findsNothing);

      expect(find.text('K001-30 Days from EOM, due EOM'), findsNothing);
    });

    testWidgets(
        'Show seller and MP logo at header + Display batch & expiry date as NA for MP order item',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem.copyWith(isMarketPlace: true),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final header = find.byType(ViewByItemDetailsHeaderSection);
      final detail = find.byType(ItemDetailsSection);
      final sellerName = fakeOrderHistoryItem.principalData.principalName.name;
      expect(
        find.descendant(
          of: header,
          matching: find.byType(MarketPlaceRectangleLogo),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: header,
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is MarketPlaceSellerTitle &&
                widget.sellerName == sellerName,
          ),
        ),
        findsOneWidget,
      );

      await tester.dragUntilVisible(
        detail,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -300),
      );
      expect(
        find.descendant(of: detail, matching: find.text(sellerName)),
        findsNothing,
      );
      final batchExpiryDate = tester
          .widget<RichText>(find.byKey(WidgetKeys.commonTileItemHeader))
          .text
          .toPlainText();
      expect(batchExpiryDate, contains('Batch NA (EXP: NA)'));
    });

    testWidgets(
      ' -> Find edi if customer info status is edi',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeEDICustomerCodeInfo,
          ),
        );
        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem:
                fakeOrderHistoryItem.copyWith(orderType: DocumentType('ZPVF')),
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeClientUser,
            customerCodeInfo: fakeEDICustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(ediBanner, findsOneWidget);
        expect(ediBannerTitle, findsOneWidget);
        expect(ediBannerSubTitle, findsOneWidget);

        final buyAgainButton =
            find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
        expect(buyAgainButton, findsNothing);
      },
    );

    testWidgets(
      ' -> Not Find edi if customer info status is not edi',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
        when(() => viewByItemDetailsBlocMock.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem:
                fakeOrderHistoryItem.copyWith(orderType: DocumentType('ZPVF')),
            orderHistory: OrderHistory.empty().copyWith(
              orderHistoryItems: [fakeOrderHistoryItem],
            ),
            user: fakeClientUser,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
        final ediBannerTitle = find.text('You are an EDI customer.');
        final ediBannerSubTitle = find.text(
          'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
        );
        expect(ediBanner, findsNothing);
        expect(ediBannerTitle, findsNothing);
        expect(ediBannerSubTitle, findsNothing);

        final buyAgainButton =
            find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
        expect(buyAgainButton, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find License expired banner in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial()
              .copyWith(customerLicenses: customerLicense),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);

        final licenseExpiredBannerTitle = find.text(
          'You have licenses that are about to expire or has expired.',
        );
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsOneWidget);
        expect(licenseExpiredBannerTitle, findsOneWidget);
        expect(licenseExpiredBannerSubTitle, findsOneWidget);
      },
    );

    testWidgets(
      ' -> License expired banner not visible in home tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        when(() => customerLicenseBlocMock.state).thenReturn(
          CustomerLicenseState.initial().copyWith(customerLicenses: []),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final licenseExpiredBanner =
            find.byKey(WidgetKeys.licenseExpiredBanner);
        final licenseExpiredBannerTitle = find.text(
          'You have licenses that are about to expire or has expired.',
        );
        final licenseExpiredBannerSubTitle = find.text(
          'To continue using eZRx+, please renew your license.',
        );

        expect(licenseExpiredBanner, findsNothing);
        expect(licenseExpiredBannerTitle, findsNothing);
        expect(licenseExpiredBannerSubTitle, findsNothing);
      },
    );
  });
}
