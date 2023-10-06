import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  final salesOrgSelector = find.byKey(const Key('salesOrgSelect'));
  final accountTabbar = find.byKey(const Key('accountTabbar'));
  final customerCodeSelect = find.byKey(const Key('customerCodeSelect'));
  final shipToCodeSelector = find.byKey(const Key('shipToCodeSelect'));
  final homeTabbar = find.text('Home'.tr());
  final favoriteTabbar = find.byKey(const Key('favoritesTab'));
  final historyTabbar = find.byKey(const Key('historyTab'));
  final orderTemplate = find.text('Order Template');
  final savedOrders = find.text('Saved Orders');
  final announcementCloseIcon = find.byKey(const Key('announcementCloseIcon'));
  final homeTabAnnouncementWidget =
      find.byKey(const Key('homeTabAnnouncementWidget'));
  final moreTab = find.text('More'.tr());
  final logout = find.text('Log out');
  final searchBar = find.byKey(WidgetKeys.homeProductSearchBar);
  final customerSelector = find.byKey(WidgetKeys.customerCodeSelector);
  final miniCart = find.byType(CartButton);
  final quickAccessMenu = find.byType(QuickAccessMenuPanel);
  final banner = find.byType(CarouselBanner);
  final browseProductIcon = find.byKey(WidgetKeys.browseProductIcon);
  final announcementIcon = find.byKey(WidgetKeys.announcementIcon);
  final productsTab = find.text('Products'.tr());
  final searchByProductField = find.byKey(WidgetKeys.searchProductField);

  void verify() {
    final home = find.byKey(WidgetKeys.homeScreen);
    expect(home, findsOneWidget);
  }

  void findCustomerSelector() {
    expect(customerSelector, findsOneWidget);
  }

  void findMiniCart() {
    expect(miniCart, findsOneWidget);
  }

  void findQuickAccessMenu() {
    expect(quickAccessMenu, findsOneWidget);
  }

  void findBannerInHomeScreen() {
    expect(banner, findsOneWidget);
  }

  void verifyEdiCustomer() {
    expect(find.byKey(const Key('ediCustomerOrderDisable')), findsOneWidget);
  }

  void verifySuspendedCustomer() {
    expect(find.byKey(const Key('suspendedCustomer')), findsWidgets);
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

  Future<void> findAndCloseAnnouncementIcon() async {
    if (announcementCloseIcon.evaluate().isNotEmpty &&
        homeTabAnnouncementWidget.evaluate().isNotEmpty) {
      await tester.tap(announcementCloseIcon.first);
      await tester.pumpAndSettle();
    }
  }

  void findAccountTab() {
    expect(accountTabbar, findsOneWidget);
  }

  Future<void> tapAccountTab() async {
    await tester.tap(accountTabbar);
    await tester.pumpAndSettle();
  }

  void findBrowseProductIcon() {
    expect(browseProductIcon, findsOneWidget);
  }

  void findMiniCartIcon() {
    expect(miniCart, findsOneWidget);
  }

  Future<void> findAnnouncementsIcon() async {
    final listView = find.byType(SingleChildScrollView).last;
    await tester.dragUntilVisible(
      announcementIcon,
      listView,
      const Offset(0, -250),
      duration: const Duration(seconds: 1),
    );
    expect(announcementIcon, findsOneWidget);
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
    await tester.tap(customerCodeSelect);
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

  void findFavoriteTab() {
    expect(favoriteTabbar, findsOneWidget);
  }

  Future<void> tapFavoriteTab() async {
    await tester.pumpAndSettle();
    await tester.tap(favoriteTabbar);
    await tester.pumpAndSettle();
  }

  void findHistoryTab() {
    expect(historyTabbar, findsOneWidget);
  }

  Future<void> tapHistoryTab() async {
    await tester.pumpAndSettle();
    await tester.tap(historyTabbar);
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

  void findMoreTab() {
    expect(moreTab, findsOneWidget);
  }

  Future<void> tapMoreTab() async {
    await tester.tap(moreTab);
    await tester.pump(const Duration(milliseconds: 300));
  }

  Future<void> findLogout() async {
    final listMore = find.byType(ListView).last;
    await tester.dragUntilVisible(
      logout,
      listMore,
      const Offset(0, -250),
      duration: const Duration(seconds: 2),
    );
    expect(logout, findsOneWidget);
  }

  Future<void> tapLogout() async {
    await tester.tap(logout);
    await tester.pumpAndSettle();
  }

  void findProductsTab() {
    expect(productsTab, findsOneWidget);
  }

  Future<void> tapProductsTab() async {
    await tester.tap(productsTab);
    await tester.pumpAndSettle();
  }

  void findSearchProductField() {
    expect(searchByProductField, findsOneWidget);
  }

  Future<void> tapSearchProductField() async {
    await tester.tap(searchByProductField);
    await tester.pumpAndSettle();
  }

  Future<void> tapReturnsQuickAccess() async {
    await tester.tap(find.byKey(WidgetKeys.homeQuickAccessReturnsMenu));
    await tester.pumpAndSettle();
  }

  Future<void> tapMiniCartIcon() async {
    await tester.tap(miniCart);
    await tester.pumpAndSettle();
  }
}
