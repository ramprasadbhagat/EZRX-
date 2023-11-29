import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/available_offers/show_offer_dialog_widget.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';
import '../common/extension.dart';

class ProductDetailRobot extends CommonRobot {
  ProductDetailRobot(WidgetTester tester) : super(tester);

  final materialDetailsMaterialDescription =
      find.byKey(WidgetKeys.materialDetailsMaterialDescription);
  final addToCartButton = find.byKey(WidgetKeys.materialDetailsAddToCartButton);
  final materialDetailsInfoTile =
      find.byKey(WidgetKeys.materialDetailsInfoTile);
  final favoritesIcon = find.byKey(WidgetKeys.favoritesIcon);

  void verifyPage() {
    expect(find.byType(ProductDetailsPage), findsOneWidget);
  }

  String getMaterialDetailsMaterialDescription() {
    return tester
            .widget<Text>(
              materialDetailsMaterialDescription,
            )
            .data ??
        '';
  }

  Future<void> setProductToFavoriteList(bool isFavorite) async {
    final statusFavorite = find.descendant(
      of: find.byKey(WidgetKeys.bodyContentProductDetail),
      matching: find.byKey(WidgetKeys.statusFavoriteIcon(isFavorite)),
    );
    if (statusFavorite.evaluate().isEmpty) {
      await _tapToFavoriteIcon();
    } else {
      await _tapToFavoriteIcon();
      await _tapToFavoriteIcon();
    }
  }

  Future<void> _tapToFavoriteIcon() async {
    await tester.tap(favoritesIcon.first);
    await tester.pumpUntilVisible(customSnackBar);
    await dismissSnackbar();
  }

  Future<void> openMaterialInformation() async {
    await tester.tap(find.byKey(WidgetKeys.materialDetailsInfoTile));
    await tester.pumpAndSettle();
  }

  Future<void> tapToSeeMore() async {
    await tester.tap(find.byKey(WidgetKeys.expandIcon));
  }

  void verifyCountryOfOriginDisplayed(String country) {
    expect(find.text(country), findsOneWidget);
  }

  void verifyProductDetailsInfoTileDisplayed(String country) {
    expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
  }

  void verifyProductImageDisplayed() {
    expect(find.byKey(WidgetKeys.productImage).first, findsOneWidget);
  }

  void verifyProductFavoriteIconDisplayed() {
    expect(find.byKey(WidgetKeys.favoritesIcon).first, findsOneWidget);
  }

  void verifyProductNameDisplayed() {
    expect(
      materialDetailsMaterialDescription.first,
      findsOneWidget,
    );
  }

  void verifyProductPriceDisplayed() {
    expect(find.byKey(WidgetKeys.priceComponent).first, findsOneWidget);
  }

  void verifyMaterialDetailsInfoTileDisplayed() {
    expect(materialDetailsInfoTile, findsOneWidget);
  }

  void verifyProductDetailsQuantityInputPriceDisplayed() {
    expect(find.byKey(WidgetKeys.materialDetailsQuantityInput), findsOneWidget);
  }

  void verifyCartButtonDisplayed() {
    expect(find.byKey(WidgetKeys.cartButton), findsOneWidget);
  }

  void verifyAddToCartCartButtonDisplayed() {
    expect(
      find.byKey(WidgetKeys.materialDetailsAddToCartButton),
      findsOneWidget,
    );
  }

  void verifyMaterialDosageDisplayed() {
    expect(find.byKey(WidgetKeys.materialDosage).first, findsOneWidget);
  }

  void verifyMaterialHowToUseDisplayed() {
    expect(find.byKey(WidgetKeys.materialHowToUse).first, findsOneWidget);
  }

  void verifyMaterialCompositionDisplayed() {
    expect(find.byKey(WidgetKeys.materialComposition).first, findsOneWidget);
  }

  void verifyMaterialDeliveryInstructionsDisplayed() {
    expect(
      find.byKey(WidgetKeys.materialDeliveryInstructions).first,
      findsOneWidget,
    );
  }

  void verifyMateriaNumberDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Material Number'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyManufacturerDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Manufacturer'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyUnitOfMeasurementLabelDisplayed(String value) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Unit of measurement'.tr(), value),
      ),
      findsOneWidget,
    );
  }

  void verifyCountryOfOriginLabelDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Country of origin'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyBatchLabelDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Batch'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyExpiryLabelDisplayed() {
    expect(
      find.byKey(WidgetKeys.productDetailExpiryDate),
      findsOneWidget,
    );
  }

  Future<void> tapAddToCart() async {
    await tester.tap(addToCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    await tester.tap(find.byKey(WidgetKeys.materialDetailsPageBack));
    await tester.pumpAndSettle();
  }

  void verifyMultipleImageMaterialDisplayed() {
    expect(find.byKey(WidgetKeys.materialDetailsCarouselImage), findsWidgets);
  }

  void verifyImageMaterialSelected(int index, bool selected) {
    expect(
      find.byKey(WidgetKeys.genericKey(key: 'selected$index$selected')),
      findsOneWidget,
    );
  }

  Future<void> tapToImageMaterial(int index, bool selected) async {
    await tester
        .tap(find.byKey(WidgetKeys.genericKey(key: 'selected$index$selected')));
    await tester.pump();
  }

  Future<void> openAvailableOffers() async {
    await tester.tap(find.byKey(WidgetKeys.availableOffersTile));
    await tester.pumpAndSettle();
  }

  void verifyNameProductOffer(String nameProduct) {
    final productOfferWidget = tester.widgetList<Text>(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblNameProductOffers),
      ),
    );
    for (final widget in productOfferWidget) {
      expect(widget.data, contains(nameProduct));
    }
  }

  void verifyCodeProductOffer(String codeProduct) {
    final productOfferWidget = tester.widgetList<Text>(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblCodeProductOffers),
      ),
    );
    for (final widget in productOfferWidget) {
      expect(widget.data, contains(codeProduct));
    }
  }

  void verifyQuantityProductDisplayed() {
    expect(
      find.descendant(
        of: find.byType(ShowOfferDialogWidget),
        matching: find.byKey(WidgetKeys.lblQuantityProductOffers),
      ),
      findsWidgets,
    );
  }

  void verifyButtonCloseDisplayed() {
    expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);
  }

  void verifyRelateProductDisplayed() {
    final materialCard = find.byKey(WidgetKeys.materialCard);
    expect(materialCard, findsWidgets);
  }
}
