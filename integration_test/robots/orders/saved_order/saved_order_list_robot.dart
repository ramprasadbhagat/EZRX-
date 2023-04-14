import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class SavedOrderListRobot {
  final WidgetTester tester;

  SavedOrderListRobot(this.tester);

  final savedOrder = find.byKey(const Key('SavedOrder0'));

  void verify() {
    final savedOrderList = find.byKey(const Key('SavedOrderListKey'));
    expect(savedOrderList, findsOneWidget);
  }

  void findOrder() {
    expect(savedOrder, findsOneWidget);
  }

  void verifySoldToID(String soldTo) {
    final soldToWidget = find.text('Sold To IDs: $soldTo');
    expect(soldToWidget, findsAtLeastNWidgets(1));
  }

  void verifyShipToID(String shipTo) {
    final shipToWidget = find.text('Ship To IDs: $shipTo');
    expect(shipToWidget, findsAtLeastNWidgets(1));
  }

  void verifyOrderValue(String currency, String price) {
    final orderValue = find.text('Order Value: $currency $price');
    expect(orderValue, findsAtLeastNWidgets(1));
  }

  Future<void> tapOrder() async {
    await tester.tap(savedOrder);
    await tester.pumpAndSettle();
  }
}
