import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('end-to-end test', () {
    testWidgets('Login & logout test example', (WidgetTester tester) async {
      tester.printToConsole('Initial setup and run as UAT flavor');
      await initialSetup();
      locator<Config>().appFlavor = Flavor.uat;

      runAppWithCrashlyticsAndLocalization();

      // await tester.pumpWidget(const App());
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      // expect(find.byKey(const Key('splashLoadingIndicator')), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      //============================================================
      //  Login Test
      //
      //============================================================
      tester.printToConsole('Redirect to login page');
      final loginUsernameField = find.byKey(const Key('loginUsernameField'));
      expect(loginUsernameField, findsOneWidget);
      final loginPasswordField = find.byKey(const Key('loginPasswordField'));
      expect(loginPasswordField, findsOneWidget);
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      expect(loginSubmitButton, findsOneWidget);

      tester.printToConsole('Input username');
      await tester.tap(loginUsernameField);
      await tester.enterText(loginUsernameField, 'ezrxtest05');
      await tester.pumpAndSettle(const Duration(microseconds: 200));

      tester.printToConsole('Input password');
      await tester.tap(loginPasswordField);
      await tester.enterText(loginPasswordField, 'St@ysafe01');
      await tester.pumpAndSettle(const Duration(microseconds: 200));

      tester.printToConsole('Tap login button');
      await tester.tap(loginSubmitButton);

      await tester.pumpAndSettle(const Duration(seconds: 4));

      tester.printToConsole('Redirect to home page tabbar');
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is BottomNavigationBar &&
              widget.key == const Key('homeTabbar'),
        ),
        findsOneWidget,
      );
      //============================================================
      //  Banner Test
      //
      //============================================================
      tester.printToConsole('Home Screen with banner appear');
      final homeBanner = find.byKey(const Key('homeBanner'));
      expect(homeBanner, findsOneWidget);

      // tester.printToConsole('Swipe banner right to left');
      // await tester.drag(homeBanner, const Offset(500.0, 0.0));

      // tester.printToConsole('Tap Banner');
      // await tester.tap(homeBanner);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      //============================================================
      //  Tabbar Test
      //
      //============================================================
      tester.printToConsole('Click account tabbar');
      final accountTabbar = find.byKey(const Key('accountTabbar'));
      await tester.tap(accountTabbar);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click setting tile');
      final settingsTile = find.byKey(const Key('settingsTile'));
      await tester.tap(settingsTile);

      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('Redirect to setting page');

      //============================================================
      //  Localization Test
      //
      //============================================================

      tester.printToConsole('Click languageTile tile');
      final languageTile = find.byKey(const Key('languageTile'));
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click thaiLanguageTile tile');
      final thaiLanguageTile = find.byKey(const Key('thaiLanguageTile'));
      await tester.tap(thaiLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('ออกจากระบบ'), findsOneWidget);
      expect(find.text('ภาษา'), findsOneWidget);
      expect(find.text('การตั้งค่า'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click mandarinLanguageTile tile');
      final mandarLanguageTile = find.byKey(const Key('mandarinLanguageTile'));
      await tester.tap(mandarLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('設定'), findsOneWidget);
      expect(find.text('語言'), findsOneWidget);
      expect(find.text('登出'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click burmeseLanguageTile tile');
      final burmeseLanguageTile = find.byKey(const Key('burmeseLanguageTile'));
      await tester.tap(burmeseLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('ချိန်ညှိချက်များ'), findsOneWidget);
      expect(find.text('ဘာသာစကား'), findsOneWidget);
      expect(find.text('ထွက်ပါ'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click vietnameseLanguageTile tile');
      final vietLanguageTile = find.byKey(const Key('vietnameseLanguageTile'));
      await tester.tap(vietLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Cài đặt'), findsOneWidget);
      expect(find.text('Ngôn ngữ'), findsOneWidget);
      expect(find.text('Thoát'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click khmerLanguageTile tile');
      final khmerLanguageTile = find.byKey(const Key('khmerLanguageTile'));
      await tester.tap(khmerLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('ការកំណត់'), findsOneWidget);
      expect(find.text('ភាសា'), findsOneWidget);
      expect(find.text('ចាកចេញ'), findsOneWidget);

      tester.printToConsole('Click languageTile tile');
      await tester.tap(languageTile);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      tester.printToConsole('Click englishLanguageTile tile');
      final englishLanguageTile = find.byKey(const Key('englishLanguageTile'));
      await tester.tap(englishLanguageTile);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);

      //============================================================
      //  Logout Test
      //
      //============================================================

      tester.printToConsole('Redirect to setting page and click logout tile');
      final logoutTile = find.byKey(const Key('logoutTile'));
      await tester.tap(logoutTile);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      tester.printToConsole('Redirect back to login page');
      expect(loginUsernameField, findsOneWidget);
      expect(loginPasswordField, findsOneWidget);
      expect(loginSubmitButton, findsOneWidget);
    });
  });
}
