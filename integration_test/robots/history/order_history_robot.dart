import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderHistoryRobot {
  final WidgetTester tester;

  OrderHistoryRobot(this.tester);

  final orderedItem = find.byKey(const ValueKey('historyTitle0'));
  final filterOrderHistory = find.byKey(const Key('filterOrderHistory'));

  void verify() {
    final orderHistory = find.byKey(const Key('orderHistoryTab'));
    expect(orderHistory, findsOneWidget);
  }

  void findOrderHistoryFilter() {
    expect(filterOrderHistory, findsOneWidget);
  }

  Future<void> findOrderHistoryFilterByMaterialNumber(
      String materialNumber) async {
    await tester.tap(filterOrderHistory);
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const Key('filterMaterialSearchField')), materialNumber);
    await tester.pumpAndSettle();
  }

  Future<void> tapOrderHistoryFilterApplyButton() async {
    await tester.tap(find.byKey(const Key('filterApplyButton')));
    await tester.pumpAndSettle();
  }

  Future<void> getKeyboardDown() async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  void findOrderedItem() {
    expect(orderedItem, findsOneWidget);
  }

  void findOrderItemByMaterialNumber(String materialNumber) {
    expect(find.byKey(Key('materialId$materialNumber')), findsWidgets);
  }

  void verifyOrderType(String orderType) {
    final orderTypeWidget = find.byKey(Key('Order Type$orderType'));
    expect(orderTypeWidget, findsAtLeastNWidgets(1));
  }

  void verifyOrderProcessingStatus([enabled = true]) {
    final processingStatus = find.byKey(const Key('processingStatus'));
    if (enabled) {
      expect(processingStatus, findsAtLeastNWidgets(1));
    } else {
      expect(processingStatus, findsNothing);
    }
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

  Future<void> tapOrderedItem() async {
    await tester.tap(orderedItem);
    await tester.pumpAndSettle();
  }
}
