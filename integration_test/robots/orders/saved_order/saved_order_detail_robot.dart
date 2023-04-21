import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class SavedOrderDetailRobot {
  final WidgetTester tester;

  SavedOrderDetailRobot(this.tester);

  final addToCart = find.byKey(const Key('onAddToCartPressed'));

  void verify() {
    final savedOrderDetail = find.byKey(const Key('savedOrderDetailPage'));
    expect(savedOrderDetail, findsOneWidget);
  }

  void verifyMaterialNumber(String number) {
    final materialNumber = find.text(': $number');
    expect(materialNumber, findsWidgets);
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
