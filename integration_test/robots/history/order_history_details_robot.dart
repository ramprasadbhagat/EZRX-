import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderHistoryDetailsRobot {
  final WidgetTester tester;

  OrderHistoryDetailsRobot(this.tester);

  final orderDetails = find.text('Order Details');
  final soldToAddress = find.text('Sold to Address');
  final shipToAddress = find.text('Ship to Address');
  final orderSummary = find.text('Order Summary');
  final backButton =
      find.byKey(const ValueKey('backToOrderHistoryDetailsPage'));

  void verify() {
    final orderHistoryDetails =
        find.byKey(const ValueKey('orderHistoryDetailsPage'));
    expect(orderHistoryDetails, findsOneWidget);
  }

  void findOrderDetails() {
    expect(orderDetails, findsOneWidget);
  }

  void verifySubTotal(String currency, String price) {
    final subTotal = find.byKey(Key('Total sub value$currency $price'));
    expect(subTotal, findsOneWidget);
  }

  void verifyOrderTax(String currency, String price) {
    final tax = find.byKey(Key('Total Tax$currency $price'));
    expect(tax, findsOneWidget);
  }

  void verifyGrandTotal(String currency, String price) {
    final grandTotal = find.byKey(Key('Grand Total$currency $price'));
    expect(grandTotal, findsOneWidget);
  }

  void verifyOrderType(String type) {
    final orderType = find.byKey(Key('Type$type'));
    expect(orderType, findsOneWidget);
  }

  void verifyContactPerson(String contactValue) {
    final contactPerson = find.byKey(Key('Contact Person$contactValue'));
    expect(contactPerson, findsOneWidget);
  }

  void verifyContactNumber(String number) {
    final contactNumber = find.byKey(Key('Contact Number$number'));
    expect(contactNumber, findsOneWidget);
  }

  void verifyPaymentTerm(String value) {
    final paymentTerm = find.byKey(Key('Payment Term$value'));
    expect(paymentTerm, findsOneWidget);
  }

  Future<void> tapOrderDetails() async {
    await tester.tap(orderDetails);
    await tester.pumpAndSettle();
  }

  void findSoldToAddress() {
    expect(soldToAddress, findsOneWidget);
  }

  Future<void> tapSoldToAddress() async {
    await tester.tap(soldToAddress);
    await tester.pumpAndSettle();
  }

  void verifySoldToID(String soldToID) {
    final soldTo = find.byKey(Key('Sold to ID$soldToID'));
    expect(soldTo, findsOneWidget);
  }

  void verifyPostalCode(String postalCode) {
    final postal = find.byKey(Key('Postal Code$postalCode'));
    expect(postal, findsOneWidget);
  }

  void verifyCountry(String country) {
    final countryWidget = find.byKey(Key('Country$country'));
    expect(countryWidget, findsAtLeastNWidgets(1));
  }

  void verifyPhone(String phone) {
    final phoneWidget = find.byKey(Key('Phone$phone'));
    expect(phoneWidget, findsAtLeastNWidgets(1));
  }

  void findShipToAddress() {
    expect(shipToAddress, findsOneWidget);
  }

  Future<void> tapShipToAddress() async {
    await tester.tap(shipToAddress);
    await tester.pumpAndSettle();
  }

  void verifyShipToID(String shipToID) {
    final shipTo = find.byKey(Key('Ship to ID$shipToID'));
    expect(shipTo, findsOneWidget);
  }

  void findInvoices() {
    final invoices = find.text('Invoices');
    expect(invoices, findsOneWidget);
  }

  void findOrderSummary() {
    expect(orderSummary, findsOneWidget);
  }

  Future<void> tapOrderSummary() async {
    await tester.tap(orderSummary);
    await tester.pumpAndSettle();
  }

  void verifyStatus(String status) {
    final statusLabel = find.text(status);
    expect(statusLabel, findsOneWidget);
  }

  void verifyMaterialType(String materialType) {
    final type = find.byKey(Key('Type$materialType'));
    expect(type, findsOneWidget);
  }

  void verifyMaterialID(String id) {
    final materialID = find.byKey(Key('Material ID$id'));
    expect(materialID, findsOneWidget);
  }

  void verifyQuantity(String qty) {
    final quantity = find.byKey(Key('Quantity$qty'));
    expect(quantity, findsOneWidget);
  }

  void verifyZPPrice(String currency, String price) {
    final zpPrice = find.byKey(Key('ZP Price$currency $price'));
    expect(zpPrice, findsOneWidget);
  }

  void verifyTotalPrice(String currency, String price) {
    final totalPrice = find.byKey(Key('Total Price$currency $price'));
    expect(totalPrice, findsOneWidget);
  }

  void verifyOrderSummaryTax(String tax) {
    final includedTax = find.byKey(Key('Included Tax $tax'));
    expect(includedTax, findsOneWidget);
  }

  void findBackButton() {
    expect(backButton, findsOneWidget);
  }

  Future<void> tapBackButton() async {
    await tester.tap(backButton);
    await tester.pumpAndSettle();
  }
}
