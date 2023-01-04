import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/presentation/history/history_filter_by_status.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class OrderHistoryFilterByStatusMockBloc extends MockBloc<
        OrderHistoryFilterByStatusEvent, OrderHistoryFilterByStatusState>
    implements OrderHistoryFilterByStatusBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  late GetIt locator;
  final mockOrderHistoryFilterByStatusBloc =
      OrderHistoryFilterByStatusMockBloc();
  late MockAppRouter autoRouterMock;

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => MockAppRouter());
    autoRouterMock = locator<MockAppRouter>();
    locator.registerLazySingleton(() => mockOrderHistoryFilterByStatusBloc);
    when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);
  });
  group('Order-History Filter By Status', () {
    setUp(() {
      when(() => mockOrderHistoryFilterByStatusBloc.state)
          .thenReturn(OrderHistoryFilterByStatusState.initial());
    });
    StackRouterScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<OrderHistoryFilterByStatusBloc>(
              create: (context) => mockOrderHistoryFilterByStatusBloc),
        ],
        child: Material(
          child: SizedBox(
            height: 100,
            child: HistoryFilterByStatus(
              key: UniqueKey(),
            ),
          ),
        ),
      );
    }

    testWidgets('Order History Filter By status test', (tester) async {
      when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
        OrderHistoryFilterByStatusState.initial().copyWith(
          filterByStatusName: [],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle(const Duration(seconds: 3));
      final filtercByStatus =
          find.byKey(const Key('order_history_filter_by_status'));
      final filterclearAllButton =
          find.byKey(const Key('filterclearAllButton'));
      expect(filtercByStatus, findsOneWidget);
      expect(filterclearAllButton, findsOneWidget);

      final checkboxListTile = find.byKey(const Key('checkboxListTile'));
      expect(checkboxListTile, findsWidgets);

      await tester.tap(checkboxListTile.first);
      await tester.pump();
    });
    testWidgets('Checked status is selected or not test', (tester) async {
      when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
        OrderHistoryFilterByStatusState.initial().copyWith(
          filterByStatusName: [
            'Cancelled',
            'Delivered',
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });

    testWidgets('filter clearAllbutton', (tester) async {
      when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
        OrderHistoryFilterByStatusState.initial().copyWith(
          filterByStatusName: [],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final filterclearAllButton =
          find.byKey(const Key('filterclearAllButton'));

      expect(filterclearAllButton, findsOneWidget);
      await tester.tap(filterclearAllButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      verify(() => autoRouterMock.pop()).called(1);
    });

    testWidgets('filter close button', (tester) async {
      when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
        OrderHistoryFilterByStatusState.initial().copyWith(
          filterByStatusName: [],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      final closeButton = find.byKey(const Key('closeButton'));
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      await tester.pump();
    });
  });
}
