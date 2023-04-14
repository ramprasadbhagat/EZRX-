import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountSettingsRobot {
  final WidgetTester tester;

  AccountSettingsRobot(this.tester);

  void findNoLoginOnBehalf() {
    final loginOnBehalfTile = find.byKey(const Key('loginOnBehalfTile'));
    expect(loginOnBehalfTile, findsNothing);
  }
}
