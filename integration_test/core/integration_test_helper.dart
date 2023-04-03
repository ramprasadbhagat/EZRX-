import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/core/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_io/io.dart';

class IntergrationTestHelper {
  late WidgetTester _tester;
  IntergrationTestHelper({required WidgetTester tester}) {
    _tester = tester;
  }

  Future<void> loginTest(
      {required String username, required String password}) async {
    final loginUsernameField = find.byKey(const Key('loginUsernameField'));
    expect(loginUsernameField, findsOneWidget);
    final loginPasswordField = find.byKey(const Key('loginPasswordField'));
    expect(loginPasswordField, findsOneWidget);
    final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
    expect(loginSubmitButton, findsOneWidget);

    await _tester.tap(loginUsernameField);
    await _tester.enterText(loginUsernameField, username);
    await _tester.pump(const Duration(microseconds: 200));

    await _tester.tap(loginPasswordField);
    await _tester.enterText(loginPasswordField, password);

    await _tester.pump(const Duration(seconds: 1));

    await _tester.pump(const Duration(seconds: 1));
    await _tester.testTextInput.receiveAction(TextInputAction.done);
    await _tester.pump(const Duration(seconds: 10));

    expect(find.byKey(const Key('homeTab')), findsOneWidget);
    expect(find.byKey(const Key('homeSalesOrgSelector')), findsOneWidget);
    expect(find.byKey(const Key('homeCustomerCodeSelector')), findsOneWidget);
    expect(find.byKey(const Key('homeShipCodeSelector')), findsOneWidget);
  }

  Future<void> selectSalesOrgTest({required String salesOrg}) async {
    //select sales org
    final salesOrgSelect = find.byKey(const Key('salesOrgSelect'));
    expect(salesOrgSelect, findsWidgets);
    final salesOrgSelectOne =
        find.descendant(of: salesOrgSelect, matching: salesOrgSelect);
    await _tester.tap(salesOrgSelectOne);
    await _tester.pump(const Duration(seconds: 2));
    final salesOrgOption = find.byKey(Key('salesOrgOption$salesOrg'));
    expect(salesOrgOption, findsOneWidget);
    await _tester.tap(salesOrgOption);
    await _tester.pump(const Duration(seconds: 5));
  }

  Future<void> selectCustomerCode({required String customerCode,}) async {
    final customerCodeSelect = find.byKey(const Key('customerCodeSelect'));
    expect(customerCodeSelect, findsWidgets);
    final customerCodeSelectOne =
        find.descendant(of: customerCodeSelect, matching: customerCodeSelect);
    final customerSearchPage = find.byKey(const Key('customerSearchPage'));
    final customerCodeSearchField =
          find.byKey(const Key('customerCodeSearchField'));
    expect(customerCodeSelectOne, findsOneWidget);
    await _tester.tap(customerCodeSelectOne);
    await _tester.pump(const Duration(seconds: 2));
    expect(customerSearchPage, findsOneWidget);
    expect(customerCodeSearchField, findsOneWidget);
    await _tester.enterText(customerCodeSearchField, customerCode);
    await _tester.pump(const Duration(seconds: 1));
    await _tester.testTextInput.receiveAction(TextInputAction.done);
    await _tester.pump(const Duration(seconds: 12));
    final customerCodeOptionNew =
        find.byKey(Key('customerCodeOption$customerCode'));
    expect(customerCodeOptionNew, findsOneWidget);
    await _tester.tap(customerCodeOptionNew);
    await _tester.pump(const Duration(seconds: 2));

    final customerCodeDialogChange =
        find.byKey(const Key('customerCodeDialogChange'));
    if(customerCodeDialogChange.evaluate().isNotEmpty){
      expect(customerCodeDialogChange, findsWidgets);
      final customerCodeChange = find.byKey(const Key('Change'));
      expect(customerCodeChange, findsWidgets);
      await _tester.tap(customerCodeChange);
      await _tester.pump(const Duration(seconds: 2));
    }
  }

