import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
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
  final defaultSwipeOffset = const Offset(-100, 0);
  final swipeDeleteButton = find.byKey(WidgetKeys.cartItemSwipeDeleteButton);
  final counterOfferButton = find.byKey(WidgetKeys.counterOfferPriceButtonKey);
  final bonusSampleButton = find.byKey(WidgetKeys.bonusSampleItemButtonKey);

  void verifyPage() {
    expect(cartPage, findsOneWidget);
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
      find.text(
        'Looks like you haven’t added anything to your cart yet.'.tr(),
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
            widget.key == WidgetKeys.checkoutStickyTotalQty &&
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

  Future<void> tapShowShipToAddressDetail() async {
    await tester.tap(find.byKey(WidgetKeys.cartShipToAddress));
    await tester.pumpAndSettle();
  }

  void verifyCartTotalPrice(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.checkoutStickyGrandTotal),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
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

  void verifyMaterialNumber(String materialNumber) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
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

  Future<void> swipeMaterialToDelete(String materialNumber) async {
    await tester.drag(_materialItem(materialNumber), defaultSwipeOffset);
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

  void verifyMaterialCounterOfferButton(String materialNumber) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: counterOfferButton,
      ),
      findsOneWidget,
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

  void verifyMaterialBonusSampleButton(String materialNumber) {
    expect(
      find.descendant(
        of: _materialItem(materialNumber),
        matching: bonusSampleButton,
      ),
      findsOneWidget,
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
    await tester.drag(_bundleItem(bundleNumber), defaultSwipeOffset);
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

  //============================================================
  //  Bonus Sample
  //============================================================

  Future<void> verifyBonusSampleMaterial(
    String materialNumber,
    String bonusSampleMaterialNumber,
  ) async {
    final bonus = _bonusSampleItem(materialNumber, bonusSampleMaterialNumber);
    await tester.dragUntilVisible(bonus, scrollList, defaultScrollOffset);
    await tester.pump();
    expect(bonus, findsOneWidget);
  }

  void verifyBonusSampleMaterialDescription(
    String materialNumber,
    String bonusSampleMaterialNumber,
    String text,
  ) {
    expect(
      find.descendant(
        of: _bonusSampleItem(materialNumber, bonusSampleMaterialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBonusSampleMaterialDescription &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusSampleMaterialImage(
    String materialNumber,
    String bonusSampleMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusSampleItem(materialNumber, bonusSampleMaterialNumber),
        matching: find.byType(CustomImage),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusSampleMaterialQty(
    String materialNumber,
    String bonusSampleMaterialNumber,
    int qty,
  ) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _bonusSampleItem(materialNumber, bonusSampleMaterialNumber),
          matching: find.byKey(WidgetKeys.quantityInputTextKey),
        ),
        matching: find.text(qty.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusSampleMaterialFreeLabel(
    String materialNumber,
    String bonusSampleMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusSampleItem(materialNumber, bonusSampleMaterialNumber),
        matching: find.byKey(WidgetKeys.cartItemBonusSampleFreeLabel),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusSampleMaterialTag(
    String materialNumber,
    String bonusSampleMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusSampleItem(materialNumber, bonusSampleMaterialNumber),
        matching: find.byType(BonusTag),
      ),
      findsOneWidget,
    );
  }

  Finder _bonusSampleItem(
    String materialNumber,
    String bonusSampleMaterialNumber,
  ) =>
      find.byKey(
        WidgetKeys.cartItemBonus(materialNumber, bonusSampleMaterialNumber),
      );
}
