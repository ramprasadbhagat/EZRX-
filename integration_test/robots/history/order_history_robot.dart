import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderHistoryRobot {
  final WidgetTester tester;

  OrderHistoryRobot(this.tester);

  final orderedItem = find.byKey(const ValueKey('historyTitle0'));

  void verify() {
    final orderHistory = find.byKey(const Key('orderHistoryTab'));
    expect(orderHistory, findsOneWidget);
  }

  void findOrderedItem() {
    expect(orderedItem, findsOneWidget);
  }

  void verifyOrderType(String orderType) {
    final orderTypeWidget = find.byKey(Key('Order Type$orderType'));
    expect(orderTypeWidget, findsAtLeastNWidgets(1));
  }

  void verifyQuantity(String quantity) {
    final quantityWidget = find.byKey(Key('Quantity$quantity'));
    expect(quantityWidget, findsAtLeastNWidgets(1));
  }

  void verifyMaterialID(String materialID) {
    final material = find.byKey(Key('Material ID$materialID'));
    expect(material, findsAtLeastNWidgets(1));
  }

  void verifyMaterialName(String materialName) {
    final material = find.textContaining(materialName);
    expect(material, findsAtLeastNWidgets(1));
  }

  void verifyZPPrice(String currency, String price) {
    final zpPrice = find.byKey(Key('ZP Price$currency $price'));
    expect(zpPrice, findsAtLeastNWidgets(1));
  }

  void verifyTotalPrice(String currency, String price) {
    final totalPrice = find.byKey(Key('Total Price$currency $price'));
    expect(totalPrice, findsAtLeastNWidgets(1));
  }

  void verifyTax(String tax) {
    final taxWidget = find.byKey(Key('Included Tax$tax'));
    expect(taxWidget, findsAtLeastNWidgets(1));
  }

  Future<void> tapOrderedItem() async {
    await tester.tap(orderedItem);
    await tester.pumpAndSettle();
  }
}
