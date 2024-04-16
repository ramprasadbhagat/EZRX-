import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class CartRobot {
  final WidgetTester tester;

  CartRobot(this.tester);

  final cartPage = find.byKey(WidgetKeys.cartPage);
  final scrollList = find.byKey(WidgetKeys.scrollList);
  final browseProductButton = find.byKey(WidgetKeys.startBrowsingProducts);
  final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
  final clearCartButton = find.byKey(WidgetKeys.cartClearButton);
  final defaultScrollOffset = const Offset(0, -200);
  final defaultSwipeOffset = const Offset(-100, -60);
  final swipeDeleteButton = find.byKey(WidgetKeys.cartItemSwipeDeleteButton);
  final counterOfferButton = find.byKey(WidgetKeys.counterOfferPriceButtonKey);
  final bonusSampleButton = find.byKey(WidgetKeys.bonusSampleItemButtonKey);
  final govtMaterialListPrice = find.byKey(WidgetKeys.govtMaterialListPrice);
  final materialDetailsStock = find.byKey(WidgetKeys.materialDetailsStock);
  final expiryDateIcon = find.byKey(WidgetKeys.expiryDateInfoIcon);

  void verifyPage() {
    expect(cartPage, findsOneWidget);
  }

  bool get isCartPage => cartPage.evaluate().isNotEmpty;

  Future<void> verifyCovidMaterial(String materialNumber) async {
    await verifyMaterial(materialNumber);
    expect(find.byKey(WidgetKeys.covidLabel), findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> clearCart() async {
    if (clearCartButton.evaluate().isNotEmpty) {
      await tapClearCartButton();
      await verifyClearCartSuccessMessage();
    }
  }

  Future<void> tapClearCartButton() async {
    await tester.tap(clearCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> verifyClearCartSuccessMessage() async {
    final clearCartSuccessMessage = find.descendant(
      of: find.byKey(WidgetKeys.customSnackBar),
      matching: find.text('Cart has been emptied.'.tr()),
    );
    await tester.pumpUntilVisible(clearCartSuccessMessage);
  }

  void verifyTaxDescription() {
    expect(
      find.text('Applies to materials with full tax'.tr()),
      findsOneWidget,
    );
  }

  void verifyClearCartButton() {
    expect(clearCartButton, findsOneWidget);
  }

  void verifyNoRecordFound() {
    expect(
      find.byKey(WidgetKeys.noRecordsFoundSearchIcon),
      findsOneWidget,
    );
    expect(
      find.text('Your cart is empty'.tr()),
      findsOneWidget,
    );
    expect(
      find.textContaining(
        'Looks like you haven’t added anything to your cart yet'.tr(),
      ),
      findsOneWidget,
    );
    expect(
      browseProductButton,
      findsOneWidget,
    );
  }

  Future<void> tapBrowseProductButton() async {
    await tester.tap(browseProductButton);
    await tester.pumpAndSettle();
  }

  void verifyManufacturerName(String text) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.cartPrincipalLabel),
        matching: find.text(text),
      ),
      findsOneWidget,
    );
  }

  void verifyCheckoutButton() {
    expect(checkoutButton, findsOneWidget);
  }

  Future<void> tapCheckoutButton() async {
    await tester.tap(checkoutButton);
    await tester.pumpAndSettle();
  }

  void verifyQtyOnAppBar(int qty) {
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.cartPageAppBarTitle)).data,
      contains(qty.toString()),
    );
  }

  void verifyMOVWarningMessage(
    String minimumOrderAmount, {
    required bool isVisible,
  }) {
    expect(
      find.text(
        '${'Please ensure that the order value satisfies the minimum order value of'.tr()} $minimumOrderAmount',
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifyCartQty(int qty) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.priceSummaryTotalQty &&
            widget is Text &&
            (widget.data ?? '').contains(qty.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyCartShipToAddress(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.cartShipToAddress &&
            widget is Text &&
            (widget.data ?? '').contains(address.toString()),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapToSeePriceBreakDown() async {
    expect(
      find.byKey(WidgetKeys.priceSummaryListTile),
      findsOneWidget,
    );
    await tester.tap(find.byKey(WidgetKeys.priceSummaryListTile));
    await tester.pumpAndSettle(Durations.medium1);
  }

  String get getSmallOrderFeeValue {
    final smallOrderFeeFinder =
        find.byKey(WidgetKeys.checkoutSummarySmallOrderFeePrice);
    return tester.widget<PriceComponent>(smallOrderFeeFinder).price;
  }

  Future<void> tapToClosePriceBreakDown() async {
    await tester.tap(
      find.descendant(
        of: find.byKey(WidgetKeys.closeButton),
        matching: find.text('Close'.tr()),
      ),
    );
    await tester.pumpAndSettle(Durations.medium1);
  }

  Future<void> tapShowShipToAddressDetail() async {
    await tester.tap(find.byKey(WidgetKeys.cartShipToAddress));
    await tester.pumpAndSettle();
  }

  void verifyCartTotalPrice(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.priceSummaryGrandTotal),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapShowPriceSummary() async {
    await tester.tap(find.byKey(WidgetKeys.priceSummaryListTile));
    await tester.pumpAndSettle();
  }

  //============================================================
  //  Material
  //============================================================

  Future<void> verifyMaterial(String materialNumber) async {
    final material = _materialItem(materialNumber);
    await tester.dragUntilVisible(material, scrollList, defaultScrollOffset);
    await tester.pump();
    expect(material, findsOneWidget);
  }

  void verifyMaterialQty(String materialNumber, int qty) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _materialItem(materialNumber),
          matching: find.byKey(WidgetKeys.quantityInputTextKey),
        ),
        matching: find.text(qty.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialImage(String materialNumber) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byType(CustomImage),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialNumber(
    String materialNumber, {
    String? govermentMaterialCode,
  }) {
    var materialCode = materialNumber;
    if (govermentMaterialCode != null) {
      materialCode = '$materialNumber | $govermentMaterialCode';
    }
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemProductMaterialNumber &&
              widget is Text &&
              widget.data == materialCode,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialDescription(String materialNumber, String text) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemProductMaterialDescription &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialUnitPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.cartItemProductUnitPrice),
          matching: find.text(price, findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyGovtMaterialListPrice(
    String materialNumber,
    String price,
  ) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.govtMaterialListPrice),
          matching:
              find.text('${'List price'.tr()}: $price', findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.cartItemProductTotalPrice),
          matching: find.text(price, findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> swipeBonusMaterialToDelete(
    String materialNumber,
    String bonusMaterialNumber,
  ) async {
    await tester.fling(
      _bonusItem(materialNumber, bonusMaterialNumber),
      defaultSwipeOffset,
      100,
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.cartItemSwipeDeleteButtonForBonus),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> swipeMaterialToDelete(String materialNumber) async {
    await tester.fling(_materialItem(materialNumber), defaultSwipeOffset, 100);
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: swipeDeleteButton,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> changeMaterialQty(String materialNumber, int qty) async {
    final textField = find.descendant(
      of: _materialItem(materialNumber),
      matching: find.byKey(WidgetKeys.quantityInputTextKey),
    );
    await tester.tap(textField);
    await tester.enterText(textField, qty.toString());
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> increaseMaterialQty(String materialNumber) async {
    await tester.tap(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byKey(WidgetKeys.cartItemAddKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> decreaseMaterialQty(String materialNumber) async {
    await tester.tap(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byKey(WidgetKeys.cartItemDeleteKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  void verifyMaterialOOSPreOrderStatus(String materialNumber) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _materialItem(materialNumber),
          matching: find.byType(StatusLabel),
        ),
        matching: find.text('OOS-Preorder'.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialOfferTag(String materialNumber) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byKey(WidgetKeys.offerTag),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialBonusTag(String materialNumber) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: find.byKey(WidgetKeys.offerTag),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialCounterOfferButton(
    String materialNumber, {
    bool isVisible = true,
  }) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: counterOfferButton,
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> tapMaterialCounterOfferButton(String materialNumber) async {
    await tester.tap(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: counterOfferButton,
      ),
    );
    await tester.pumpAndSettle();
  }

  void verifyMaterialBonusSampleButton(
    String materialNumber, {
    bool isVisible = true,
  }) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: bonusSampleButton,
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> tapMaterialBonusSampleButton(String materialNumber) async {
    await tester.tap(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: bonusSampleButton,
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder _materialItem(String materialNumber) =>
      find.byKey(WidgetKeys.cartItemProductTile(materialNumber));

  //============================================================
  //  Bundle
  //============================================================

  Future<void> verifyBundle(String bundleNumber) async {
    final bundle = _bundleItem(bundleNumber);
    await tester.dragUntilVisible(bundle, scrollList, defaultScrollOffset);
    await tester.pump();
    expect(bundle, findsOneWidget);
  }

  void verifyBundleNumber(String bundleNumber) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBundleNumber &&
              widget is Text &&
              widget.data == bundleNumber,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleName(String bundleNumber, String text) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBundleName &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleQty(String bundleNumber, int qty) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBundleQty &&
              widget is Text &&
              (widget.data ?? '').contains(qty.toString()),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleRate(String bundleNumber, int qty, String price) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBundleRate &&
              widget is Text &&
              widget.data ==
                  '${'Purchase'.tr()} $qty ${'or more for'} $price ${'per item'.tr()}',
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleTotalPrice(String bundleNumber, String price) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: find.descendant(
          of: find.byKey(WidgetKeys.cartItemBundleTotalPrice),
          matching: find.text(price, findRichText: true),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyBundleItem(
    String bundleNumber,
    String materialNumber,
  ) async {
    final material = _bundleMaterial(bundleNumber, materialNumber);
    await tester.dragUntilVisible(material, scrollList, defaultScrollOffset);
    await tester.pump();
    expect(material, findsOneWidget);
  }

  void verifyBundleItemMaterialNumber(
    String bundleNumber,
    String materialNumber,
  ) {
    expect(
      find.descendant(
        of: _bundleMaterial(bundleNumber, materialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemProductMaterialNumber &&
              widget is Text &&
              widget.data == materialNumber,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleItemMaterialDescription(
    String bundleNumber,
    String materialNumber,
    String text,
  ) {
    expect(
      find.descendant(
        of: _bundleMaterial(bundleNumber, materialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemProductMaterialDescription &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleItemPrincipalName(
    String bundleNumber,
    String materialNumber,
    String text,
  ) {
    expect(
      find.descendant(
        of: _bundleMaterial(bundleNumber, materialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemProductPrincipalName &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleItemQty(
    String bundleNumber,
    String materialNumber,
    int qty,
  ) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _bundleMaterial(bundleNumber, materialNumber),
          matching: find.byKey(WidgetKeys.quantityInputTextKey),
        ),
        matching: find.text(qty.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleItemDeleteButton(
    String bundleNumber,
    String materialNumber,
  ) {
    expect(
      find.descendant(
        of: _bundleMaterial(bundleNumber, materialNumber),
        matching: find.byKey(WidgetKeys.cartItemProductDeleteButton),
      ),
      findsOneWidget,
    );
  }

  Future<void> swipeBundleToDelete(String bundleNumber) async {
    await tester.fling(_bundleItem(bundleNumber), defaultSwipeOffset, 100);
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: swipeDeleteButton,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> changeBundleItemQty(
    String bundleNumber,
    String materialNumber,
    int qty,
  ) async {
    final textField = find.descendant(
      of: _bundleMaterial(bundleNumber, materialNumber),
      matching: find.byKey(WidgetKeys.quantityInputTextKey),
    );
    await tester.tap(textField);
    await tester.enterText(textField, qty.toString());
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> increaseBundleItemQty(
    String bundleNumber,
    String materialNumber,
  ) async {
    await tester.tap(
      find.descendant(
        of: _bundleMaterial(bundleNumber, materialNumber),
        matching: find.byKey(WidgetKeys.cartItemAddKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> decreaseBundleItemQty(
    String bundleNumber,
    String materialNumber,
  ) async {
    await tester.tap(
      find.descendant(
        of: _bundleMaterial(bundleNumber, materialNumber),
        matching: find.byKey(WidgetKeys.cartItemDeleteKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder _bundleMaterial(String bundleNumber, String materialNumber) =>
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: _materialItem(materialNumber),
      );

  Finder _bundleItem(String bundleNumber) =>
      find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));

  //============================================================
  //  Bonus
  //============================================================

  Future<void> verifyBonusMaterial(
    String materialNumber,
    String bonusMaterialNumber,
  ) async {
    final bonus = _bonusItem(materialNumber, bonusMaterialNumber);
    await tester.dragUntilVisible(bonus, scrollList, defaultScrollOffset);
    await tester.pump();
    expect(bonus, findsOneWidget);
  }

  void verifyBonusMaterialDescription(
    String materialNumber,
    String bonusMaterialNumber,
    String text,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBonusMaterialDescription &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialImage(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(CustomImage),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyBonusMaterialQty(
    String materialNumber,
    String bonusMaterialNumber,
    int qty,
  ) async {
    final qtyLabel = find.descendant(
      of: find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.bonusOfferItemInputKey),
      ),
      matching: find.text(qty.toString()),
    );
    await tester.pumpUntilVisible(qtyLabel);
    expect(qtyLabel, findsOneWidget);
  }

  void verifyBonusMaterialFreeLabel(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.cartItemBonusFreeLabel),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialTag(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(BonusTag),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialTagNotVisibleForID(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(BonusTag),
      ),
      findsNothing,
    );
  }

  Future<void> increaseBonusMaterialQty(
    String materialNumber,
    String bonusMaterialNumber,
  ) async {
    await tester.tap(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.bonusOfferItemAddKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> decreaseBonusMaterialQty(
    String materialNumber,
    String bonusMaterialNumber,
  ) async {
    await tester.tap(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.bonusOfferItemDeleteKey),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder _bonusItem(String materialNumber, String bonusMaterialNumber) =>
      find.byKey(WidgetKeys.cartItemBonus(materialNumber, bonusMaterialNumber));

  void verifyPriceNotAvailableForAtLeastOneItem() {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.priceNotAvailableMessageWidget),
        matching: find.text(
          'Price is not available for at least one item. Grand total reflected may not be accurate.',
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialExpiryDateAndBatch(
    String materialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: _materialItem(materialNumber),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch:'.tr()} ${stockInfo.batch.displayLabel}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'EXP:'.tr()} ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }

  Future<void> tapMaterialExpiryDateInfoIcon(String materialNumber) async {
    final materialExpiryDateIcon = find.descendant(
      of: _materialItem(materialNumber),
      matching: expiryDateIcon,
    );
    expect(materialExpiryDateIcon, findsOneWidget);
    await tester.tap(materialExpiryDateIcon);
    await tester.pumpAndSettle();
  }

  void verifyBundleItemExpiryDateAndBatch(
    String bundleNumber,
    String materialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: _bundleMaterial(bundleNumber, materialNumber),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch:'.tr()} ${stockInfo.batch.displayLabel}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'EXP:'.tr()} ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }

  Future<void> tapBundleItemExpiryDateInfoIcon(
    String bundleNumber,
    String materialNumber,
  ) async {
    final materialExpiryDateIcon = find.descendant(
      of: _bundleMaterial(bundleNumber, materialNumber),
      matching: expiryDateIcon,
    );
    expect(materialExpiryDateIcon, findsOneWidget);
    await tester.tap(materialExpiryDateIcon);
    await tester.pumpAndSettle();
  }

  void verifyBonusItemExpiryDateAndBatch(
    String materialNumber,
    String bonusMaterialNumber,
    StockInfo stockInfo, {
    bool isExpiryDateVisible = true,
    bool isBatchNumberVisible = true,
  }) {
    final stockWidget = find.descendant(
      of: _bonusItem(materialNumber, bonusMaterialNumber),
      matching: materialDetailsStock,
    );
    if (!isExpiryDateVisible && !isBatchNumberVisible) {
      expect(stockWidget, findsNothing);
      return;
    }
    expect(stockWidget, findsOneWidget);
    final richText =
        (tester.widget<RichText>(stockWidget).text as TextSpan).toPlainText();
    final texts = <String>[];
    if (isBatchNumberVisible) {
      texts.add('${'Batch:'.tr()} ${stockInfo.batch.displayLabel}');
    }
    if (isExpiryDateVisible) {
      texts.add('${'EXP:'.tr()} ${stockInfo.expiryDate.dateOrNaString}');
    }
    final stockText = texts.join(' - ');
    expect(richText.contains(stockText), true);
  }

  Future<void> tapBonusItemExpiryDateInfoIcon(
    String materialNumber,
    String bonusMaterialNumber,
  ) async {
    final materialExpiryDateIcon = find.descendant(
      of: _bonusItem(materialNumber, bonusMaterialNumber),
      matching: expiryDateIcon,
    );
    expect(materialExpiryDateIcon, findsOneWidget);
    await tester.tap(materialExpiryDateIcon);
    await tester.pumpAndSettle();
  }

  //============================================================
  //  Promotion For ID
  //============================================================
  void verifyAplPromotionLabelForItem({
    required String materialNumber,
  }) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.cartPromotions(materialNumber) &&
            widget is Text &&
            widget.data!.contains('offer applied'.tr()),
      ),
      findsOneWidget,
    );
  }
}
