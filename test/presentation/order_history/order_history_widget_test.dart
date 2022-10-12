import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basicInfo.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';

import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/presentation/history/history_tab.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class MockOrderHistoryRepository extends Mock
    implements OrderHistoryRepository {}

class CustomerCodeMockBloc extends Mock implements CustomerCodeBloc {}

class ShipToCodeMocBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  final mockOrderHistoryListBloc = OrderHistoryListBlocMock();
  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());
    locator.registerLazySingleton(() => mockOrderHistoryListBloc);
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
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
      });
      StackRouterScope getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<OrderHistoryListBloc>(
                create: (context) => mockOrderHistoryListBloc),
          ],
          child: const HistoryTab(),
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
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
            ),
          ]);
        });
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 3));
        expect(find.byKey(const Key('OrderHistoryList')), findsWidgets);
        await tester.pump();
      });
    },
  );
}
