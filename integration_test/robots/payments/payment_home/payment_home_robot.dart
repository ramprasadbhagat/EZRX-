import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentHomeRobot {
  final WidgetTester tester;

  PaymentHomeRobot(this.tester);

  final paymentSummaryMenu = find.byKey(WidgetKeys.paymentSummaryMenu);

  Future<void> tapPaymentSummaryMenu() async {
    await tester.tap(paymentSummaryMenu);
    await tester.pumpAndSettle();
  }
}
