import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentHomeRobot {
  final WidgetTester tester;

  PaymentHomeRobot(this.tester);

  final accountSummaryIcon = find.byKey(WidgetKeys.accountSummaryMenu);

  Future<void> tapAccountSummaryIcon() async {
    await tester.tap(accountSummaryIcon);
    await tester.pumpAndSettle();
  }
}
