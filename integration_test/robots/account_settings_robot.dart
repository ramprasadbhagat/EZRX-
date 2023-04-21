import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountSettingsRobot {
  final WidgetTester tester;

  AccountSettingsRobot(this.tester);

  void verify() {
    expect(find.byKey(const Key('accountPage')), findsOneWidget);
  }

  void findUserFullName(String userFullName) {
    expect(find.textContaining(userFullName), findsOneWidget);
  }

  void findUserRole(String userRole) {
    expect(find.text(userRole), findsOneWidget);
  }

  void findNoLoginOnBehalf() {
    final loginOnBehalfTile = find.byKey(const Key('loginOnBehalfTile'));
    expect(loginOnBehalfTile, findsNothing);
  }
}
