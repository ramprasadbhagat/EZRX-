import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  testWidgets('Login in test example', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    // await tester.pumpAndSettle(const Duration(seconds: 3));
    // expect(find.byKey(const Key('splashLoadingIndicator')), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));
    final loginUsernameField = find.byKey(const Key('loginUsernameField'));
    final loginPasswordField = find.byKey(const Key('loginPasswordField'));
    final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));

    // input username and password then click login button
    await tester.tap(loginUsernameField);
    await tester.enterText(loginUsernameField, 'superuser');
    await tester.tap(loginPasswordField);
    await tester.enterText(loginPasswordField, '_Admin1234');
    await tester.tap(loginSubmitButton);

    await tester.pumpAndSettle(const Duration(seconds: 7));
    // should redirect to home page tabbar
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is BottomNavigationBar &&
            widget.key == const Key('homeTabbar'),
      ),
      findsOneWidget,
    );

    await tester.pumpAndSettle(const Duration(milliseconds: 3));

    // click account tab
    final accountTabbar = find.byKey(const Key('accountTabbar'));
    await tester.tap(accountTabbar);

    await tester.pumpAndSettle(const Duration(milliseconds: 3));

    // click logout tile
    final logoutTile = find.byKey(const Key('logoutTile'));
    await tester.tap(logoutTile);

    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
