import 'package:auto_route/src/matcher/route_matcher.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class ViewByOrderFilterBlocMock
    extends MockBloc<ViewByOrderFilterEvent, ViewByOrderFilterState>
    implements ViewByOrderFilterBloc {}

class ViewByItemFilterBlocMock
    extends MockBloc<ViewByItemFilterEvent, ViewByItemFilterState>
    implements ViewByItemFilterBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class ConfigMock extends Mock implements Config {}

class OrdersTabRouter extends AppRouter {
  @override
  RouteCollection get routeCollection => super.routeCollection.subCollectionOf(
        HomeNavigationTabbarRoute.name,
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ViewByItemsBloc viewByItemsBlocMock;
  late ViewByOrderBloc viewByOrderBlocMock;
  late ViewByOrderFilterBloc viewByOrderFilterBlocMock;
  late ViewByItemFilterBloc viewByItemFilterBlocMock;
  late MixpanelService mixpanelServiceMock;
  late Config config;

  setUpAll(() {
    locator.registerLazySingleton(() => config);
    registerFallbackValue(<String, dynamic>{});
    registerFallbackValue(const ViewByOrderEvent.loadMore());
    registerFallbackValue(const ViewByItemsEvent.loadMore());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerFactory<AppRouter>(() => OrdersTabRouter());
    autoRouterMock = locator<AppRouter>();
    mixpanelServiceMock = locator<MixpanelService>();
    config = ConfigMock();
  });
  setUp(() {
    authBlocMock = AuthBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    viewByItemsBlocMock = ViewByItemsBlocMock();
    viewByOrderBlocMock = ViewByOrderBlocMock();
    viewByOrderFilterBlocMock = ViewByOrderFilterBlocMock();
    viewByItemFilterBlocMock = ViewByItemFilterBlocMock();

    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => viewByItemsBlocMock.state)
        .thenReturn(ViewByItemsState.initial());
    when(() => viewByOrderBlocMock.state)
        .thenReturn(ViewByOrderState.initial());
    when(() => viewByOrderFilterBlocMock.state)
        .thenReturn(ViewByOrderFilterState.initial());
    when(() => viewByItemFilterBlocMock.state)
        .thenReturn(ViewByItemFilterState.initial());
  });

  Widget testWidget(Widget widget) {
    return WidgetUtils.getScopedWidget(
      routeName: OrdersTabRoute.name,
      autoRouterMock: autoRouterMock,
      useMediaQuery: true,
      usingLocalization: true,
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<ViewByItemsBloc>(
          create: (context) => viewByItemsBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<ViewByOrderBloc>(
          create: (context) => viewByOrderBlocMock,
        ),
        BlocProvider<ViewByOrderFilterBloc>(
          create: (context) => viewByOrderFilterBlocMock,
        ),
        BlocProvider<ViewByItemFilterBloc>(
          create: (context) => viewByItemFilterBlocMock,
        ),
      ],
      child: Material(child: widget),
    );
  }

  group('Orders tab -', () {
    testWidgets('by default', (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();

      expect(find.byKey(WidgetKeys.ordersTab), findsOneWidget);
      expect(find.byKey(WidgetKeys.viewByItemsTabKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.viewByOrdersTabKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.ordersTabSearchBarKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.ordersTabFilterButtonKey), findsOneWidget);
      expect(find.byType(ViewByItemsPage), findsOneWidget);
    });

    testWidgets('in ID market', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();

      expect(find.byKey(WidgetKeys.ordersTab), findsOneWidget);
      expect(find.byKey(WidgetKeys.viewByItemsTabKey), findsNothing);
      expect(find.byKey(WidgetKeys.viewByOrdersTabKey), findsNothing);
      expect(find.byKey(WidgetKeys.ordersTabSearchBarKey), findsOneWidget);
      expect(find.byKey(WidgetKeys.ordersTabFilterButtonKey), findsOneWidget);
      expect(find.byType(ViewByItemsPage), findsNothing);
      expect(find.byType(ViewByOrdersPage), findsOneWidget);
    });

    testWidgets('Show view by item filter when tap filter icon',
        (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      expect(find.byType(ViewByItemsPage), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
    });
  });

