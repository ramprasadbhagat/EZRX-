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
  final updateButton = find.text('Update', skipOffstage: false).last;
  final specialInstructionField =
      find.byKey(const Key('specialInstructionKey'));
  final poReference = find.byKey(const Key('customerPOReferenceKey'));
  final contactPerson = find.byKey(const Key('contactPersonKey'));
  final customerPOReferenceField =
      find.byKey(const Key('customerPOReferenceKey'));
  final collectiveNumberField = find.byKey(const Key('collectiveNumberKey'));
  final referenceNoteKey = find.byKey(const Key('referenceNoteKey'));

  void verify() {
    expect(find.byKey(const Key('orderSummaryKey')), findsOneWidget);
  }

  void verifyEdiCustomer() {
    expect(find.byKey(const Key('ediCustomerOrderDisable')), findsOneWidget);
  }

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
    expect(phone, findsWidgets);
  }

  void findCustomerPoReference() {
    expect(customerPOReferenceField, findsOneWidget);
  }

  Future<void> enterCustomerPoReference(String value) async {
    await tester.enterText(customerPOReferenceField, value);
    await tester.pumpAndSettle();
  }

  void findSpecialInstruction() {
    expect(specialInstructionField, findsOneWidget);
  }

  Future<void> enterSpecialInstruction(String value) async {
    await tester.enterText(specialInstructionField, value);
    await tester.pumpAndSettle();
  }

  void findCollectiveNumber() {
    expect(collectiveNumberField, findsOneWidget);
  }

  Future<void> enterCollectiveNumber(String value) async {
    await tester.enterText(collectiveNumberField, value);
    await tester.pumpAndSettle();
  }

  void findContactPerson() {
    expect(contactPerson, findsOneWidget);
  }

  Future<void> enterContactPerson(String value) async {
    await tester.enterText(contactPerson, value);
    await tester.pumpAndSettle();
  }

  Future<void> getKeyboardDown() async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  void findCustomerPOReference() {
    expect(poReference, findsOneWidget);
  }

  Future<void> enterCustomerPOReference(String value) async {
    await tester.enterText(poReference, value);
    await tester.pumpAndSettle();
  }

  void findSelectPaymentTerm() {
    expect(selectPaymentTerm, findsOneWidget);
  }

  void doNotFindSelectPaymentTerm() {
    expect(selectPaymentTerm, findsNothing);
  }

  Future<void> tapSelectPaymentTerm() async {
    await tester.ensureVisible(selectPaymentTerm);
    await tester.pumpAndSettle();
    await tester.tap(selectPaymentTerm);
    await tester.pumpAndSettle();
  }

  void allowMinimumOrderAmount(String amount) {
    expect(find.byKey(Key('Min. Order Value$amount')), findsOneWidget);
  }

  void findBundleItem(String bundleCode) {
    expect(
      find.byKey(
        Key('bundleCartItem$bundleCode'),
      ),
      findsOneWidget,
    );
  }

  void findBundleMaterialItem(String materialNumber, int quantity) {
    expect(
      find.byKey(
        Key('bundleMaterial$materialNumber$quantity'),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapPaymentTerm() async {
    final selectPaymentOption = find.textContaining('T025-').last;
    await tester.tap(selectPaymentOption);
    await tester.pumpAndSettle();
  }

  Future<void> scrollToContinueButton(int index) async {
    final orderSummaryKey = find.byKey(const ValueKey('orderSummaryKey'));
    await tester.dragUntilVisible(
      continueButton.at(index),
      orderSummaryKey,
      const Offset(100, 100),
    );
    await tester.pump();
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

  void verifyIfHideStockDisplayIsEnable(String materialNumber) {
    final stockInfo = find.byKey(Key('Stock$materialNumber'));
    expect(stockInfo, findsNothing);
  }

  bool verifyPOReferenceValidationCheck() {
    return find.textContaining('PO Reference Required').evaluate().isNotEmpty;
  }

  void findMaterialItem(String materialNumber, int quantity) {
    final material = find.byKey(ValueKey('$materialNumber$quantity'));
    expect(material, findsOneWidget);
  }

  void verifyMaterialListPrice(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var listPrice = find.text('List Price: NA');
    if (isConfigPriceEnabled) {
      listPrice = find.text('List Price: $currency $price');
    }
    expect(listPrice, findsOneWidget);
  }

  void verifyMaterialUnitPrice(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var unitPrice = find.text('Unit Price: NA');
    if (isConfigPriceEnabled) {
      unitPrice = find.text('Unit Price: $currency $price');
    }
    expect(unitPrice, findsOneWidget);
  }

  void verifyMaterialUnitPriceForVN(String currency, String price) {
    final unitPrice = find.text('Unit Price: $price $currency');

    expect(unitPrice, findsOneWidget);
  }

  void verifyMaterialTotalPriceVN(String currency, String price) {
    final totalPrice = find.text('Total Price: $price $currency');

    expect(totalPrice, findsOneWidget);
  }

  void verifyMaterialTotalPrice(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var totalPrice = find.text('Total Price: NA');
    if (isConfigPriceEnabled) {
      totalPrice = find.text('Total Price: $currency $price');
    }
    expect(totalPrice, findsOneWidget);
  }

  void verifySubTotalPrice(String currency, String price) {
    if (currency.contains('VND')) {
      expect(find.byKey(Key('Subtotal$price $currency')), findsOneWidget);
    } else {
      expect(find.byKey(Key('Subtotal$currency $price')), findsOneWidget);
    }
  }

  void verifyGrandTotalPrice(String currency, String price) {
    if (currency.contains('VND')) {
      expect(find.byKey(Key('Grand Total$price $currency')), findsOneWidget);
    } else {
      expect(find.byKey(Key('Grand Total$currency $price')), findsOneWidget);
    }
  }

  void verifyBundleMaterialListPrice(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var listPrice = find.text(
      'List Price: NA',
    );
    if (isConfigPriceEnabled) {
      listPrice = find.text(
        'List Price: $currency $price',
      );
    }
    expect(listPrice, findsOneWidget);
  }

  void verifyBundleMaterialUnitPrice(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var unitPrice = find.text(
      'Unit Price: NA',
    );
    if (isConfigPriceEnabled) {
      unitPrice = find.text(
        'Unit Price: $currency $price',
      );
    }
    expect(unitPrice, findsOneWidget);
  }

  void verifyBundleMaterialTotalDiscount(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var totalPrice = find.text(
      'Total Discount: NA',
    );
    if (isConfigPriceEnabled) {
      totalPrice = find.text(
        'Total Discount: $currency $price',
      );
    }
    expect(totalPrice, findsOneWidget);
  }

  void verifyBundleMaterialTotalAmount(
    bool isConfigPriceEnabled,
    String currency,
    String price,
  ) {
    var totalPrice = find.text(
      'Total Amount: NA',
    );
    if (isConfigPriceEnabled) {
      totalPrice = find.text(
        'Total Amount: $currency $price',
      );
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

  void findUpdate() {
    expect(updateButton, findsOneWidget);
  }

  void verifyPostalCode(String postalCode) {
    final postal = find.byKey(Key('Postal Code$postalCode'));
    expect(postal, findsWidgets);
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

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }

  bool verifyPOReferenceValidation() {
    final validationError =
        find.textContaining('PO Reference Required').evaluate().isNotEmpty;
    if (validationError) {
      expect(find.textContaining('PO Reference Required'), findsNWidgets(1));
      return true;
    } else {
      expect(find.textContaining('PO Reference Required'), findsNothing);
      return false;
    }
  }

  void findReferenceNote() {
    expect(referenceNoteKey, findsOneWidget);
  }

  Future<void> enterReferenceNote(String value) async {
    await tester.enterText(referenceNoteKey, value);
    await tester.pumpAndSettle();
  }

  void findPoAttachmentUpload() {
    final findPoAttachmentUpload =
        find.byKey(const Key('poAttachmentUploadButton'));
    expect(findPoAttachmentUpload, findsOneWidget);
  }
}
