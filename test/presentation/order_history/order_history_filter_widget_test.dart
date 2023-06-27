import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/presentation/history/history_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class OrderHistoryFilterMockBloc
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late GetIt locator;
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockOrderHistoryFilter = OrderHistoryFilter.empty();
  late SalesOrgBloc salesOrgBlocMock;

  late MockAppRouter autoRouterMock;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  const fakeFromDate = Duration(days: 28);

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => MockAppRouter());
    locator.registerLazySingleton(() => mockOrderHistoryFilterBloc);
    salesOrgBlocMock = SalesOrgBlocMock();
    locator.registerSingleton<Config>(
        Config()..dateRangePickerDuration = fakeFromDate);
  });
  group('Order-History Filter', () {
    setUp(() {
      autoRouterMock = locator<MockAppRouter>();

      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
      autoRouterMock = locator<MockAppRouter>();
      when(() => autoRouterMock.popForced())
          .thenAnswer((invocation) async => true);
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    });

    Widget getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<OrderHistoryFilterBloc>(
              create: (context) => mockOrderHistoryFilterBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
        ],
        child: const OrderHistoryFilterDrawer(),
      );
    }

    testWidgets('Order History Filter test ', (tester) async {
      final expectedStates = [
        OrderHistoryFilterState.initial().copyWith(
          isSubmitting: false,
        ),
      ];
      whenListen(
          mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));

      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial().copyWith(
          isSubmitting: true,
          showErrorMessages: true,
          orderHistoryFilter: mockOrderHistoryFilter,
        ),
      );

      await tester.pumpWidget(getWUT());
      final orderIdTextField = find.byKey(const Key('filterOrderIdField'));
      final poNumberField = find.byKey(const Key('filterPoNumberField'));
      final princeplesearchField =
          find.byKey(const Key('filterPrincipalSearchField'));
      final materialsearchField =
          find.byKey(const Key('filterMaterialSearchField'));

      final filterclearButton = find.byKey(const Key('filterClearButton'));
      final filterapplyButton = find.byKey(const Key('filterApplyButton'));
      final filtercrossButton = find.byKey(const Key('filterCrossButton'));
      expect(orderIdTextField, findsOneWidget);
      expect(poNumberField, findsOneWidget);
      expect(princeplesearchField, findsOneWidget);
      expect(poNumberField, findsOneWidget);
      expect(materialsearchField, findsOneWidget);
      expect(
          find.byKey(Key(
              'filterOrderDateField+${mockOrderHistoryFilter.getOrderDateFiltered}')),
          findsOneWidget);
      expect(filterclearButton, findsOneWidget);
      expect(filterapplyButton, findsOneWidget);
      expect(filtercrossButton, findsOneWidget);

      await tester.enterText(orderIdTextField, 'en');
      await tester.pump();

      final orderIdTextFieldText = find.text('en');
      expect(orderIdTextFieldText, findsOneWidget);

      final minLengthErrorMessage =
          find.text('Please enter at least 2 characters.');
      await tester.pump();

      expect(minLengthErrorMessage, findsNothing);
    });

    testWidgets('Order History Filter Loading test ', (tester) async {
      final expectedStates = [
        OrderHistoryFilterState.initial().copyWith(
          isSubmitting: false,
        ),
        OrderHistoryFilterState.initial().copyWith(
          isSubmitting: true,
        ),
      ];
      whenListen(
          mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));

      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial().copyWith(
            isSubmitting: true, orderHistoryFilter: mockOrderHistoryFilter),
      );
      when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);

      await tester.pumpWidget(getWUT());

      final orderIdTextFieldText = find.text('loader');
      expect(orderIdTextFieldText, findsNothing);
    });

    testWidgets('  entering orderId in Order History Filter test ',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(getWUT());
      });

      await tester.pump();
      await tester.enterText(
          find.byKey(const Key('filterOrderIdField')), '020');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('020'), findsOneWidget);
    });

    testWidgets('  entering PoNumber  in Order History Filter test  ',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(getWUT());
      });

      await tester.pump();
      await tester.enterText(
          find.byKey(const Key('filterPoNumberField')), '100');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('100'), findsOneWidget);
    });

    testWidgets('  entering  princpleSearch  in Order History Filter test ',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(getWUT());
      });

      await tester.pump();
      await tester.enterText(
          find.byKey(const Key('filterPrincipalSearchField')), '188');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('188'), findsOneWidget);
    });

    testWidgets('  entering materialSearch  in Order History Filter  test',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(getWUT());
      });

      await tester.pump();
      await tester.enterText(
          find.byKey(const Key('filterMaterialSearchField')), '199');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('199'), findsOneWidget);
    });

    testWidgets(' test apply Order History Filter  ', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final filterapplyButton = find.byKey(const Key('filterApplyButton'));
      expect(filterapplyButton, findsOneWidget);
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial()
            .copyWith(isSubmitting: true, showErrorMessages: true),
      );
      await tester.tap(filterapplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
    testWidgets(' test clear Order History Filter  ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial()
            .copyWith(orderHistoryFilter: mockOrderHistoryFilter),
      );

      await tester.pumpWidget(getWUT());

      final filterclearButton = find.byKey(const Key('filterClearButton'));
      expect(filterclearButton, findsOneWidget);
      await tester.tap(filterclearButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      verify(() => autoRouterMock.popForced()).called(2);
    });

    testWidgets(' test close button History Filter  ', (tester) async {
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
      when(() => mockOrderHistoryFilterBloc.state).thenReturn(
        OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();
      final filtercrossButton = find.byKey(const Key('filterCrossButton'));
      await tester.tap(filtercrossButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      verify(() => autoRouterMock.popForced()).called(1);
    });

    testWidgets(
      'Test OrderDateFilter field',
      (tester) async {
        final expectedStates = [
          OrderHistoryFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
          OrderHistoryFilterState.initial().copyWith(
            showErrorMessages: true,
            orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
                fromDate:
                    DateTimeStringValue(getDateStringByDateTime(DateTime.parse(
                  DateFormat('yyyyMMdd').format(
                    DateTime.now().subtract(
                      fakeFromDate,
                    ),
                  ),
                ))),
                toDate:
                    DateTimeStringValue(getDateStringByDateTime(fakeToDate))),
          ),
        ];
        whenListen(
          mockOrderHistoryFilterBloc,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWUT());

        await tester.pumpAndSettle();

        final filterFromDateField = find.byKey(Key(
            'filterOrderDateField+${mockOrderHistoryFilter.getOrderDateFiltered}'));
        expect(filterFromDateField, findsOneWidget);
        await tester.tap(filterFromDateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('SAVE');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => mockOrderHistoryFilterBloc.add(
            OrderHistoryFilterEvent.setOrderDate(
                orderDateRange: DateTimeRange(
                    start: DateTime.parse(
                      DateFormat('yyyyMMdd').format(
                        DateTime.now().subtract(
                          fakeFromDate,
                        ),
                      ),
                    ),
                    end: fakeToDate)),
          ),
        ).called(1);
      },
    );
  });
}
