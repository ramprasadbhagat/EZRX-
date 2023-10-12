import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import '../common/common_robot.dart';

class StatementAccountRobot extends CommonRobot {
  StatementAccountRobot(WidgetTester tester) : super(tester);

  void verifyPage() {
    expect(find.byKey(WidgetKeys.soaPage), findsOneWidget);
  }
}