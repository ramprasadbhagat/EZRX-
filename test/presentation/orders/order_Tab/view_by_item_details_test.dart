import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/invoice_number_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/order_number_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/material_tax.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
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
  late OrderHistoryItem fakeOrderHistoryItemWithCounterOffer;
  late OrderHistoryItem fakeOrderHistoryItemWithTax;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late CartBloc cartBlocMock;
  late AllInvoicesBloc allInvoicesBlocMock;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late MixpanelService mixpanelServiceMock;
  late List<CreditAndInvoiceItem> fakeItemList;
  late ViewByOrder fakeOrder;

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
    fakeOrderHistoryItem = OrderHistoryItem.empty().copyWith(
      status: OrderStepValue('Picking in progress'),
      createdDate: DateTimeStringValue(fakeCreatedDate),
      expiryDate: DateTimeStringValue('2023-10-04'),
      batch: StringValue('fake-batch-number'),
      orderNumber: OrderNumber('1234567'),
      invoiceData:
          InvoiceData.empty().copyWith(invoiceNumber: StringValue('123456')),
    );
    fakeOrderHistoryItemWithCounterOffer = fakeOrderHistoryItem.copyWith(
      originPrice: ZpPrice('100.1'),
      unitPrice: ZpPrice('98'),
      isCounterOffer: true,
    );
    fakeOrderHistoryItemWithTax = fakeOrderHistoryItemWithCounterOffer.copyWith(
      tax: 9,
      totalPrice: TotalPrice('345.8'),
    );
    fakeItemList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
    fakeOrder = await ViewByOrderLocalDataSource().getViewByOrders();
  });
  group('Order History Details By Item Page', () {
    setUp(() {
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
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial());
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
      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsNothing);
    });

    testWidgets('When disableDeliveryDate is false', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableDeliveryDate: false),
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
      expect(expectedDelivery, findsOneWidget);
    });
    testWidgets('When disableDeliveryDate is true ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableDeliveryDate: true),
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
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(enableSpecialInstructions: true),
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
    testWidgets('Find Order Created Status', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryStatuses: [],
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            status: OrderStepValue('Order Created'),
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
      final expectedDelivery = find.textContaining('Order Created');
      expect(expectedDelivery, findsWidgets);
    });

    testWidgets(
        ' => Hide Batch and EXP info when salesOrgConfig BatchNumDisplay is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrgConfigDisabledBatchNumDisplay,
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
          salesOrgConfigs: salesOrgConfigEnabledBatchNumDisplay,
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
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets('on Offer material', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem.copyWith(
                promoStatus: true,
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.drag(
        find.byKey(WidgetKeys.viewByItemsOrderDetailPage),
        const Offset(0, -500),
      );
      await tester.pump();
      expect(find.byWidget(ProductTag.onOfferIcon()), findsOneWidget);
    });

    testWidgets('bundle material', (tester) async {
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem.copyWith(
                isBundle: true,
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.drag(
        find.byKey(WidgetKeys.viewByItemsOrderDetailPage),
        const Offset(0, -500),
      );
      await tester.pump();
      expect(find.byWidget(ProductTag.bundleOfferIcon()), findsOneWidget);
    });

    group('Buy again button -', () {
      setUp(() {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUser,
            salesOrgConfigs: fakeSalesOrganisationConfigs,
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
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
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

    testWidgets('Header section test ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            enableFutureDeliveryDay: true,
            enableMobileNumber: true,
            showPOAttachment: true,
          ),
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
      final viewByItemsOrderDetailsContactPerson =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsContactPerson);
      expect(viewByItemsOrderDetailsContactPerson, findsOneWidget);
      final viewByItemsOrderDetailsContactNumber =
          find.byKey(WidgetKeys.viewByItemsOrderDetailsContactNumber);
      expect(viewByItemsOrderDetailsContactNumber, findsOneWidget);
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
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      );
    });
    testWidgets('Invoice Number section test ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
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
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
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
            appliedFilter: AllInvoicesFilter.empty().copyWith(
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
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verifyNever(
        () => viewByOrderDetailsBlocMock.add(
          ViewByOrderDetailsEvent.setOrderDetails(
            orderHistoryDetails: fakeOrder.orderHeaders.first,
          ),
        ),
      );
    });
    testWidgets('Order Number section test ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
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
            salesOrgConfigs: fakeSalesOrganisationConfigs,
            user: fakeRootAdminUser,
            sortDirection: 'desc',
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
      final orderNoTextFinder = find.textContaining(
        fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
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
          ),
        ),
      ).called(1);
    });

    testWidgets('Attachment Section test with no data', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            showPOAttachment: true,
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
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            showPOAttachment: true,
          ),
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
                  .orderHistoryItemPoAttachments.first
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
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            showPOAttachment: true,
          ),
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
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            showPOAttachment: true,
          ),
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
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            showPOAttachment: true,
          ),
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

    testWidgets('=> When contact person is empty - NA should display',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableMobileNumber: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.balanceTextRow('Contact person', 'NA')),
        findsOneWidget,
      );
    });
    testWidgets(
        '=> Display counter offer when order history item is conter offer one',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithCounterOffer],
          ),
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
      await tester.pumpAndSettle();
      final orderItemPrice = find.byType(OrderItemPrice);
      expect(orderItemPrice, findsOneWidget);
      final offerAppliedTxt = find.text('Offer applied'.tr());
      expect(offerAppliedTxt, findsOneWidget);
    });

    testWidgets(
        '=> NOT display counter offer when order history item is NOT conter offer one',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
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
      final orderItemPrice = find.byType(OrderItemPrice);
      expect(orderItemPrice, findsOneWidget);
      final offerAppliedTxt = find.text('Offer applied'.tr());
      expect(offerAppliedTxt, findsNothing);
    });

    testWidgets(
        '=> Display material tax when order history item is applied tax',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithTax],
          ),
        ),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItemWithTax,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItemWithTax],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final quantityAndPriceWithTax = find.byType(QuantityAndPriceWithTax);
      expect(quantityAndPriceWithTax, findsOneWidget);
      final materialTax = find.byType(MaterialTax);
      expect(materialTax, findsOneWidget);
    });

    testWidgets(
        '=> NOT display material tax when order history item is NOT applied tax',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
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
      final quantityAndPriceWithTax = find.byType(QuantityAndPriceWithTax);
      expect(quantityAndPriceWithTax, findsOneWidget);
      final materialTax = find.byType(MaterialTax);
      expect(materialTax, findsNothing);
    });
  });
}
