import 'package:flutter_test/flutter_test.dart';

import '../returns_filter_robot.dart';

class ReturnsByRequestFilterRobot extends ReturnsFilterRobot {
  ReturnsByRequestFilterRobot(WidgetTester tester) : super(tester);

  @override
  final List<String> statusFilterOptions = [
    'Pending Review',
    'Reviewed',
    'Failed',
  ];
}
