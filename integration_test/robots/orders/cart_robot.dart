import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CartRobot {
  final WidgetTester tester;

  CartRobot(this.tester);

  final orderSummary = find.byKey(const ValueKey('orderSummaryButton'));
  final remarkTextField = find.byKey(const Key('remarkTextField'));
  final addBonusButton = find.byKey(const Key('addBonusButton'));
  final discountOverrideToggle =
      find.byKey(const Key('discountOverrideToggle'));

  void verify() {
    final cartPage = find.byKey(const Key('cartpage'));
    expect(cartPage, findsOneWidget);
  }

  void verifyExpiryMaterial(String materialNumber) {
    expect(find.byKey(Key('expiryDate$materialNumber')), findsOneWidget);
  }

  void verifyEnableDiscountOverrideMaterial() {
    expect(discountOverrideToggle, findsOneWidget);
  }

  Future<void> setDiscountOverrideMaterial(double discountPercentage) async {
    await tester.tap(discountOverrideToggle);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('discountOvverrideField')),
        discountPercentage.toString());
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Submit')),);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  void verifyDiscountOverridePercentage(double discountPercentage) {
    expect(find.byKey(Key('discountOverridePercentage$discountPercentage')), findsOneWidget);
  }

  void findMaterialItem(String materialNumber, int quantity) {
    final material = find.byKey(ValueKey('$materialNumber$quantity'));
    expect(material, findsOneWidget);
  }

  Future<void> findBundleItem(String bundleCode) async {
    final material =
        find.byKey(ValueKey('bundleCartItem$bundleCode'), skipOffstage: false);
    await tester.ensureVisible(material);
    await tester.pumpAndSettle();
  }

  void findBundleMaterialItem(String materialNumber, int quantity) {
    final material = find.byKey(
      Key('bundleMaterial$materialNumber$quantity'),
    );
    expect(material, findsOneWidget);
  }

  void verifyEnableVatAtTotalLevel(String materialNumber, int percentage) {
    expect(find.byKey(const Key('taxCodeInPercentageKey')), findsOneWidget);
    expect(find.textContaining('$percentage%'), findsOneWidget);
    expect(find.byKey(const Key('totalTaxKey')), findsOneWidget);
    expect(find.byKey(Key('pricebefore$materialNumber')), findsNothing);
  }

  void findRemarkText(String remark) {
    expect(find.byKey(Key('remarks$remark')), findsOneWidget);
  }

  void findRemarkButton(String materialNumber) {
    expect(find.byKey(Key('addRemarks$materialNumber')), findsOneWidget);
  }

  Future<void> addRemark(String materialNumber, String remark) async {
    final addRemarksMaterial = find.byKey(Key('addRemarks$materialNumber'));
    await tester.tap(addRemarksMaterial);
    await tester.pumpAndSettle();
    await tester.enterText(remarkTextField, remark);
    await tester.pumpAndSettle();
    final addRemark = find.byKey(const Key('add'));
    await tester.tap(addRemark);
    await tester.pumpAndSettle();
  }

  Future<void> editRemark(String materialNumber, String remark) async {
    final editDeleteDialogRemark =
        find.byKey(Key('editDeleteDialog$materialNumber'));
    await tester.tap(editDeleteDialogRemark);
    await tester.pumpAndSettle();
    final editRemark = find.byKey(const Key('editRemark'));
    await tester.tap(editRemark);
    await tester.pumpAndSettle();
    await tester.enterText(remarkTextField, remark);
    await tester.pumpAndSettle();
    final updateRemark = find.byKey(const Key('update'));
    await tester.tap(updateRemark);
    await tester.pumpAndSettle();
  }

  Future<void> deleteRemark(String materialNumber) async {
    final editDeleteDialogRemark =
        find.byKey(Key('editDeleteDialog$materialNumber'));
    await tester.tap(editDeleteDialogRemark);
    await tester.pumpAndSettle();
    final deleteRemark = find.byKey(const Key('deleteRemark'));
    await tester.tap(deleteRemark);
    await tester.pumpAndSettle();
  }

  Future<void> tapMaterial(String absoluteMaterialNumber) async {
    await tester.tap(find.textContaining(absoluteMaterialNumber));
    await tester.pumpAndSettle();
  }

  void findAddBonusButton() {
    expect(addBonusButton, findsOneWidget);
  }

  Future<void> tapAddBonusButton() async {
    await tester.tap(addBonusButton);
    await tester.pumpAndSettle();
  }

  void verifyBonusMaterial(
      String materialNumber, bool additionalBonusFlag, int quantity) {
    expect(find.byKey(Key('$materialNumber$additionalBonusFlag$quantity')),
        findsOneWidget);
  }

  void findAddQuantity(String materialNumber) {
    final cartAddButton = find.byKey(Key('cartAdd$materialNumber'));
    expect(cartAddButton, findsOneWidget);
  }

  void verifyEnablePriceOverride(String materialNumber) {
    expect(find.byKey(Key('priceOverride$materialNumber')), findsOneWidget);
  }

  Future<void> tapPrice(String materialNumber) async {
    await tester.tap(find.byKey(Key('priceOverride$materialNumber')));
    await tester.pumpAndSettle();
  }

  Future<void> changePrice(int quantity) async {
    await tester.enterText(find.byKey(const Key('priceOverrideTextFormField')),
        quantity.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapPriceOverrideButton() async {
    final priceOverrideButton =
        find.byKey(const Key('priceOverrideSubmitButton'));
    await tester.tap(priceOverrideButton);
    await tester.pumpAndSettle();
  }

  void findOrderSummary() {
    expect(orderSummary, findsOneWidget);
  }

  Future<void> tapAddQuantity(String materialNumber) async {
    final cartAddButton = find.byKey(Key('cartAdd$materialNumber'));
    await tester.tap(cartAddButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapDeductQuantity(String materialNumber) async {
    final cartDeleteButton = find.byKey(Key('cartDelete$materialNumber'));
    await tester.tap(cartDeleteButton);
    await tester.pumpAndSettle();
  }

  Future<void> changeQuantity(String materialNumber, int quantity) async {
    final changeQuantityButton = find.byKey(Key('cartItem$materialNumber'));
    await tester.enterText(changeQuantityButton, quantity.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapOrderSummary() async {
    await tester.pumpAndSettle();
    await tester.ensureVisible(orderSummary);
    await tester.tap(orderSummary);
    await tester.pumpAndSettle();
  }

  void verifyTotal(String currencyCode, String price) {
    final totals = find.textContaining('$currencyCode $price');
    expect(totals, findsNWidgets(2));
  }

  Future<void> deleteMaterial(String materialNumber) async {
    await tester.tap(find.byKey(Key('deleteFromCart$materialNumber')));
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
