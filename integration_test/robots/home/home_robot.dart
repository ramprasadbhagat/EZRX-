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
  final searchBar = find.byKey(WidgetKeys.homeProductSearchBar);
  final customerSelector = find.byKey(WidgetKeys.customerCodeSelector);
  final miniCart = find.byType(CartButton);
  final homeQuickAccessPaymentsMenu =
      find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
  final quickAccessMenu = find.byType(QuickAccessMenuPanel);
  final banner = find.byType(CarouselBanner);
  final browseProductIcon = find.byKey(WidgetKeys.browseProductIcon);
  final announcementIcon = find.byKey(WidgetKeys.announcementIcon);
  final productsTab = find.text('Products'.tr());
  final buttonNextBanner = find.byKey(WidgetKeys.nextBannerIcon);
  final buttonPreviousBanner = find.byKey(WidgetKeys.previousBannerIcon);
  final recentlyOrder = find.byKey(WidgetKeys.recentlyOrder);
  final productsOnOffer = find.byKey(WidgetKeys.productsOnOffer);
  final bundles = find.byKey(WidgetKeys.bundles);
  final iconArrow = find.byKey(WidgetKeys.iconArrow);
  final listViewHomeScreen = find.byType(SingleChildScrollView).last;
  final homeQuickAccessOrders =
      find.byKey(WidgetKeys.homeQuickAccessOrdersMenu);
  final homeQuickAccessReturns =
      find.byKey(WidgetKeys.homeQuickAccessReturnsMenu);
  final homeQuickAccessPayments =
      find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
  final homeQuickAccessChatSupport =
      find.byKey(WidgetKeys.homeQuickAccessChatSupportMenu);

  final productsOnOfferList = find.byKey(WidgetKeys.productOnOffer);
  final bundlesTag = find.text('Bundle offer');
  final bundlesNumberID = find.byKey(WidgetKeys.bundlesNumber);
  final bundlesDescription = find.byKey(WidgetKeys.bundlesDescription);
  final bundlesManufactured = find.byKey(WidgetKeys.bundlesManufactured);
  final bundlesList = find.byKey(WidgetKeys.bundlesList);
  final recentlyOrderedList = find.byKey(WidgetKeys.listRecentlyOrdered);
  final browseProductsList = find.byKey(WidgetKeys.browseProductsList);
  final announcementsList = find.byKey(WidgetKeys.announcementsList);
  final productImage = find.byKey(WidgetKeys.productImage);
  final productStockLabel = find.byKey(WidgetKeys.materialListStockLabel);
  final productDescription = find.byKey(WidgetKeys.nameCart);
  final productManufactured = find.byKey(WidgetKeys.manufacturerMaterials);
  final productPrice = find.byKey(WidgetKeys.priceComponent);
  final productNumber = find.byKey(WidgetKeys.materialNumberText);
  final productFavouriteIcon = find.byKey(WidgetKeys.favouriteIcon);
  final searchByProductField = find.byKey(WidgetKeys.searchProductField);
  final listView = find.byType(SingleChildScrollView).last;

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

  Future<void> findBrowseProductIcon() async {
    await _scrollEnsureVisible(browseProductIcon);
    expect(browseProductIcon, findsOneWidget);
  }

  void findMiniCartIcon() {
    expect(miniCart, findsOneWidget);
  }

  Future<void> findAnnouncementsIcon() async {
    await _scrollEnsureVisible(announcementIcon);
    expect(announcementIcon, findsOneWidget);
  }

  Future<void> tapAnnouncementsIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Announcements'.tr()));
    await tester.tap(iconArrow);
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

  void findProductsTab() {
    expect(productsTab, findsOneWidget);
  }

  Future<void> tapProductsTab() async {
    await tester.tap(productsTab);
    await tester.pumpAndSettle();
  }

  void findNextBanner() {
    expect(buttonNextBanner, findsOneWidget);
  }

  Future<void> tapNextBanner() async {
    await tester.tap(buttonNextBanner);
    await tester.pump();
  }

  void findPreviousBanner() {
    expect(buttonPreviousBanner, findsOneWidget);
  }

  Future<void> tapPreviousBanner() async {
    await tester.tap(buttonPreviousBanner);
    await tester.pump();
  }

  Future<void> findRecentlyOrderIcon() async {
    await _scrollEnsureVisible(recentlyOrder);
    expect(recentlyOrder, findsOneWidget);
  }

  Future<void> tapRecentlyOrderIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Recently ordered'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  Future<void> findBrowseProductsIcon() async {
    await _scrollEnsureVisible(browseProductIcon);
    expect(browseProductIcon, findsOneWidget);
  }

  Future<void> tapBrowseProductsIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Browse products'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  void findProductsOnOffer() {
    expect(productsOnOffer, findsOneWidget);
  }

  Future<void> tapProductsOnOfferIcon() async {
    final iconArrow =
        find.byKey(WidgetKeys.sectionTileIcon('Products on offer'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  void findBundles() {
    expect(bundles, findsOneWidget);
  }

  Future<void> tapBundlesIcon() async {
    final iconArrow = find.byKey(WidgetKeys.sectionTileIcon('Bundles'.tr()));
    await tester.tap(iconArrow);
    await tester.pumpAndSettle();
  }

  Future<void> slideNextBanner() async {
    final imageBanner = find.byKey(WidgetKeys.imageBanner).first;
    await tester.drag(imageBanner, const Offset(-400, 100));
    await tester.pump();
  }

  Future<void> slidePreviousBanner() async {
    final imageBanner = find.byKey(WidgetKeys.imageBanner).first;
    await tester.drag(imageBanner, const Offset(400, 100));
    await tester.pump();
  }

  void verifyFirstBannerIsDisplay() {
    final listBanner = find.byKey(WidgetKeys.homeBanner);
    final listPosition = tester.widget<PageView>(listBanner);
    expect(listPosition.controller.page, 0);
  }

  void findHomeQuickAccessOrdersMenu() {
    expect(homeQuickAccessOrders, findsOneWidget);
  }

  Future<void> tapHomeQuickAccessOrdersMenu() async {
    await tester.tap(homeQuickAccessOrders);
    await tester.pumpAndSettle();
  }

  void findHomeQuickAccessReturnsMenu() {
    expect(homeQuickAccessReturns, findsOneWidget);
  }

  Future<void> tapHomeQuickAccessReturnsMenu() async {
    await tester.tap(homeQuickAccessReturns);
    await tester.pumpAndSettle();
  }

  void findHomeQuickAccessPaymentsMenu() {
    expect(homeQuickAccessPayments, findsOneWidget);
  }

  Future<void> tapHomeQuickAccessPaymentsMenu() async {
    await tester.tap(homeQuickAccessPayments);
    await tester.pump();
  }

  void findHomeQuickAccessChatSupportMenu() {
    expect(homeQuickAccessChatSupport, findsOneWidget);
  }

  Future<void> tapHomeQuickAccessChatSupportMenu() async {
    await tester.tap(homeQuickAccessChatSupport);
    await tester.pumpAndSettle();
  }

  Future<void> slideToNextProductsOnOffer() async {
    final productsOnOffer = productsOnOfferList.first;
    await tester.drag(productsOnOffer, const Offset(-380, 100));
    await tester.pump();
  }

  Future<void> slideToPreviousProductsOnOffer() async {
    final productsOnOffer = productsOnOfferList.first;
    await tester.drag(productsOnOffer, const Offset(380, 100));
    await tester.pump();
  }

  void verifyDisplayProductsWithOfferTag() {
    final offerTag = find.byKey(WidgetKeys.iconLabelOffer);
    expect(offerTag, findsWidgets);
  }

  Future<void> tapOnFirstProductOnOffer() async {
    final productsOnOffer = productsOnOfferList.first;
    await tester.tap(productsOnOffer);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnFirstBundle() async {
    final firstBundle = bundlesList.first;
    await _scrollEnsureVisible(firstBundle);
    await tester.tap(firstBundle);
    await tester.pumpAndSettle();
  }

  void verifyDisplayBundlesTag() {
    expect(bundlesTag, findsWidgets);
  }

  Future<void> verifyDisplayBundlesNumber() async {
    await _scrollEnsureVisible(bundlesNumberID.first);
    expect(bundlesNumberID, findsWidgets);
  }

  void verifyDisplayBundlesDescription() {
    expect(bundlesDescription, findsWidgets);
  }

  void verifyDisplayBundlesManufactured() {
    expect(bundlesManufactured, findsWidgets);
  }

  Future<void> slideToNextBundle() async {
    final bundle = bundlesList.first;
    await tester.drag(bundle, const Offset(-500, 150));
    await tester.pump();
  }

  Future<void> slideToNextRecentlyOrdered() async {
    final ordered = recentlyOrderedList.first;
    await tester.drag(ordered, const Offset(-1000, 150));
    await tester.pump();
  }

  Future<void> slideToNextBrowseProducts() async {
    final browse = browseProductsList.first;
    await tester.drag(browse, const Offset(-500, 150));
    await tester.pump();
  }

  Future<void> slideToNextAnnouncements() async {
    final announcement = announcementsList.first;
    await tester.drag(announcement, const Offset(-500, 150));
    await tester.pump();
  }

  Future<void> slideToPreviousBundle() async {
    final bundle = bundlesList.at(1);
    await tester.drag(bundle, const Offset(500, 150));
    await tester.pump();
  }

  Future<void> slideToPreviousRecentlyOrdered() async {
    final ordered = recentlyOrderedList.at(1);
    await tester.drag(ordered, const Offset(1000, 150));
    await tester.pump();
  }

  Future<void> slideToPreviousBrowseProducts() async {
    final browse = browseProductsList.at(1);
    await tester.drag(browse, const Offset(500, 150));
    await tester.pump();
  }

  Future<void> slideToPreviousAnnouncements() async {
    final announcement = announcementsList.at(1);
    await tester.drag(announcement, const Offset(500, 150));
    await tester.pump();
  }

  String? getFirstAnnouncementInfo() {
    final titleAnnouncement = find.byKey(WidgetKeys.announcementTitle);
    final info = tester.widgetList<Text>(titleAnnouncement).first;
    return info.data;
  }

  Future<void> tapOnFirstRecentlyOrdered() async {
    final firstOrdered = recentlyOrderedList.first;
    await tester.tap(firstOrdered);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnFirstBrowseProduct() async {
    final firstProduct = browseProductsList.first;
    await tester.tap(firstProduct);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnFirstAnnouncement() async {
    final firstAnnouncement = announcementsList.first;
    await tester.tap(firstAnnouncement);
    await tester.pumpAndSettle();
  }

  void findSearchProductField() {
    expect(searchByProductField, findsOneWidget);
  }

  Future<void> tapSearchProductField() async {
    await tester.tap(searchByProductField);
    await tester.pumpAndSettle();
  }

  void verifyNotFoundWidgetByText(String textInfo) {
    final text = find.text(textInfo);
    expect(text.hitTestable(), findsNothing);
  }

  void verifyFoundWidgetByText(String textInfo) {
    final text = find.text(textInfo);
    expect(text.hitTestable(), findsOneWidget);
  }

  void findProductImage() {
    expect(productImage, findsWidgets);
  }

  void findProductStockLabel() {
    expect(productStockLabel, findsWidgets);
  }

  void findProductDescription() {
    expect(productDescription, findsWidgets);
  }

  void findProductManufactured() {
    expect(productManufactured, findsWidgets);
  }

  void findProductPrice() {
    expect(productPrice, findsWidgets);
  }

  void findProductFavouriteIcon() {
    expect(productFavouriteIcon, findsWidgets);
  }

  void verifyProductNumber() {
    expect(productNumber, findsWidgets);
  }

  Future<void> tapReturnsQuickAccess() async {
    await tester.tap(find.byKey(WidgetKeys.homeQuickAccessReturnsMenu));
  }

  Future<void> tapPaymentQuickAccess() async {
    await tester.tap(homeQuickAccessPaymentsMenu);
    await tester.pumpAndSettle();
  }

  Future<void> tapMiniCartIcon() async {
    await tester.tap(miniCart);
    await tester.pumpAndSettle();
  }

  String getFirstBundleInfo() {
    final materialNumber = find.byKey(WidgetKeys.bundlesNumber);
    final info = tester.widgetList<Text>(materialNumber).first;
    return info.data ?? '';
  }

  String getFirstBrowseProductInfo() {
    final materialNumber = find.byKey(WidgetKeys.materialNumberText);
    final info = tester.widgetList<Text>(materialNumber).first;
    return info.data ?? '';
  }

  Future<void> _scrollEnsureVisible(Finder finder) async {
    await tester.dragUntilVisible(
      finder,
      listView,
      const Offset(0, -250),
    );
  }

}
