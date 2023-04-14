import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderTemplateDetailRobot {
  final WidgetTester tester;

  OrderTemplateDetailRobot(this.tester);

  final addToCart = find.byKey(const Key('onAddToCartPressed'));

  void verify() {
    final orderTemplateDetail =
        find.byKey(const Key('OrderTemplateDetailPage'));
    expect(orderTemplateDetail, findsOneWidget);
  }

  void verifyMaterialNumber(String number) {
    final materialNumber = find.text(': $number');
    expect(materialNumber, findsOneWidget);
  }

  void verifyMaterialQuantity(String qty) {
    final quantity = find.byKey(Key('Material Qty$qty'));
    expect(quantity, findsOneWidget);
  }

  void verifyUnitPrice(String price) {
    final unitPrice = find.textContaining(price);
    expect(unitPrice, findsOneWidget);
  }

  void findAddToCart() {
    expect(addToCart, findsOneWidget);
  }

  Future<void> tapAddToCart() async {
    await tester.tap(addToCart);
    await tester.pumpAndSettle();
  }
}