  group('View Filter', () {
    testWidgets('displayed when tap filter icon', (tester) async {
      final fakeFilter = ViewByOrdersFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(appliedFilter: fakeFilter),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrdersPage), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.updateCurrentFilter(
            currentFilter: fakeFilter,
          ),
        ),
      ).called(1);
    });

    testWidgets('in default state', (tester) async {
      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pump();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);
      expect(find.widgetWithText(AppBar, 'Filter'), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.viewByOrdersFilterFromDateKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrdersFilterToDateKey),
        findsOneWidget,
      );
      expect(find.byType(CheckboxListTile), findsNothing);
      expect(
        find.byKey(WidgetKeys.filterApplyButton),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.filterResetButton),
        findsOneWidget,
      );
    });

    testWidgets('show status picker in ID market', (tester) async {
      final statusList = [
        'Order received',
        'Order created',
        'Picking in progress',
        'Out for delivery',
        'Delivered',
        'Cancelled',
      ];
      when(() => viewByOrderFilterBlocMock.state).thenReturn(
        ViewByOrderFilterState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pump();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsNWidgets(statusList.length));
      for (final status in statusList) {
        expect(
          find.byKey(WidgetKeys.statusFilter(status, false)),
          findsOneWidget,
        );
      }
      await tester
          .tap(find.byKey(WidgetKeys.statusFilter(statusList.first, false)));
      await tester.pumpAndSettle();
      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.setOrderStatus(
            status: StatusType(statusList.first),
            value: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('close button view by orders filter', (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsNothing);

      verifyNever(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
      verifyNever(
        () => viewByOrderBlocMock.add(any()),
      );
    });

    testWidgets('close button view by items filter', (tester) async {
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.resetFiltersToLastApplied(
            lastAppliedFilter: ViewByItemFilter.empty(),
          ),
        ),
      );
    });
    testWidgets('reset filter by order', (tester) async {
      final fakeSearchKey = SearchKey('test');
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          appliedFilter: ViewByOrdersFilter.empty()
              .copyWith(orderStatusList: [StatusType('test')]),
          searchKey: fakeSearchKey,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterResetButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsNothing);

      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: fakeSearchKey,
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });

    testWidgets('reset filter by items', (tester) async {
      final fakeSearchKey = SearchKey('test');
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          appliedFilter: ViewByItemFilter.empty()
              .copyWith(orderStatusList: [StatusType('test')]),
          searchKey: fakeSearchKey,
        ),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterResetButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsNothing);

      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: fakeSearchKey,
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });

    testWidgets('apply filter view by order filter', (tester) async {
      final fakeFilter = ViewByOrdersFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByOrderFilterBlocMock.state).thenReturn(
        ViewByOrderFilterState.initial().copyWith(filter: fakeFilter),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterApplyButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrderFilterBottomSheet), findsNothing);

      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: fakeFilter,
            searchKey: SearchKey(''),
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });
    testWidgets('apply filter view by items filter', (tester) async {
      final fakeFilter = ViewByItemFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByItemFilterBlocMock.state).thenReturn(
        ViewByItemFilterState.initial().copyWith(filter: fakeFilter),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.ordersTabFilterButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.filterApplyButton));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemFilterSheet), findsNothing);

      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: fakeFilter,
            searchKey: SearchKey(''),
          ),
        ),
      );

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.orderDetailFiltered,
          properties: any(named: 'properties'),
        ),
      );
    });

    testWidgets('apply from/to date view by orders filter', (tester) async {
      final fakeStartDate = DateTime.now().subtract(const Duration(days: 2));
      final fakeEndDate = DateTime.now().subtract(const Duration(days: 1));
      final fromDateString =
          '${fakeStartDate.month}/${fakeStartDate.day}/${fakeStartDate.year}';
      final toDateString =
          '${fakeEndDate.month}/${fakeEndDate.day}/${fakeEndDate.year}';

      await tester.pumpWidget(testWidget(const ViewByOrderFilterBottomSheet()));
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByOrdersFilterFromDateKey));
      await tester.pumpAndSettle();
      final dialog = find.byType(DateRangePickerDialog);
      final editIcon = find.descendant(
        of: dialog,
        matching: find.widgetWithIcon(IconButton, Icons.edit),
      );

      await tester.tap(editIcon);
      await tester.pump();
      final submitButton =
          find.descendant(of: dialog, matching: find.byType(TextButton));
      final dateRangeFields =
          find.descendant(of: dialog, matching: find.byType(TextField));
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.tap(submitButton.last);
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByOrdersFilterToDateKey));
      await tester.pumpAndSettle();
      await tester.tap(editIcon);
      await tester.pump();
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.pump();
      await tester.tap(submitButton.last);
      await tester.pump();

      verify(
        () => viewByOrderFilterBlocMock.add(
          ViewByOrderFilterEvent.setDateRange(
            DateUtils.datesOnly(
              DateTimeRange(start: fakeStartDate, end: fakeEndDate),
            ),
          ),
        ),
      ).called(2);
    });

    testWidgets('apply from/to date view by items filter', (tester) async {
      final fakeStartDate = DateTime.now().subtract(const Duration(days: 2));
      final fakeEndDate = DateTime.now().subtract(const Duration(days: 1));
      final fromDateString =
          '${fakeStartDate.month}/${fakeStartDate.day}/${fakeStartDate.year}';
      final toDateString =
          '${fakeEndDate.month}/${fakeEndDate.day}/${fakeEndDate.year}';

      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByItemsFilterFromDateKey));
      await tester.pumpAndSettle();
      final dialog = find.byType(DateRangePickerDialog);
      final editIcon = find.descendant(
        of: dialog,
        matching: find.widgetWithIcon(IconButton, Icons.edit),
      );

      await tester.tap(editIcon);
      await tester.pump();
      final submitButton =
          find.descendant(of: dialog, matching: find.byType(TextButton));
      final dateRangeFields =
          find.descendant(of: dialog, matching: find.byType(TextField));
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.tap(submitButton.last);
      await tester.pump();

      await tester.tap(find.byKey(WidgetKeys.viewByItemsFilterToDateKey));
      await tester.pumpAndSettle();
      await tester.tap(editIcon);
      await tester.pump();
      await tester.enterText(dateRangeFields.first, fromDateString);
      await tester.enterText(dateRangeFields.last, toDateString);
      await tester.pump();
      await tester.tap(submitButton.last);
      await tester.pump();

      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.setOrderDate(
            dateRange: DateUtils.datesOnly(
              DateTimeRange(start: fakeStartDate, end: fakeEndDate),
            ),
          ),
        ),
      ).called(2);
    });

    testWidgets('apply status view by items filter', (tester) async {
      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pumpAndSettle();
      await tester.tap(
        find.text(
          'Order created',
        ),
      );
      await tester.pump();

      verify(
        () => viewByItemFilterBlocMock.add(
          ViewByItemFilterEvent.setOrderStatus(
            status: StatusType('Order created'),
            value: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('should rebuild the filter date range when order date changed',
        (tester) async {
      final fakeStartDate = DateTime.now().subtract(const Duration(days: 2));
      final fakeEndDate = DateTime.now().subtract(const Duration(days: 1));
      whenListen(
        viewByItemFilterBlocMock,
        Stream.fromIterable([
          ViewByItemFilterState.initial(),
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderDateFrom: DateTimeStringValue(
                fakeStartDate.toIso8601String(),
              ),
              orderDateTo: DateTimeStringValue(
                fakeEndDate.toIso8601String(),
              ),
            ),
          )
        ]),
      );
      await tester.pumpWidget(testWidget(const ViewByItemFilterSheet()));
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.viewByItemsFilterFromDateKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.viewByItemsFilterToDateKey),
        findsOneWidget,
      );
    });

    testWidgets(
        'rebuild view by order filter when fetch completed or appliedFilterCount changed',
        (tester) async {
      final fakeFilter = ViewByOrdersFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(appliedFilter: fakeFilter),
      );
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial().copyWith(isFetching: true),
          ViewByOrderState.initial().copyWith(appliedFilter: fakeFilter),
        ]),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();

      expect(find.byType(ViewByOrdersPage), findsOneWidget);
    });
    testWidgets(
        'rebuild view by item filter when fetch completed or appliedFilterCount changed',
        (tester) async {
      final fakeFilter = ViewByItemFilter.empty()
          .copyWith(orderStatusList: [StatusType('test')]);
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial().copyWith(appliedFilter: fakeFilter),
      );
      whenListen(
        viewByItemsBlocMock,
        Stream.fromIterable([
          ViewByItemsState.initial().copyWith(isFetching: true),
          ViewByItemsState.initial().copyWith(appliedFilter: fakeFilter),
        ]),
      );
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();

      expect(find.byType(ViewByItemsPage), findsOneWidget);
    });
  });

  group('Orders tab search bar', () {
    testWidgets('fetch item view by items tab when search', (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByItemsTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByItemsPage), findsOneWidget);
      final searchBar = find.byKey(WidgetKeys.genericKey(key: ''));
      await tester.enterText(searchBar, 'dummy');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: SearchKey('dummy'),
          ),
        ),
      );
    });
    testWidgets('fetch item view by orders tab when search', (tester) async {
      when(() => config.autoSearchTimeout).thenReturn(1500);
      await tester.pumpWidget(testWidget(const OrdersTab()));
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.viewByOrdersTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ViewByOrdersPage), findsOneWidget);
      final searchBar = find.byKey(WidgetKeys.genericKey(key: ''));
      await tester.enterText(searchBar, 'dummy');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: SearchKey('dummy'),
          ),
        ),
      );
    });
  });
}
