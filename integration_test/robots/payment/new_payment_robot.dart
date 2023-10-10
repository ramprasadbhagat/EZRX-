import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class NewPaymentRobot {
  final WidgetTester tester;

  NewPaymentRobot(this.tester);

  final newPaymentPage = find.byKey(WidgetKeys.newPaymentPage);

  void verifynewPaymentPage() {
    expect(newPaymentPage, findsOneWidget);
  }
}
