import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
  final shipToAddressSheet = find.byKey(WidgetKeys.cartShipToAddressSheet);
  final cartIsEmpty = find.text('Your cart is empty'.tr());

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
      matching: find.text('Item has been removed from cart.'.tr()),
    );

    const maxIteration = 15;
    for (var i = 0; i <= maxIteration; i++) {
      if (clearCartSuccessMessage.evaluate().isNotEmpty) {
        expect(clearCartSuccessMessage, findsOneWidget);

        break;
      }
      await tester.pumpAndSettle(const Duration(seconds: 1));
    }
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
        of: find.byKey(WidgetKeys.cartItemProductPrincipalName),
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
            widget.key == WidgetKeys.cartTotalQty &&
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

  Future<void> tapCloseShipToAddressDetail() async {
    await tester.tap(find.byKey(WidgetKeys.cartShipToAddressSheetCloseButton));
    await tester.pumpAndSettle();
  }

  void verifyShipToAddressDetail({required bool isVisible}) {
    expect(shipToAddressSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
  }

  void verifyShipToCode(String shipToCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  void verifyCartTotalPrice(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.grandTotalKey),
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
              widget.data == 'Purchase $qty or more for $price per item',
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

  Finder _bundleMaterial(String bundleNumber, String materialNumber) =>
      find.descendant(
        of: _bundleItem(bundleNumber),
        matching: _materialItem(materialNumber),
      );

  Finder _bundleItem(String bundleNumber) =>
      find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));

  void verifyCartIsEmpty() {
    expect(cartIsEmpty, findsOneWidget);
  }
}
