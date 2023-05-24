import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialListRobot {
  final WidgetTester tester;

  MaterialListRobot(this.tester);

  final cartButton = find.byKey(const Key('cartButton'));
  final orderTypeSelector = find.byKey(const ValueKey('orderTypeSelector'));
  final change = find.byKey(const ValueKey('Change'));
  final cancel = find.byKey(const ValueKey('Cancel'));

  void verify() {
    expect(find.byKey(const Key('materialListPage')), findsOneWidget);
  }

  void verifyDisableOrderTypeSelection() {
    final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
    expect(orderTypeSelector, findsNothing);
  }

  void verifyDefaultMaterialDescription({required String materialNumber}) {
    final defaultMaterialDescription =
        find.byKey(Key('defaultMaterialDescription$materialNumber'));
    expect(defaultMaterialDescription, findsOneWidget);
  }

  void verifyGenericMaterialDescription({required String materialNumber}) {
    final genericMaterialDescription =
        find.byKey(Key('genericMaterial$materialNumber'));
    expect(genericMaterialDescription, findsOneWidget);
  }

  Future<void> search(String materialNumber) async {
    final materialSearchField = find.byKey(const Key('materialSearchField'));
    expect(materialSearchField, findsOneWidget);
    await tester.enterText(materialSearchField, materialNumber);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyMaterialPrice() {
    expect(find.textContaining('List Price:'.tr()), findsWidgets);
  }

  void verifyCurrencyCheck(String currencyCode) {
    expect(find.textContaining(currencyCode), findsWidgets);
  }

  void verifyEnableGMC() {
    expect(find.textContaining('Government Material Code:'.tr()), findsWidgets);
  }

  void verifyEnableListPrice(String materialNumber) {
    expect(find.byKey(Key('listPrice$materialNumber')), findsOneWidget);
  }

  Future<void> tapMaterial(String materialNumber) async {
    final materialOption = find.byKey(Key('materialOption$materialNumber'));
    expect(materialOption, findsOneWidget);
    await tester.tap(materialOption);
    await tester.pumpAndSettle();
  }

  void findCartButton() {
    expect(cartButton, findsOneWidget);
  }

  Future<void> tapCartButton() async {
    await tester.tap(cartButton);
    await tester.pumpAndSettle();
  }

  void findFavoriteIcon(String materialNumber) {
    final favoriteIcon = find.byKey(Key('favoriteButtonKey$materialNumber'));
    expect(favoriteIcon, findsWidgets);
  }

  Future<void> tapFavoriteIcon(String materialNumber) async {
    final favoriteIcon = find.byKey(Key('favoriteButtonKey$materialNumber'));
    await tester.tap(favoriteIcon);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> clearSearchMaterial() async {
    await tester.tap(find.byKey(const Key('clearSearch')));
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }


  void findItemRegistrationNumber(String materialNumber) {
    final registrationNumber =
        find.byKey(ValueKey('registrationNumber$materialNumber'));
    expect(registrationNumber, findsOneWidget);
  }

  void verifyOrderTypeSelector() {
    expect(orderTypeSelector, findsOneWidget);
  }

  Future<void> tapOrderTypeSelector() async {
    await tester.tap(orderTypeSelector);
    await tester.pumpAndSettle();
  }

  void findOrderDocumentTypeSectorDialog() {
    final orderDocumentTypeSectorDialog =
        find.byKey(const ValueKey('orderDocumentTypeSectorDialog'));
    expect(orderDocumentTypeSectorDialog, findsOneWidget);
  }

  void findOrderDocumentType(String orderType) {
    final orderDocumentType =
        find.byKey(ValueKey('orderType${orderType.toUpperCase()}'));
    expect(orderDocumentType, findsOneWidget);
  }

  Future<void> tapOrderType(String orderType) async {
    final orderDocumentType =
        find.byKey(ValueKey('orderType${orderType.toUpperCase()}'));
    await tester.tap(orderDocumentType);
    await tester.pumpAndSettle();
  }

  void findCartClearDialog() {
    final orderTypeChangeCartClearDialog =
        find.byKey(const ValueKey('customerCodeDialogChange'));
    expect(orderTypeChangeCartClearDialog, findsOneWidget);
  }

  void findOrderTypeChangeDialogCancel() {
    expect(cancel, findsOneWidget);
  }

  Future<void> cancelClearCart() async {
    await tester.tap(cancel);
    await tester.pumpAndSettle();
  }

  void findOrderTypeDialogChange() {
    expect(change, findsOneWidget);
  }

  Future<void> clearCart() async {
    await tester.tap(change);
    await tester.pumpAndSettle();
  }
  
  void displayPriceBeforeVat(String materialNumber) {
    final priceBeforeVat = find.byKey(Key('priceBefore$materialNumber'));
    expect(priceBeforeVat, findsOneWidget);
  }
}
