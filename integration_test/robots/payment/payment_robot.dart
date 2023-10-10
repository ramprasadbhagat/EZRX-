import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentRobot {
  final WidgetTester tester;

  PaymentRobot(this.tester);

  final statementOfAccountsMenu =
      find.byKey(WidgetKeys.statementOfAccountsMenu);

  Future<void> tapStatementOfAccountTile() async {
    await tester.tap(statementOfAccountsMenu);
    await tester.pumpAndSettle();
  }
}
