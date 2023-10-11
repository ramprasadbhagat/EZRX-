import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentRobot {
  final WidgetTester tester;

  PaymentRobot(this.tester);

  final statementOfAccountsMenu =
      find.byKey(WidgetKeys.statementOfAccountsMenu);
  final newPaymentButton = find.byKey(WidgetKeys.newPaymentButton);

  Future<void> tapStatementOfAccountTile() async {
    await tester.tap(statementOfAccountsMenu);
    await tester.pumpAndSettle();
  }

  Future<void> tapNewPayment() async {
    await tester.tap(newPaymentButton);
    await tester.pumpAndSettle();
  }
}
