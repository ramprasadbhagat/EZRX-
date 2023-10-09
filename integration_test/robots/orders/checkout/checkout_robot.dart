import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class CheckoutRobot {
  final WidgetTester tester;

  CheckoutRobot(this.tester);

  final page = find.byKey(WidgetKeys.checkoutPage);

  void verifyPage() {
    expect(page, findsOneWidget);
  }
}
