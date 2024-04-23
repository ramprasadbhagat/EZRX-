import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ComboDetailRobot extends CommonRobot {
  ComboDetailRobot(WidgetTester tester) : super(tester);

  void verifyPage() {
    final comboDetail = find.byKey(WidgetKeys.comboDealDetailPage);
    expect(comboDetail, findsOneWidget);
  }

}
