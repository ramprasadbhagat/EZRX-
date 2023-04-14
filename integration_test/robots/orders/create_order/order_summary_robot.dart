import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderSummaryRobot {
  final WidgetTester tester;

  OrderSummaryRobot(this.tester);

  final selectPaymentTerm =
      find.byKey(const Key('_paymentTermTextKey'), skipOffstage: false);
  final continueButton =
      find.byKey(const Key('continueButtonKey'), skipOffstage: false);
  final submitButton =
      find.byKey(const Key('submitButtonKey'), skipOffstage: false).last;
  final saveButton = find.text('Save', skipOffstage: false).last;
  final orderTemplate = find.byKey(const Key('orderSummarySaveTemplate'));
  final saveTemplateButton = find.byKey(const Key('saveButton'));

  void verifyCustomerName(String name) {
    final customerName = find.textContaining(name);
    expect(customerName, findsOneWidget);
  }

  void verifyCustomerEmail(String email) {
    final customerEmail = find.byKey(Key('Customer Email$email'));
    expect(customerEmail, findsOneWidget);
  }

  void verifyShipToID(String shipTo) {
    final shipToCode = find.byKey(Key('Ship to ID$shipTo'));
    expect(shipToCode, findsOneWidget);
  }

  void verifySoldToID(String soldTo) {
    final soldToCode = find.byKey(Key('Customer sold to ID$soldTo'));
    expect(soldToCode, findsOneWidget);
  }

  void verifyCountry(String countryName) {
    final country = find.byKey(Key('Country$countryName'));
    expect(country, findsNWidgets(2));
  }

  void verifyPhone(String phoneName) {
    final phone = find.byKey(Key('Phone$phoneName'));
    expect(phone, findsNWidgets(2));
  }

  Future<void> enterContactPerson(String value) async {
    final contactPerson = find.byKey(const Key('contactPersonKey'));
    expect(contactPerson, findsOneWidget);
    await tester.enterText(contactPerson, value);
    await tester.pumpAndSettle();
  }

  void findSelectPaymentTerm() {
    expect(selectPaymentTerm, findsOneWidget);
  }

  Future<void> tapSelectPaymentTerm() async {
    await tester.ensureVisible(selectPaymentTerm);
    await tester.pumpAndSettle();
    await tester.tap(selectPaymentTerm);
    await tester.pumpAndSettle();
  }

  Future<void> tapPaymentTerm() async {
    final selectPaymentOption = find.textContaining('T025-').last;
    await tester.tap(selectPaymentOption);
    await tester.pumpAndSettle();
  }

  void findContinueButton(int index) {
    expect(continueButton.at(index), findsOneWidget);
  }

  Future<void> tapContinueButton(int index) async {
    await tester.tap(continueButton.at(index));
    await tester.pumpAndSettle();
  }

  void verifyTotals(String currency, String price) {
    final subTotal = find.textContaining(': $currency $price');
    expect(subTotal, findsNWidgets(3));
  }

  void findMaterialItem(String materialNumber, int quantity) {
    final material = find.byKey(ValueKey('$materialNumber$quantity'));
    expect(material, findsOneWidget);
  }

  void verifyMaterialListPrice(
      bool isConfigPriceEnabled, String currency, String price) {
    var listPrice = find.text('List Price: NA');
    if (isConfigPriceEnabled) {
      listPrice = find.text('List Price: $currency $price');
    }
    expect(listPrice, findsOneWidget);
  }

  void verifyMaterialUnitPrice(
      bool isConfigPriceEnabled, String currency, String price) {
    var unitPrice = find.text('Unit Price: NA');
    if (isConfigPriceEnabled) {
      unitPrice = find.text('Unit Price: $currency $price');
    }
    expect(unitPrice, findsOneWidget);
  }

  void verifyMaterialTotalPrice(
      bool isConfigPriceEnabled, String currency, String price) {
    var totalPrice = find.text('Total Price: NA');
    if (isConfigPriceEnabled) {
      totalPrice = find.text('Total Price: $currency $price');
    }
    expect(totalPrice, findsOneWidget);
  }

  void findSubmit() {
    expect(submitButton, findsOneWidget);
  }

  Future<void> tapSubmit() async {
    await tester.ensureVisible(submitButton);
    await tester.pumpAndSettle();
    await tester.tap(submitButton);
    await tester.pumpAndSettle();
  }

  void findSave() {
    expect(saveButton, findsOneWidget);
  }

  Future<void> tapSave() async {
    await tester.ensureVisible(saveButton);
    await tester.pumpAndSettle();
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  void verifyPostalCode(String postalCode) {
    final postal = find.byKey(Key('Postal Code$postalCode'));
    expect(postal, findsOneWidget);
  }

  void findAddQuantity(String materialNumber) {
    final cartAddButton = find.byKey(Key('cartAdd$materialNumber'));
    expect(cartAddButton, findsOneWidget);
  }

  Future<void> tapAddQuantity(String materialNumber) async {
    final cartAddButton = find.byKey(Key('cartAdd$materialNumber'));
    await tester.tap(cartAddButton);
    await tester.pumpAndSettle();
  }

  void findOrderTemplate() {
    expect(orderTemplate, findsOneWidget);
  }

  Future<void> tapOrderTemplate() async {
    await tester.tap(orderTemplate);
    await tester.pumpAndSettle();
  }

  void verifySaveTemplateDialog() {
    final dialog = find.byKey(const Key('saveTemplateDialog'));
    expect(dialog, findsOneWidget);
  }

  Future<void> enterTemplateName(String name) async {
    final templateField = find.byKey(const Key('saveTemplateInputField'));
    expect(templateField, findsOneWidget);
    await tester.enterText(templateField, name);
    await tester.pump();
  }

  void findTemplateSaveButton() {
    expect(saveTemplateButton, findsOneWidget);
  }

  Future<void> tapTemplateSaveButton() async {
    await tester.tap(saveTemplateButton);
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
