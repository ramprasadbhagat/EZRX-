import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class NewPaymentRobot {
  final WidgetTester tester;

  NewPaymentRobot(this.tester);

  void verifyPage() {
    expect(find.byKey(WidgetKeys.newPaymentPage), findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }
}
