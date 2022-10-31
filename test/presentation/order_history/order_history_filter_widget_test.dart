import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/presentation/history/history_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class OrderHistoryFilterMockBloc
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

void main() {
  late GetIt locator;
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockOrderHistoryFilter = OrderHistoryFilter.empty();

  late AppRouter autoRouterMock;
  setUpAll(() {
    // TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton(() => mockOrderHistoryFilterBloc);
  });
  group('Order-History Filter', () {
    setUp(() {
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
    });
    StackRouterScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<OrderHistoryFilterBloc>(
              create: (context) => mockOrderHistoryFilterBloc),
        ],
        child: const OrderHistoryFilterDrawer(),
      );
    }

    testWidgets('Order History Filter test ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial().copyWith(
            isSubmitting: true, orderHistoryFilterList: mockOrderHistoryFilter),
      );
      await tester.pumpWidget(getWUT());
      final orderFilterList = find.byKey(const Key('Order History Filter'));
      final orderIdTextField = find.byKey(const Key('filterorderidField'));
      final poNumberField = find.byKey(const Key('filterponumberField'));
      final princeplesearchField =
          find.byKey(const Key('filterprinciplesearchField'));
      final materialsearchField =
          find.byKey(const Key('filtermaterialsearchField'));
      final fromdateField = find.byKey(const Key('filtefromdateField'));
      final todateField = find.byKey(const Key('filtertodateField'));
      final filterclearButton = find.byKey(const Key('filterclearButton'));
      final filterapplyButton = find.byKey(const Key('filterapplyButton'));
      final filtercrossButton = find.byKey(const Key('filtercrossbutton'));
      expect(orderFilterList, findsOneWidget);
      expect(orderIdTextField, findsOneWidget);
      expect(poNumberField, findsOneWidget);
      expect(princeplesearchField, findsOneWidget);
      expect(poNumberField, findsOneWidget);
      expect(materialsearchField, findsOneWidget);
      expect(fromdateField, findsOneWidget);
      expect(todateField, findsOneWidget);
      expect(filterclearButton, findsOneWidget);
      expect(filterapplyButton, findsOneWidget);
      expect(filtercrossButton, findsOneWidget);
    });

    testWidgets(' test apply Order History Filter  ', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final filterapplyButton = find.byKey(const Key('filterapplyButton'));
      expect(filterapplyButton, findsOneWidget);
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial()
            .copyWith(isSubmitting: true, showErrorMessages: true),
      );
      await tester.tap(filterapplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      // expect(filterapplyButton, findsNothing);
    });
    testWidgets(' test clear Order History Filter  ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial()
            .copyWith(orderHistoryFilterList: mockOrderHistoryFilter),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final filterclearButton = find.byKey(const Key('filterclearButton'));
      expect(filterclearButton, findsOneWidget);
      await tester.tap(filterclearButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(filterclearButton, findsNothing);
    });

    testWidgets(' test filtefromdateField date picker test ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial()
            .copyWith(orderHistoryFilterList: mockOrderHistoryFilter),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final fromdateField = find.byKey(const Key('filtefromdateField'));
      expect(fromdateField, findsOneWidget);
      await tester.tap(fromdateField);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(DatePickerDialog), findsOneWidget);
    });

    testWidgets(' test filtertodateField date picker test ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial()
            .copyWith(orderHistoryFilterList: mockOrderHistoryFilter),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final fromdateField = find.byKey(const Key('filtertodateField'));
      expect(fromdateField, findsOneWidget);
      await tester.tap(fromdateField);
      await tester.pump();
      expect(find.byType(DatePickerDialog), findsOneWidget);
    });

    testWidgets(' test close button History Filter  ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final filtercrossButton = find.byKey(const Key('filtercrossbutton'));
      await tester.tap(filtercrossButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 50));
      expect(filtercrossButton, findsNothing);
    });
  });
}
