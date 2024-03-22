import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ViewByOrderDetailsBlockMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ReOrderPermissionBlocMock
    extends MockBloc<ReOrderPermissionEvent, ReOrderPermissionState>
    implements ReOrderPermissionBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class ViewByItemDetailsBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderBloc mockViewByOrderBloc;
  late ViewByOrderDetailsBloc mockViewByOrderDetailsBloc;
  late CartBloc cartBlocMock;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late AppRouter autoRouterMock;
  late ViewByOrder viewByOrder;
  late EligibilityBlocMock eligibilityBlocMock;
  late ViewByItemDetailsBloc mockViewByItemDetailsBloc;
  late MaterialPriceBloc materialPriceBlocMock;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => reOrderPermissionBlocMock);
    locator.registerSingleton<MixpanelService>(MockMixpanelService());
    viewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    locator.registerLazySingleton(() => AutoRouterMock());
    autoRouterMock = locator<AutoRouterMock>();
    cartBlocMock = CartBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
  });

  setUp(() {
    mockViewByOrderBloc = ViewByOrderBlocMock();
    mockViewByOrderDetailsBloc = ViewByOrderDetailsBlockMock();
    eligibilityBlocMock = EligibilityBlocMock();
    cartBlocMock = CartBlocMock();
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    mockViewByItemDetailsBloc = ViewByItemDetailsBlocMock();
    when(() => mockViewByOrderBloc.state)
        .thenReturn(ViewByOrderState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => reOrderPermissionBlocMock.state)
        .thenReturn(ReOrderPermissionState.initial());
    when(() => mockViewByOrderDetailsBloc.state)
        .thenReturn(ViewByOrderDetailsState.initial());
    when(() => mockViewByItemDetailsBloc.state)
        .thenReturn(ViewByItemDetailsState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        user: fakeClientUser.copyWith(enableOrderType: true),
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerAttr7: CustomerAttr7('ZEV'),
          customerGrp4: CustomerGrp4('VR'),
        ),
      ),
    );
    when(() => materialPriceBlocMock.state).thenReturn(
      MaterialPriceState.initial(),
    );
  });

  //////////////////Finder////////////////////////////////////////////////////
  final viewByOrdersItemKey = find.byKey(WidgetKeys.viewByOrdersItemKey);
  final viewByOrdersGroupKey = find.byKey(WidgetKeys.viewByOrdersGroupKey);

  ////////////////////////////////////////////////////////////////////////////

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ViewByOrderBloc>(
          create: (context) => mockViewByOrderBloc,
        ),
        BlocProvider<ViewByOrderDetailsBloc>(
          create: (context) => mockViewByOrderDetailsBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<CartBloc>(
          create: ((context) => cartBlocMock),
        ),
        BlocProvider<ReOrderPermissionBloc>(
          create: ((context) => reOrderPermissionBlocMock),
        ),
        BlocProvider<ViewByItemDetailsBloc>(
          create: ((context) => mockViewByItemDetailsBloc),
        ),
        BlocProvider<MaterialPriceBloc>(
          create: ((context) => materialPriceBlocMock),
        ),
      ],
      child: const Material(
        child: ViewByOrdersPage(),
      ),
    );
  }

  group('Order History ViewByOrdersPage -', () {
    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          viewByOrderList:
              viewByOrder.copyWith(orderHeaders: <OrderHistoryDetails>[]),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('no record section test when viewByOrderList is empty',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFound = find.byType(
        NoRecordFound,
      );
      expect(noRecordFound, findsOneWidget);
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).subTitle,
        'Items ordered on eZRx+ will be shown here',
      );
    });

    testWidgets(
        'no record section test when viewByOrderList is empty after search',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          searchKey: SearchKey('fake_key'),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFound = find.byType(
        NoRecordFound,
      );
      expect(noRecordFound, findsOneWidget);
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).subTitle,
        'Try adjusting your search or filter selection to find what you’re looking for',
      );
    });
    testWidgets("Displaying 'items' text test ", (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final materials = find.text(
        '{qty} items'.tr(namedArgs: {'qty': '2'}),
      );
      expect(materials, findsOneWidget);
    });

    testWidgets('Displaying order total value', (tester) async {
      const totalValue = 500.0;
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                totalValue: totalValue,
              ),
            ],
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final totalOrderPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(totalValue.toString()),
      );
      expect(totalOrderPriceFinder, findsOneWidget);
    });

    testWidgets(
        'Buy again button not visible when disable create order flag true',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
          user: User.empty().copyWith(
            disableCreateOrder: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsNothing);
    });

    testWidgets('Buy again button visible when disable create order flag false',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsWidgets);
      await tester.tap(buyAgainButton.first);
      await tester.pumpAndSettle();
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.fetchOrder(
            orderHistoryDetailsOrderItems:
                viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem,
            orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
          ),
        ),
      ).called(1);
    });

    testWidgets('view by order multiple groupe', (tester) async {
      final expectedStatue = [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-exception'))),
        ),
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first,
              viewByOrder.orderHeaders.last.copyWith(
                createdDate: DateTimeStringValue(
                  viewByOrder.orderHeaders.last.createdDate.dateTime
                      .add(const Duration(days: 3))
                      .toString(),
                ),
              )
            ],
          ),
        )
      ];
      whenListen(mockViewByOrderBloc, Stream.fromIterable(expectedStatue));

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final divider = find.byType(Divider);
      expect(divider, findsOneWidget);
      expect(viewByOrdersGroupKey, findsNWidgets(2));
    });

    testWidgets('Buy again button go to cart page', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder
              .copyWith(orderHeaders: [viewByOrder.orderHeaders.first]),
        ),
      );
      whenListen(
        reOrderPermissionBlocMock,
        Stream.fromIterable(
          [
            ReOrderPermissionState.initial().copyWith(
              isFetching: true,
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
            ),
            ReOrderPermissionState.initial().copyWith(
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
            )
          ],
        ),
      );

      whenListen(
        cartBlocMock,
        Stream.fromIterable(
          [
            CartState.initial().copyWith(
              isFetching: true,
              isBuyAgain: true,
            ),
            CartState.initial().copyWith(
              isBuyAgain: false,
            )
          ],
        ),
      );
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/view_by_order_details_page');
      when(
        () => autoRouterMock.push(const CartPageRoute()),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsOneWidget);
      verify(
        () => cartBlocMock.add(
          CartEvent.addHistoryItemsToCart(
            items: [],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
        ),
      ).called(1);
      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.push(const CartPageRoute()),
      ).called(1);
    });

    testWidgets('Show snackbar when add reorder items to cart failure',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder
              .copyWith(orderHeaders: [viewByOrder.orderHeaders.first]),
        ),
      );
      when(() => reOrderPermissionBlocMock.state).thenReturn(
        ReOrderPermissionState.initial().copyWith(
          orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
        ),
      );

      whenListen(
        cartBlocMock,
        Stream.fromIterable(
          [
            CartState.initial().copyWith(isBuyAgain: true),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('test'))),
            )
          ],
        ),
      );
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/view_by_order_details_page');

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.customSnackBarMessage),
        findsOneWidget,
      );

      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Show snackbar when get reorder permission failure',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder
              .copyWith(orderHeaders: [viewByOrder.orderHeaders.first]),
        ),
      );
      whenListen(
        reOrderPermissionBlocMock,
        Stream.fromIterable(
          [
            ReOrderPermissionState.initial().copyWith(
              isFetching: true,
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
            ),
            ReOrderPermissionState.initial().copyWith(
              orderNumberWillUpsert: viewByOrder.orderHeaders.first.orderNumber,
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('test'))),
            )
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.customSnackBarMessage),
        findsOneWidget,
      );
    });

    testWidgets('Test order total price visibility with tax', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(
                orderValue: 364.80,
                totalTax: 20,
                totalValue: 384.80,
              )
            ],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final totalOrderValue =
          find.text('Order total : SGD 384.80', findRichText: true);

      expect(totalOrderValue, findsOneWidget);
    });

    testWidgets(
      'view by order reload',
      (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.viewByOrdersGroupList),
          const Offset(0.0, 150.0),
          800.0,
        );
        expect(
          find.byType(RefreshProgressIndicator),
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        verify(
          () => mockViewByOrderBloc.add(
            ViewByOrderEvent.fetch(
              filter: ViewByOrdersFilter.empty(),
              searchKey: SearchKey.searchFilter(''),
              isDetailsPage: false,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'view by order load more',
      (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.viewByOrdersGroupList),
          const Offset(0.0, -1500.0),
          800.0,
        );
        await tester.pumpAndSettle();
        verify(
          () => mockViewByOrderBloc.add(
            const ViewByOrderEvent.loadMore(),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'view by order error',
      (tester) async {
        whenListen(
          mockViewByOrderBloc,
          Stream.fromIterable([
            ViewByOrderState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-exception'),
                ),
              ),
            )
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.fling(
          find.byKey(WidgetKeys.viewByOrdersGroupList),
          const Offset(0.0, 150.0),
          800.0,
        );
        await tester.pumpAndSettle();
        final snackBar = find.widgetWithText(
          CustomSnackBar,
          'fake-exception',
        );
        expect(snackBar, findsOneWidget);
      },
    );

    testWidgets(
      'view by order details page',
      (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
            user: User.empty().copyWith(
              disableCreateOrder: true,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              disableCreateOrder: true,
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(
          () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
        ).thenAnswer((invocation) => Future(() => null));
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(viewByOrdersGroupKey, findsWidgets);
        expect(viewByOrdersItemKey, findsWidgets);
        await tester.tap(viewByOrdersItemKey.first);
        await tester.pumpAndSettle();
        verify(
          () => mockViewByOrderDetailsBloc.add(
            ViewByOrderDetailsEvent.fetch(
              orderNumber: viewByOrder.orderHeaders.first.orderNumber,
            ),
          ),
        ).called(1);
        verify(
          () => mockViewByItemDetailsBloc.add(
            ViewByItemDetailsEvent.searchOrderHistory(
              searchKey: SearchKey(
                viewByOrder.orderHeaders.first.orderNumber.getValue(),
              ),
            ),
          ),
        ).called(1);
        verify(
          () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
        ).called(1);
      },
    );

    group('Order status label -', () {
      setUp(() {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );
      });

      testWidgets('not displayed by default', (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
        final orderCount = viewByOrder.orderHeaders.length;
        expect(
          orderItems,
          findsNWidgets(orderCount),
        );
        expect(
          find.descendant(of: orderItems, matching: find.byType(StatusLabel)),
          findsNothing,
        );
      });
      testWidgets('displayed in ID market', (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
        final orderCount = viewByOrder.orderHeaders.length;
        expect(
          orderItems,
          findsNWidgets(orderCount),
        );
        expect(
          find.descendant(of: orderItems, matching: find.byType(StatusLabel)),
          findsNWidgets(orderCount),
        );
      });
      testWidgets('Display MarketPlace logo on MP order ', (tester) async {
        when(() => mockViewByOrderBloc.state).thenReturn(
          ViewByOrderState.initial().copyWith(
            viewByOrderList: viewByOrder,
          ),
        );
        final mpItemsCount = viewByOrder.orderHeaders
            .where((order) => order.isMarketPlace)
            .length;
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byType(MarketPlaceLogo),
          findsNWidgets(mpItemsCount),
        );
      });
    });
  });
}
