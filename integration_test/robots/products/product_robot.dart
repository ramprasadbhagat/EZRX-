import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../common/common_robot.dart';
import '../common/extension.dart';

class ProductRobot extends CommonRobot {
  ProductRobot(WidgetTester tester) : super(tester);

  final materialCard = find.byKey(WidgetKeys.materialListMaterialCard);
  final bundleCard = find.byKey(WidgetKeys.materialListBundleCard);
  final nameCart = find.byKey(WidgetKeys.nameCart);
  final priceComponent = find.byKey(WidgetKeys.priceComponent);
  final favoritesChoiceChip = find.byKey(WidgetKeys.favoritesChoiceChip);
  final covidChoiceChip = find.byKey(WidgetKeys.covidChoiceChip);

  final searchProductField = find.byKey(WidgetKeys.searchProductField);

  void verifyPageVisible() {
    expect(find.byKey(WidgetKeys.materialListPage), findsOneWidget);
  }

  void verifyMaterial() => expect(materialCard, findsAtLeastNWidgets(1));

  void verifyBundle() => expect(bundleCard, findsAtLeastNWidgets(1));

  void verifyCovid() => expect(materialCard, findsAtLeastNWidgets(1));

  void verifyOnOfferLabel() {
    final cardCount = materialCard.evaluate().length;
    expect(
      find.descendant(
        of: materialCard,
        matching: find.byKey(WidgetKeys.offerTag),
      ),
      findsNWidgets(cardCount),
    );
  }

  void verifyCartButtonVisible() {
    expect(cartButton, findsOneWidget);
  }

  void verifyFilterFavoritesChip() {
    expect(favoritesChoiceChip, findsOneWidget);
  }

  void verifyFilterCovidChip() {
    expect(covidChoiceChip, findsOneWidget);
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

  void verifyProductFilter(String nameProduct, {required bool matched}) {
    final listNameProduct =
        tester.widgetList<Text>(nameCart).map((e) => e.data);
    if (matched) {
      expect(listNameProduct.first, nameProduct);
    } else {
      if (listNameProduct.isNotEmpty) {
        expect(listNameProduct.first != nameProduct, true);
      }
    }
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

  Future<void> tapFirstMaterial() async {
    await tester.tap(materialCard.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstBundle() async {
    await tester.tap(bundleCard.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstCovid() async {
    await tester.tap(materialCard.first);
    await tester.pumpAndSettle();
  }

  Future<void> filterFavoritesInProductsScreen() async {
    await tester.tap(favoritesChoiceChip);
    await tester.pumpAndSettle();
  }

  Future<void> tapCovidChipInProductsScreen() async {
    await tester.tap(covidChoiceChip);
    await tester.pumpAndSettle();
  }

  void verifyOnCovidChip() {
    final cardCount = materialCard.evaluate().length;
    expect(
      find.descendant(
        of: materialCard,
        matching: find.byKey(WidgetKeys.covidLabel),
      ),
      findsNWidgets(cardCount),
    );
  }

  Future<void> setProductFavoriteStatus(int index, bool isFavorite) async {
    final favoriteIcon = find.byKey(WidgetKeys.favoritesIcon).at(index);
    final statusFavorite = find.descendant(
      of: materialCard.at(index),
      matching: find.byKey(WidgetKeys.statusFavoriteIcon(isFavorite)),
    );
    if (statusFavorite.evaluate().isEmpty) {
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle();
    } else {
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle();
      await tester.tap(favoriteIcon);
      await tester.pumpAndSettle();
    }

    await tester.pumpUntilVisible(statusFavorite);
  }

  void verifyPAndGMaterialPriceForExternalSalesRep() {
    expect(
      find.descendant(
        of: materialCard,
        matching: _getPriceFinder('Price Not Available'.tr()),
      ),
      findsWidgets,
    );
  }

  Finder _getPriceFinder(String price) => find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(price),
      );
}
