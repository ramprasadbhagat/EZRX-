import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class SavedOrderListRobot {
  final WidgetTester tester;

  SavedOrderListRobot(this.tester);

  final deleteIcon = find.byKey(const Key('deleteFromList'));
  final savedOrder = find.byKey(const Key('SavedOrder0'));
  final confirmButton = find.byKey(const Key('Yes'));

  void verify() {
    final savedOrderList = find.byKey(const Key('SavedOrderListKey'));
    expect(savedOrderList, findsOneWidget);
  }

  void findOrder() {
    expect(savedOrder, findsOneWidget);
  }

  void findSavedOrderItemDelete() {
    expect(deleteIcon, findsWidgets);
  }

  Future<void> tapSavedOrderItemDelete() async {
    if(deleteIcon.evaluate().length>1){
      await tester.tap(deleteIcon.first);
    }else{
      await tester.tap(deleteIcon);
    }
    await tester.pumpAndSettle();
  }

  void verifyConfirmationDialog() {
    final dialog = find.byKey(const Key('confirmDialog'));
    expect(dialog, findsOneWidget);
  }

  void findConfirmButton() {
    expect(confirmButton, findsOneWidget);
  }

  Future<void> tapConfirmButton() async {
    await tester.tap(confirmButton);
    await tester.pumpAndSettle();
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

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
