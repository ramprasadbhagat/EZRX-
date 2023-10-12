import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import '../common/common_robot.dart';

class PaymentsSummaryRobot extends CommonRobot {
  PaymentsSummaryRobot(WidgetTester tester) : super(tester);

  void verifyPage() {
    expect(find.byKey(WidgetKeys.paymentSummaryPage), findsOneWidget);
  }
}
