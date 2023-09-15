import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:flutter_test/flutter_test.dart';

class OrdersRootRobot {
  final WidgetTester tester;

  OrdersRootRobot(this.tester);

  final viewByItemsTab = find.byKey(WidgetKeys.viewByItemsTabKey);
  final viewByItemsPage = find.byType(ViewByItemsPage);
  final viewByOrdersTab = find.byKey(WidgetKeys.viewByOrdersTabKey);
  final viewByOrdersPage = find.byType(ViewByOrdersPage);
  final searchBar = find.byKey(WidgetKeys.ordersTabSearchBarKey);
  final clearSearchIcon = find.byKey(WidgetKeys.clearIconKey);
  final filterButton = find.byKey(WidgetKeys.ordersTabFilterButtonKey);

  void verifyTabBarVisible() {
    expect(viewByItemsTab, findsOneWidget);
    expect(viewByOrdersTab, findsOneWidget);
  }

  Future<void> switchToViewByItems() async {
    await tester.tap(viewByItemsTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToViewByOrders() async {
    await tester.tap(viewByOrdersTab);
    await tester.pumpAndSettle();
  }

  void verifyViewByItemsPageVisible() {
    expect(viewByItemsPage, findsOneWidget);
  }

  void verifyViewByOrdersPageVisible() {
    expect(viewByOrdersPage, findsOneWidget);
  }

  void verifySearchBarVisible() {
    expect(searchBar, findsOneWidget);
  }

  void verifyFilterButtonVisible() {
    expect(filterButton, findsOneWidget);
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapFilterButton() async {
    await tester.tap(filterButton);
    await tester.pumpAndSettle();
  }

  void verifyInvalidSearchTextMessageVisible() {
    expect(
      find.text('Please enter at least 2 characters.'.tr()),
      findsOneWidget,
    );
  }

  Future<void> enterSearchText(String text) async {
    await tester.tap(searchBar);
    await tester.enterText(searchBar, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> tapClearSearch() async {
    await tester.tap(clearSearchIcon);
    await tester.pumpAndSettle();
  }
}
