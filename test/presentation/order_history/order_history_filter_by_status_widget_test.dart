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

void main() {
  late GetIt locator;
  late AppRouter autoRouterMock;
  final mockOrderHistoryFilterByStatusBloc =
      OrderHistoryFilterByStatusMockBloc();
  setUpAll(() {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton(() => mockOrderHistoryFilterByStatusBloc);
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
        child: const Material(
            child: SizedBox(height: 100, child: HistoryFilterByStatus())),
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
      expect(filterclearAllButton, findsNothing);
    });
  });
}
