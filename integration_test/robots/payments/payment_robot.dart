import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentRobot {
  final WidgetTester _tester;

  PaymentRobot(this._tester);

  //Robot Functions
  void verify() {
    expect(find.byKey(WidgetKeys.paymentHomeOptionMenu), findsOneWidget);
  }

  Future<void> tapAccountSummaryMenu() async {
    await _tester.tap(find.byKey(WidgetKeys.accountSummaryMenu));
    await _tester.pumpAndSettle();
  }
}
