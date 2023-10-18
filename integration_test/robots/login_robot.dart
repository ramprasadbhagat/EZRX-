import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginRobot {
  final WidgetTester tester;

  LoginRobot(this.tester);

  final announcementCloseIcon = find.byKey(const Key('announcementCloseIcon'));
  final rememberMeCheckbox =
      find.byKey(WidgetKeys.loginRememberPasswordCheckbox);
  final forgotPasswordLink = find.byKey(WidgetKeys.forgotPasswordButton);
  final marketSelector = find.byKey(WidgetKeys.appMarketSelector);
  final loginUsernameField = find.byKey(WidgetKeys.loginUsernameField);
  final loginPasswordField = find.byKey(WidgetKeys.loginPasswordField);
  final loginSubmitButton = find.byKey(WidgetKeys.loginSubmitButton);
  final getStartedButton = find.byKey(WidgetKeys.introGetStartedButton);
  final signUp = find.byKey(WidgetKeys.createAccountButton);
  final loginWithSSO = find.byKey(WidgetKeys.ssoLoginButton);

  Future<void> loginToHomeScreen(
    String username,
    String password,
    String market,
  ) async {
    //select market
    findMarketSelector();
    await tapToMarketSelector();
    await selectMarket(market);
    verifySelectedMarket(market);

    //login
    await login(username, password);
    if (getStartedButton.evaluate().isNotEmpty) await tapGetStartedButton();
  }

  Future<void> login(String username, String password) async {
    expect(loginUsernameField, findsOneWidget);
    expect(loginPasswordField, findsOneWidget);
    expect(loginSubmitButton, findsOneWidget);

    await tester.enterText(loginUsernameField, username);
    await tester.enterText(loginPasswordField, password);

    expect(loginSubmitButton, findsOneWidget);
    await tester.tap(loginSubmitButton);
    await tester.pumpAndSettle();
  }

  Future<void> findAndCloseAnnouncementIcon() async {
    if (announcementCloseIcon.evaluate().isNotEmpty) {
      await tester.tap(announcementCloseIcon.first);
      await tester.pumpAndSettle();
    }
  }

  void findUsernameField() {
    expect(loginUsernameField, findsOneWidget);
  }

  void findPasswordField() {
    expect(loginPasswordField, findsOneWidget);
  }

  void findSubmitButton() {
    expect(loginSubmitButton, findsOneWidget);
  }

  void findRememberMeCheckbox() {
    expect(rememberMeCheckbox, findsOneWidget);
  }

  void verifyRememberMeCheckboxUnchecked() {
    final checkbox = tester.firstWidget<Checkbox>(rememberMeCheckbox);
    expect(checkbox.value, false);
  }

  Future<void> tapToRememberMe() async {
    await tester.tap(rememberMeCheckbox);
    await tester.pumpAndSettle();
  }

  void findForgotPasswordLink() {
    expect(forgotPasswordLink, findsOneWidget);
  }

  Future<void> tapToForgotPassword() async {
    await tester.tap(forgotPasswordLink);
    await tester.pumpAndSettle();
  }

  void findMarketSelector() {
    expect(marketSelector, findsOneWidget);
  }

  void findGetStartedButton() {
    expect(getStartedButton, findsOneWidget);
  }

  Future<void> tapGetStartedButton() async {
    await tester.tap(getStartedButton);
    await tester.pumpAndSettle();
  }

  void verifyDefaultValueSelector(String marketValue) {
    final dropdownItemValue = find.text(marketValue).last;
    expect(dropdownItemValue, findsOneWidget);
  }

  void verifyDefaultUsernameField() {
    final inputUsername = tester.widget<TextFormField>(loginUsernameField);
    expect(inputUsername.initialValue, isEmpty);
  }

  void verifyDefaultPasswordField() {
    final inputPassword = tester.widget<TextFormField>(loginPasswordField);
    expect(inputPassword.initialValue, isEmpty);
  }

  Future<void> tapToMarketSelector() async {
    await tester.tap(marketSelector);
    await tester.pumpAndSettle();
  }

  Future<void> selectMarket(String market) async {
    final dropdownItemToSelect = find.text(market).last;
    await tester.tap(dropdownItemToSelect);
    await tester.pumpAndSettle();
  }

  void verifySelectedMarket(String market) {
    expect(find.text(market).last, findsOneWidget);
  }

  void verifyErrorMessageWithoutPassword() {
    final userNameCannotEmpty = find.text('Password cannot be empty.'.tr());
    expect(userNameCannotEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithoutUsername() {
    final usernameCannotBeEmpty = find.text('Username cannot be empty.'.tr());
    expect(usernameCannotBeEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithInvalidUsernameOrPassword() {
    final incorrectUsername = find.text('Invalid username or password'.tr());
    expect(incorrectUsername, findsOneWidget);
  }

  void findSignUpLink() {
    expect(signUp, findsOneWidget);
  }

  void findLoginWithSSOButton() {
    expect(loginWithSSO, findsOneWidget);
  }
}
