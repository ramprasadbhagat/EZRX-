import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CartRobot {
  final WidgetTester tester;

  CartRobot(this.tester);

  final orderSummary = find.byKey(const ValueKey('orderSummaryButton'));

  void verify() {
    final cartPage = find.byKey(const Key('cartpage'));
    expect(cartPage, findsOneWidget);
  }

  void findMaterialItem(String materialNumber, int quantity) {
    final material = find.byKey(ValueKey('$materialNumber$quantity'));
    expect(material, findsOneWidget);
  }

  void findAddQuantity(String materialNumber) {
    final cartAddButton = find.byKey(Key('cartAdd$materialNumber'));
    expect(cartAddButton, findsOneWidget);
  }

  void findOrderSummary() {
    expect(orderSummary, findsOneWidget);
  }

  Future<void> tapAddQuantity(String materialNumber) async {
    final cartAddButton = find.byKey(Key('cartAdd$materialNumber'));
    await tester.tap(cartAddButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapOrderSummary() async {
    await tester.pumpAndSettle();
    await tester.ensureVisible(orderSummary);
    await tester.tap(orderSummary);
    await tester.pumpAndSettle();
  }

  void verifyTotal(String currencyCode, String price) {
    final totals = find.textContaining('$currencyCode $price');
    expect(totals, findsNWidgets(2));
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
