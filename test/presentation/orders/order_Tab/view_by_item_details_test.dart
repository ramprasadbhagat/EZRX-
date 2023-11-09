import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

class MixpanelServiceMock extends Mock implements MixpanelService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByItemsBloc mockViewByItemsBloc;
  late ViewByItemDetailsBloc mockViewByItemDetailsBloc;
  late AuthBloc mockAuthBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late ViewByOrderBloc viewByOrderBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late List<OrderStatusTracker> fakeOrderStatusTracker;
  late OrderHistoryItem fakeOrderHistoryItem;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late CartBloc cartBlocMock;
  late MixpanelService mixpanelServiceMock;

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
    fakeOrderStatusTracker =
        await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
    fakeOrderHistoryItem = OrderHistoryItem.empty().copyWith(
      status: StatusType('Picking in progress'),
      createdDate: DateTimeStringValue(fakeCreatedDate),
      orderStatusTracker: fakeOrderStatusTracker,
      expiryDate: DateTimeStringValue('2023-10-04'),
      batch: StringValue('fake-batch-number'),
    );
  });
  group('Order History Details By Item Page', () {
    setUp(() {
      cartBlocMock = CartBlocMock();
      mockViewByItemsBloc = ViewByItemsBlocMock();
      mockViewByItemDetailsBloc = ViewByItemDetailsBlockMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      viewByOrderBlocMock = ViewByOrderBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      mockAuthBloc = MockAuthBloc();
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => viewByOrderBlocMock.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockViewByItemDetailsBloc.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeClientUser,
          salesOrganisation: fakeSGSalesOrganisation,
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerAttr7: CustomerAttr7('ZEV'),
            customerGrp4: CustomerGrp4('VR'),
          ),
        ),
      );
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<ViewByItemsBloc>(
            create: (context) => mockViewByItemsBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => viewByOrderBlocMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => mockViewByItemDetailsBloc,
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
        ],
        child: const Material(
          child: ViewByItemDetailsPage(),
        ),
      );
    }

    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem:
              fakeOrderHistoryItem.copyWith(orderStatusTracker: []),
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem:
              fakeOrderHistoryItem.copyWith(orderStatusTracker: []),
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem: fakeOrderHistoryItem,
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
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
          isLoading: false,
          orderHistoryItem: fakeOrderHistoryItem,
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsOneWidget);
    });
    testWidgets('Find Order Created Status', (tester) async {
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem: fakeOrderHistoryItem.copyWith(
            status: StatusType('Order Creating'),
            orderStatusTracker: [],
          ),
          viewByItemDetails: OrderHistory.empty().copyWith(
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem,
            ],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem,
            ],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          viewByItemDetails: OrderHistory.empty().copyWith(
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
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistoryItem: fakeOrderHistoryItem,
          viewByItemDetails: OrderHistory.empty().copyWith(
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

        when(() => mockViewByItemDetailsBloc.state).thenReturn(
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: fakeOrderHistoryItem,
            viewByItemDetails: OrderHistory.empty().copyWith(
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
  });
}