  Future<void> accountTabCheck() async {
    final accountTabbar = find.byKey(const Key('accountTabbar'));
    expect(accountTabbar, findsOneWidget);
    await _tester.tap(accountTabbar);
    await _tester.pump(const Duration(seconds: 2));

    final settingsTile = find.byKey(const Key('settingsTile'));
    expect(settingsTile, findsOneWidget);
    await _tester.tap(settingsTile);
    await _tester.pump(const Duration(seconds: 2));

    //testing all tiles in setting page
    final notificationTile = find.byKey(const Key('notificationTile'));
    await _tester.tap(notificationTile);
    await _tester.pump(const Duration(seconds: 1));

    final languagePicker =
        find.byKey(const Key('gestureDetectorForLanguagePicker'));
    await _tester.tap(languagePicker);
    await _tester.pump(const Duration(seconds: 1));

    final thaiLanguageTile = find.byKey(const Key('thaiLanguageTile'));
    await _tester.tap(thaiLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Set Up Email Notifications'), findsOneWidget);

    await _tester.tap(languagePicker);
    await _tester.pump(const Duration(seconds: 1));

    final mandarLanguageTile = find.byKey(const Key('mandarinLanguageTile'));
    await _tester.tap(mandarLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Set Up Email Notifications'), findsOneWidget);

    await _tester.tap(languagePicker);
    await _tester.pump(const Duration(seconds: 1));

    final burmeseLanguageTile = find.byKey(const Key('burmeseLanguageTile'));
    await _tester.tap(burmeseLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Set Up Email Notifications'), findsOneWidget);

    await _tester.tap(languagePicker);
    await _tester.pump(const Duration(seconds: 1));

    final vietLanguageTile = find.byKey(const Key('vietnameseLanguageTile'));
    await _tester.tap(vietLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Set Up Email Notifications'), findsOneWidget);

    await _tester.tap(languagePicker);
    await _tester.pump(const Duration(seconds: 1));

    final khmerLanguageTile = find.byKey(const Key('khmerLanguageTile'));
    await _tester.tap(khmerLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Set Up Email Notifications'), findsOneWidget);

    await _tester.tap(languagePicker);
    await _tester.pump(const Duration(seconds: 1));

    final englishLanguageTile = find.byKey(const Key('englishLanguageTile'));
    await _tester.tap(englishLanguageTile);
    await _tester.pump(const Duration(seconds: 1));

    final flutterSwitch = find.byKey(const Key('flutterSwitch'));
    await _tester.tap(flutterSwitch);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(flutterSwitch);
    await _tester.pump(const Duration(seconds: 1));

    final backButton = find.byTooltip('Back');
    await _tester.tap(backButton);
    await _tester.pump(const Duration(milliseconds: 300));

    //============================================================
    //  Localization Test
    //
    //============================================================

    final languageTile = find.byKey(const Key('languageTile'));
    await _tester.tap(languageTile);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(thaiLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('ออกจากระบบ'), findsOneWidget);
    expect(find.text('ภาษา'), findsOneWidget);
    expect(find.text('การตั้งค่า'), findsOneWidget);

    await _tester.tap(languageTile);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(mandarLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('設定'), findsOneWidget);
    expect(find.text('語言'), findsOneWidget);
    expect(find.text('登出'), findsOneWidget);

    await _tester.tap(languageTile);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(burmeseLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('ချိန်ညှိချက်များ'), findsOneWidget);
    expect(find.text('ဘာသာစကား'), findsOneWidget);
    expect(find.text('ထွက်ပါ'), findsOneWidget);

    await _tester.tap(languageTile);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(vietLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Cài đặt'), findsOneWidget);
    expect(find.text('Ngôn ngữ'), findsOneWidget);
    expect(find.text('Thoát'), findsOneWidget);

    await _tester.tap(languageTile);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(khmerLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('ការកំណត់'), findsOneWidget);
    expect(find.text('ភាសា'), findsOneWidget);
    expect(find.text('ចាកចេញ'), findsOneWidget);

    await _tester.tap(languageTile);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(englishLanguageTile);
    await _tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);

    //============================================================
    //  change password Test
    //
    //============================================================
    final changePasswordTile = find.byKey(const Key('changePasswordTile'));
    await _tester.tap(changePasswordTile);
    await _tester.pump(const Duration(milliseconds: 100));

    final oldPasswordField = find.byKey(const Key('oldPasswordTextField'));
    expect(oldPasswordField, findsOneWidget);
    final newPasswordField = find.byKey(const Key('newPasswordTextField'));
    expect(newPasswordField, findsOneWidget);
    final confrimPasswordField =
        find.byKey(const Key('confirmPasswordTextField'));
    expect(confrimPasswordField, findsOneWidget);

    await _tester.tap(oldPasswordField);
    await _tester.enterText(oldPasswordField, 'Stays@fe2022!');
    await _tester.pump(const Duration(milliseconds: 100));

    await _tester.tap(newPasswordField);
    await _tester.enterText(newPasswordField, 'Stays@fe2022');
    await _tester.pump(const Duration(milliseconds: 100));

    await _tester.tap(confrimPasswordField);
    await _tester.enterText(confrimPasswordField, 'Stays@fe2022');
    await _tester.pump(const Duration(milliseconds: 200));

    await _tester.testTextInput.receiveAction(TextInputAction.done);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(backButton);
    await _tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Settings'), findsOneWidget);

    //============================================================
    //  contact us Test
    //
    //============================================================

    final contactUsTile = find.byKey(const Key('contactUsTile'));
    await _tester.tap(contactUsTile);
    await _tester.pump(const Duration(seconds: 3));

    await _tester.tap(backButton);
    await _tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Settings'), findsOneWidget);

    //============================================================
    //  Accept Use Policy Test
    //
    //============================================================
    final tostile = find.byKey(const Key('tostile'));
    expect(tostile, findsOneWidget);
    await _tester.pump(const Duration(milliseconds: 200));
    await _tester.tap(tostile);
    await _tester.pump(const Duration(seconds: 1));
    final auptcappBar = find.byKey(const Key('auptcappBar'));
    expect(auptcappBar, findsOneWidget);

    await _tester.pump(const Duration(seconds: 8));
    if (Platform.isAndroid) {
      await _tester.dragFrom(const Offset(100, 100), const Offset(100, -1000));
      await _tester.pump(const Duration(seconds: 3));
      await _tester.dragFrom(const Offset(100, 100), const Offset(100, -1000));
    } else if (Platform.isIOS) {
      final innerElement = _tester.element((find.byType(AupTCDialog)));
      final typeCast = innerElement as StatefulElement;
      final innerElementState = typeCast.state as AupTCDialogState;
      await innerElementState.controller
          .evaluateJavascript(source: "window.scroll(50,600,'smooth');");
      await _tester.pump(const Duration(seconds: 5));
      await innerElementState.controller
          .evaluateJavascript(source: "window.scroll(600,1400,'smooth');");
      await _tester.pump(const Duration(seconds: 5));
      await innerElementState.controller.evaluateJavascript(
          source: "window.scroll(1400, document.body.scrollHeight,  'smooth')");
      await _tester.pump(const Duration(seconds: 10));
    }

    await _tester.pump(const Duration(seconds: 3));
    await _tester.tap(backButton);

    await _tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Settings'), findsOneWidget);

    //============================================================
    //  privacy policy Test
    //
    //============================================================
    final privacyPolicyTile = find.byKey(const Key('Privacy_Policy'));
    expect(privacyPolicyTile, findsOneWidget);
    await _tester.pump(const Duration(milliseconds: 100));
    await _tester.tap(privacyPolicyTile);

    await _tester.pumpAndSettle(const Duration(seconds: 8));
    if (Platform.isAndroid) {
      await _tester.dragFrom(const Offset(100, 100), const Offset(100, -1000));
      await _tester.pumpAndSettle(const Duration(seconds: 3));
      await _tester.dragFrom(const Offset(100, 100), const Offset(100, -1000));
    } else if (Platform.isIOS) {
      final innerElement = _tester.element((find.byType(WebViewPage)));
      final typeCast = innerElement as StatefulElement;
      final innerElementState = typeCast.state as WebViewPageState;
      await innerElementState.controller
          .evaluateJavascript(source: "window.scroll(50,600,'smooth');");
      await _tester.pumpAndSettle(const Duration(seconds: 5));
      await innerElementState.controller
          .evaluateJavascript(source: "window.scroll(600,1400,'smooth');");
      await _tester.pumpAndSettle(const Duration(seconds: 5));
      await innerElementState.controller.evaluateJavascript(
          source: "window.scroll(1400, document.body.scrollHeight,  'smooth')");
      await _tester.pumpAndSettle(const Duration(seconds: 10));
    }

    await _tester.tap(backButton);
    await _tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Settings'), findsOneWidget);
  }

  Future<void> logoutTest() async {
    final logoutTile = find.byKey(const Key('logoutTile'));
    expect(logoutTile, findsOneWidget);
    await _tester.tap(logoutTile);
    await _tester.pump(const Duration(seconds: 2));

    final loginUsernameField = find.byKey(const Key('loginUsernameField'));
    expect(loginUsernameField, findsOneWidget);
    final loginPasswordField = find.byKey(const Key('loginPasswordField'));
    expect(loginPasswordField, findsOneWidget);
    final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
    expect(loginSubmitButton, findsOneWidget);
    await _tester.pump(const Duration(seconds: 2));
  }
}
