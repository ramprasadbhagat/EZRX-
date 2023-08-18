import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginRobot {
  final WidgetTester tester;

  LoginRobot(this.tester);

  final announcementCloseIcon = find.byKey(const Key('announcementCloseIcon'));
  final rememberMeCheckbox =
      find.byKey(const Key('loginRememberPasswordCheckbox'));
  final forgotPasswordLink = find.text('Forgot password?'.tr());
  final backToLoginButton = find.text('Back To login'.tr());
  final nextButton = find.text('Next'.tr());
  final forgotUsernameField = find.byKey(const Key('forgotUsernameField'));
  final marketSelector = find.byKey(const Key('appMarketSelector'));
  final loginUsernameField = find.byKey(const Key('loginUsernameField'));
  final loginPasswordField = find.byKey(const Key('loginPasswordField'));
  final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
  final getStartedButton = find.byKey(const Key('getStarted'));
  final signUp = find.text('Sign up'.tr());
  final loginWithSSO = find.text('Sign up'.tr());

  Future<void> login(String username, String password) async {
    expect(loginUsernameField, findsOneWidget);
    expect(loginPasswordField, findsOneWidget);
    expect(loginSubmitButton, findsOneWidget);

    await tester.enterText(loginUsernameField, username);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(const Duration(seconds: 1));

    await tester.enterText(loginPasswordField, password);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(const Duration(seconds: 1));

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

  void findBackToLoginButton() {
    expect(backToLoginButton, findsOneWidget);
  }

  Future<void> tapToBackToLogin() async {
    await tester.tap(backToLoginButton);
    await tester.pumpAndSettle();
  }

  void findNextButton() {
    expect(nextButton, findsOneWidget);
  }

  Future<void> tapToNextButton() async {
    await tester.tap(nextButton);
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
    //TODO : In maximum attempt we are facing loading banner on homtap,
    //Fow now it's better not to wait for api data/loader, used pump()
    //we can convert to pumpAndSettle once we get proper response on time in future.
    await tester.pump(const Duration(seconds: 2));
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

  void verifyErrorMessageWithoutUserName() {
    final userNameCannotEmpty = find.text('Username cannot be empty.');
    expect(userNameCannotEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithoutPassword() {
    final userNameCannotEmpty = find.text('Password cannot be empty.');
    expect(userNameCannotEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithIncorrectUsernameAndPassword() {
    final incorrectUsernameOrPassword =
        find.text('Invalid username or password').last;
    expect(incorrectUsernameOrPassword, findsOneWidget);
  }

  void findForgotUsernameField() {
    expect(forgotUsernameField, findsOneWidget);
  }

  Future<void> enterTextToUsernameField(String username) async {
    await tester.tap(forgotUsernameField);
    await tester.enterText(forgotUsernameField, username);
    await tester.pump();
  }

  void verifyErrorMessageWithoutUsername() {
    final usernameCannotBeEmpty = find.text('Username cannot be empty.'.tr());
    expect(usernameCannotBeEmpty, findsOneWidget);
  }

  void verifyErrorMessageWithInvalidUsername() {
    final incorrectUsername = find.text('Invalid username or password').last;
    expect(incorrectUsername, findsOneWidget);
  }

  void verifyMessageSentEmail() {
    final emailSendToYou = find.text('Email sent to you!');
    expect(emailSendToYou, findsOneWidget);
  }

  void findSignUpLink() {
    expect(signUp, findsOneWidget);
  }

  void findLoginWithSSOButton() {
    expect(loginWithSSO, findsOneWidget);
  }
}
