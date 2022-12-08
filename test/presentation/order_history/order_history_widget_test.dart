import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/presentation/history/history_tab.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';
import '../orders/create_order/material_bundle/material_bundle_list_test.dart';

class MockHTTPService extends Mock implements HttpService {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class MockOrderHistoryRepository extends Mock
    implements OrderHistoryRepository {}

class CustomerCodeMockBloc extends Mock implements CustomerCodeBloc {}

class ShipToCodeMocBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CartMocBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class OrderHistoryFilterMockBloc
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class OrderHistoryStatusByFilterBloc extends MockBloc<
        OrderHistoryFilterByStatusEvent, OrderHistoryFilterByStatusState>
    implements OrderHistoryFilterByStatusBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  final mockOrderHistoryListBloc = OrderHistoryListBlocMock();
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockOrderHistoryFilterByStatusBloc = OrderHistoryStatusByFilterBloc();
  final mockShipToCodeBloc = ShipToCodeMocBloc();
  final mockCartBloc = CartMocBloc();
  final mockSalesOrgBloc = SalesOrgMockBloc();
  late CustomerCodeBloc customerCodeBlocMock;

  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;

  late OrderHistory orderHistoryItem;
  late EligibilityBlocMock eligibilityBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    orderHistoryItem = await OrderHistoryLocalDataSource().getOrderHistory();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => locator<CountlyService>());
    locator.registerLazySingleton(() => mockOrderHistoryListBloc);

    locator.registerLazySingleton(() => mockShipToCodeBloc);
    locator.registerLazySingleton(() => mockCartBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);

    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    customerCodeBlocMock = CustomerCodeBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();

    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });
  group(
    'Order-History',
    () {
      setUp(() {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockOrderHistoryFilterBloc.state)
            .thenReturn(OrderHistoryFilterState.initial());
        when(() => mockShipToCodeBloc.state)
            .thenReturn(ShipToCodeState.initial());
        when(() => mockCartBloc.state).thenReturn(CartState.initial());
        when(() => customerCodeBlocMock.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => mockOrderHistoryFilterByStatusBloc.state)
            .thenReturn(OrderHistoryFilterByStatusState.initial());
        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => eligibilityBlocMock.state)
            .thenReturn(EligibilityState.initial());
      });
      StackRouterScope getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<OrderHistoryListBloc>(
                create: (context) => mockOrderHistoryListBloc),
            BlocProvider<OrderHistoryFilterBloc>(
                create: (context) => mockOrderHistoryFilterBloc),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => mockShipToCodeBloc),
            BlocProvider<CartBloc>(create: (context) => mockCartBloc),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<OrderHistoryFilterByStatusBloc>(
                create: (context) => mockOrderHistoryFilterByStatusBloc),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
          ],
          child: Material(child: HistoryTab()),
        );
      }

      testWidgets('Order History test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
              canLoadMore: false,
              nextPageIndex: 0,
            ),
          ]);
        });
        final mockCartBloc = locator<CartMocBloc>();
        when(() => mockCartBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            CartState.initial().copyWith(cartItemList: <PriceAggregate>[]),
          ]);
        });
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 1));
        final orderList = find.byKey(const Key('scrollList'));
        expect(orderList, findsOneWidget);

        final noRecordFound = find.text('No history found');
        expect(noRecordFound, findsOneWidget);

        await tester.pump();
      });

      testWidgets('Load history_tab widget', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
              canLoadMore: false,
              nextPageIndex: 0,
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 1));
        // final titleFinder = find.text('History');
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);

        // expect(titleFinder, findsOneWidget);
      });

      testWidgets('app bar test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
              canLoadMore: false,
              nextPageIndex: 0,
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Order History'.tr()), findsOneWidget);

        await tester.pump();
      });

      testWidgets('order Type test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: orderHistoryItem,
              isFetching: false,
            ),
          ]);
        });
        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(isFetching: true),
        );
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 3));
        expect(find.byKey(const Key('orderHistoryList')), findsWidgets);
        expect(find.byType(OrderHistoryListTile), findsWidgets);

        await tester.drag(
            find.byKey(const Key('orderHistoryList')), const Offset(0.0, -300));
        await tester.pump();
      });

      testWidgets('Filter button test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
            ),
          ]);
        });
        await tester.pumpWidget(getWUT());

        expect(find.byKey(const Key('Filter_list_not_empty')), findsNothing);
      });
      testWidgets('Filter list not empty test', (tester) async {
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        when(() => mockOrderHistoryFilterBloc.state).thenReturn(
          OrderHistoryFilterState.initial().copyWith(isAppliedFilter: true),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('Filter_list_not_empty')), findsOneWidget);
      });

      testWidgets('Filter button test ', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockOrderHistoryFilterBloc.state).thenReturn(
          OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
        );
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filterButton = find.byKey(const Key('filterButton'));
        expect(filterButton, findsOneWidget);
        await tester.tap(filterButton);
      });

      testWidgets('Filter status button test ', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockOrderHistoryFilterBloc.state).thenReturn(
          OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
        );
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('statusFilterButton')), findsOneWidget);
        await tester.tap(find.byKey(const Key('statusFilterButton')));
        // await tester.pump();
      });
      testWidgets('Filter status  test ', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));

        final filterstatus = find.byKey(const Key('status'));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(filterstatus, findsOneWidget);
      });
      testWidgets('Filter status list not empty test', (tester) async {
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [
              'Cancelled',
              'Delivered',
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('Filter_by_status_list_not_empty')),
            findsOneWidget);
      });
    },
  );
}
