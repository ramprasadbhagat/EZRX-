import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class NewPaymentRobot {
  final WidgetTester _tester;
  NewPaymentRobot(this._tester);

  //Robot Functions
  void verify() {
    expect(find.byKey(WidgetKeys.newPaymentPage), findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await _tester.tap(find.byKey(WidgetKeys.closeButton));
    await _tester.pumpAndSettle();
  }
}
