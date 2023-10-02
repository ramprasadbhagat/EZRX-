import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ProductDetailRobot extends CommonRobot {
  ProductDetailRobot(WidgetTester tester) : super(tester);
  final materialDetailsMaterialDescription =
      find.byKey(WidgetKeys.materialDetailsMaterialDescription);

  String getMaterialDetailsMaterialDescription() {
    return tester
            .widget<Text>(
              materialDetailsMaterialDescription,
            )
            .data ??
        ' ';
  }

  Future<void> addProductToFavoriteList() async {
    final statusFavorite = find.byKey(WidgetKeys.statusFavoriteIcon(true));
    if (statusFavorite.evaluate().isEmpty) {
      await tester.tap(find.byKey(WidgetKeys.favoritesIcon).first);
      await tester.pumpAndSettle();
    }
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
    expect(find.byKey(WidgetKeys.favoritesIcon), findsOneWidget);
  }

  void verifyProductNameDisplayed() {
    expect(
      materialDetailsMaterialDescription,
      findsOneWidget,
    );
  }

  void verifyProductPriceDisplayed() {
    expect(find.byKey(WidgetKeys.priceComponent), findsOneWidget);
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
    expect(find.byKey(WidgetKeys.materialDosage), findsOneWidget);
  }

  void verifyMaterialHowToUseDisplayed() {
    expect(find.byKey(WidgetKeys.materialHowToUse), findsOneWidget);
  }

  void verifyMaterialCompositionDisplayed() {
    expect(find.byKey(WidgetKeys.materialComposition), findsOneWidget);
  }

  void verifyMaterialDeliveryInstructionsDisplayed() {
    expect(find.byKey(WidgetKeys.materialDeliveryInstructions), findsOneWidget);
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
    expect(find.text('Batch'), findsOneWidget);
  }

  void verifyExpiryLabelDisplayed(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Expiry'.tr(), value)),
      findsOneWidget,
    );
  }
}
