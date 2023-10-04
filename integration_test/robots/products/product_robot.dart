import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../core/test_locator.dart';
import '../common/common_robot.dart';

class ProductRobot extends CommonRobot {
  ProductRobot(WidgetTester tester) : super(tester);

  final materialCart = find.byKey(WidgetKeys.materialListMaterialCard);
  final nameCart = find.byKey(WidgetKeys.nameCart);
  final priceComponent = find.byKey(WidgetKeys.priceComponent);
  final labelFilterFavorites = find.byKey(WidgetKeys.favoritesChoiceChip);
  final suggestedProductsTile = find.byKey(WidgetKeys.suggestedProductsTile);

  // Search bar
  final searchProductField = find.byKey(WidgetKeys.searchProductField);
  final txtSearchProductField = find.byKey(WidgetKeys.txtSearchProductField);

  void verifyPageVisible() {
    expect(find.byKey(WidgetKeys.materialListPage), findsOneWidget);
  }

  void verifyMaterialCartVisible() {
    expect(materialCart.first, findsOneWidget);
  }

  void verifyCartButtonVisible() {
    expect(cartButton, findsOneWidget);
  }

  void verifyLabelFilterFavoritesVisible() {
    expect(labelFilterFavorites, findsOneWidget);
  }

  Future<void> openFilterProductScreen() async {
    await tester.tap(find.byKey(WidgetKeys.filterProductIcon));
    await tester.pumpAndSettle();
  }

  void verifyProductSortByAToZ() {
    final listNameProduct = List.from(
      tester.widgetList<Text>(nameCart).map((e) => e.data),
    );
    expect(listNameProduct, listNameProduct..sort);
  }

  String getFistMaterialName() {
    return tester
            .widget<Text>(
              nameCart.first,
            )
            .data ??
        ' ';
  }

  void verifyFirstNameProduct(String nameProduct) {
    expect(getFistMaterialName(), nameProduct);
  }

  void verifyProductSortChanged(String productName) {
    expect(getFistMaterialName() != productName, true);
  }

  void verifyProductSortByZToA() {
    final listNameProduct = List<String>.from(
      tester.widgetList<Text>(nameCart).map((e) => e.data),
    );
    final sortedList = [...listNameProduct]..sort((a, b) => b.compareTo(a));
    expect(listNameProduct, sortedList);
  }

  void verifyProductFilterMatched(String nameProduct) {
    final listNameProduct =
        tester.widgetList<Text>(nameCart).map((e) => e.data);
    expect(listNameProduct.first, nameProduct);
  }

  void verifyManufacturerMaterialFilterMatched(
    String manufacturerMaterial,
  ) {
    final listNameProduct = tester
        .widgetList<Text>(find.byKey(WidgetKeys.manufacturerMaterials))
        .map((e) => e.data);
    for (final e in listNameProduct) {
      expect(e, manufacturerMaterial);
    }
  }

  void verifySearchBarVisible() {
    expect(searchProductField, findsOneWidget);
  }

  Future<void> openSearchProductScreen() async {
    await tester.tap(searchProductField);
    await tester.pumpAndSettle();
  }

  Future<void> openDetailFirstProduct() async {
    await tester.tap(materialCart.first);
    await tester.pumpAndSettle();
  }

  Future<void> filterFavoritesInProductsScreen() async {
    await tester.tap(labelFilterFavorites);
    await tester.pumpAndSettle();
  }

  Future<void> backToProductsScreen() async {
    await tester.tap(find.byKey(WidgetKeys.materialDetailsPageBack));
    await tester.pumpAndSettle();
  }

  Future<void> pumDurationAutoSearch() async {
    await tester
        .pump(Duration(milliseconds: locator<Config>().autoSearchTimeout));
  }

  void verifyNoSuggestProductsSearch() {
    expect(suggestedProductsTile, findsNothing);
  }

  void verifySuggestProductsSearch(String keyword) {
    final listSuggestTile =
        tester.widgetList<Text>(suggestedProductsTile).map((e) => e.data);

    for (final e in listSuggestTile) {
      expect(e, contains(keyword));
    }
  }

  Future<void> openCardCartPopup() async {
    await tester.tap(find.byKey(WidgetKeys.cartButton));
    await tester.pumpAndSettle();
  }

  void verifyCartPopupDisplayed() {
    final startBrowsingProducts = find.byKey(WidgetKeys.startBrowsingProducts);
    if (startBrowsingProducts.evaluate().isNotEmpty) {
      expect(find.text('Your cart is empty'), findsOneWidget);
      expect(startBrowsingProducts, findsOneWidget);
    } else {
      expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
    }
  }
}
