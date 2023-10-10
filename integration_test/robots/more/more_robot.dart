import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class MoreRobot {
  final WidgetTester tester;

  MoreRobot(this.tester);

  final returnsTile = find.byKey(WidgetKeys.returnsTile);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final paymentTile = find.byKey(WidgetKeys.paymentsTile);

  Future<void> tapReturnsTile() async {
    await tester.tap(returnsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapNewRequestFloatingButton() async {
    await tester.tap(newRequestFloatingButton);
  }

  Future<void> tapPaymentTile() async {
    await tester.tap(paymentTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapPaymentTile() async {
    await tester.tap(paymentTile);
    await tester.pumpAndSettle();
  }
}
