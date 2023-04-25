import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderConfirmationRobot {
  final WidgetTester tester;

  OrderConfirmationRobot(this.tester);

  final orderHistory = find.byKey(const Key('goToOrderHistory'));

  void verify() {
    final orderConfirmationScreen = find.byKey(const Key('orderSuccessKey'));
    expect(orderConfirmationScreen, findsOneWidget);
  }

  void findTitle() {
    final thankyou = find.text('Thank You');
    expect(thankyou, findsOneWidget);
  }

  void findDescription() {
    final description = find.text('Your order has been received successfully');
    expect(description, findsOneWidget);
  }

  void findCreateNewOrderButton() {
    final createNewOrder = find.byKey(const Key('createNewOrder'));
    expect(createNewOrder, findsOneWidget);
  }

  void findGoToOrderHistoryButton() {
    expect(orderHistory, findsOneWidget);
  }

  Future<void> tapGoToOrderHistoryButton() async {
    await tester.tap(orderHistory);
    await tester.pumpAndSettle();
  }
  
  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
