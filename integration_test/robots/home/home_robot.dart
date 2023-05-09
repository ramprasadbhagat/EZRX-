import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  final salesOrgSelector = find.byKey(const Key('salesOrgSelect'));
  final announcementCloseIcon = find.byKey(const Key('announcementCloseIcon'));
  final accountTabbar = find.byKey(const Key('accountTabbar'));
  final customerCodeSelect = find.byKey(const Key('customerCodeSelect'));
  final shipToCodeSelector = find.byKey(const Key('shipToCodeSelect'));
  final homeTabbar = find.byKey(const Key('homeTab'));
  final favoriteTabbar = find.byKey(const Key('favoritesTab'));
  final orderTemplate = find.text('Order Template');
  final savedOrders = find.text('Saved Orders');

  void verify() {
    final home = find.byKey(const Key('homeScreen'));
    expect(home, findsOneWidget);
  }

  void verifyEdiCustomer() {
    expect(find.byKey(const Key('ediCustomerOrderDisable')), findsOneWidget);
  }

  void findSalesOrgSelector() {
    expect(salesOrgSelector, findsWidgets);
  }

  Future<void> tapSalesOrgSelector() async {
    final salesOrgSelectOne =
        find.descendant(of: salesOrgSelector, matching: salesOrgSelector);
    await tester.tap(salesOrgSelectOne);
    await tester.pumpAndSettle();
  }

  Future<void> selectSalesOrg(String salesOrg) async {
    final salesOrgOption = find.byKey(Key('salesOrgOption$salesOrg'));
    expect(salesOrgOption, findsOneWidget);
    await tester.tap(salesOrgOption);
    await tester.pumpAndSettle();
  }

  void findAccountTab() {
    expect(accountTabbar, findsOneWidget);
  }

  Future<void> tapAccountTab() async {
    await tester.tap(accountTabbar);
    await tester.pumpAndSettle();
  }

  void findHomeTab() {
    expect(homeTabbar, findsOneWidget);
  }

  Future<void> tapHomeTab() async {
    await tester.tap(homeTabbar);
    await tester.pumpAndSettle();
  }

  void findCustomerCodeSelector() {
    expect(customerCodeSelect, findsWidgets);
  }

  Future<void> tapCustomerCodeSelector() async {
    final customerCodeSelector =
        find.descendant(of: customerCodeSelect, matching: customerCodeSelect);
    expect(customerCodeSelector, findsOneWidget);
    await tester.tap(customerCodeSelector);
    await tester.pumpAndSettle();
  }

  void findShipToSelector() {
    expect(shipToCodeSelector, findsWidgets);
  }

  Future<void> tapShipToSelector() async {
    final shipToCodeSelectOne =
        find.descendant(of: shipToCodeSelector, matching: shipToCodeSelector);
    expect(shipToCodeSelectOne, findsOneWidget);
    await tester.tap(shipToCodeSelectOne);
    await tester.pumpAndSettle();
  }

  Future<void> goToCreateOrder() async {
    final createOrder = find.text('Create Order');
    expect(createOrder, findsOneWidget);
    await tester.tap(createOrder);
    await tester.pumpAndSettle();
  }

  Future<void> findAndCloseAnnouncementIcon() async {
    if (announcementCloseIcon.evaluate().isNotEmpty) {
      await tester.tap(announcementCloseIcon.first);
      await tester.pumpAndSettle();
    }
  }

  void findFavoriteTab() {
    expect(favoriteTabbar, findsOneWidget);
  }

  Future<void> tapFavoriteTab() async {
    await tester.pumpAndSettle();
    await tester.tap(favoriteTabbar);
    await tester.pumpAndSettle();
  }

  void findOrderTemplate() {
    expect(orderTemplate, findsOneWidget);
  }

  Future<void> tapOrderTemplate() async {
    await tester.tap(orderTemplate);
    await tester.pumpAndSettle();
  }

  void findSavedOrders() {
    expect(savedOrders, findsOneWidget);
  }

  Future<void> tapSavedOrders() async {
    await tester.pumpAndSettle();
    await tester.tap(savedOrders);
    await tester.pumpAndSettle();
  }
}
