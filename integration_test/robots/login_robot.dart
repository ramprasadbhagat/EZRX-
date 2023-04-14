import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginRobot {
  final WidgetTester tester;

  LoginRobot(this.tester);

  Future<void> login(String username, String password) async {
    final loginUsernameField = find.byKey(const Key('loginUsernameField'));
    expect(loginUsernameField, findsOneWidget);
    final loginPasswordField = find.byKey(const Key('loginPasswordField'));
    expect(loginPasswordField, findsOneWidget);
    final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
    expect(loginSubmitButton, findsOneWidget);

    await tester.enterText(loginUsernameField, username);
    await tester.pump();

    await tester.enterText(loginPasswordField, password);
    await tester.pump();

    await tester.ensureVisible(loginSubmitButton);
    await tester.tap(loginSubmitButton);
    await tester.pumpAndSettle();
  }
}
