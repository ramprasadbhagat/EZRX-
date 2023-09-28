import 'package:flutter_test/flutter_test.dart';

import '../returns_filter_robot.dart';

class ReturnsByItemsFilterRobot extends ReturnsFilterRobot {
  ReturnsByItemsFilterRobot(WidgetTester tester) : super(tester);

  @override
  final List<String> statusFilterOptions = [
    'Pending Approval',
    'Approved',
    'Rejected',
  ];
}
