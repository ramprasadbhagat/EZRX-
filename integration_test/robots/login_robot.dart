import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
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

  Future<void> findAndCloseAnnouncementIcon() async {
    if (announcementCloseIcon.evaluate().isNotEmpty) {
      await tester.tap(announcementCloseIcon.first);
      await tester.pumpAndSettle();
    }
  }

  void findRememberMeCheckbox() {
    expect(rememberMeCheckbox, findsOneWidget);
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

  Future<void> tapToMarketSelector() async{
    await tester.tap(marketSelector);
    await tester.pumpAndSettle();
  }

  Future<void> selectMarket(String market) async {
    final dropdownItemToSelect = find.text(market).last;
    await tester.tap(dropdownItemToSelect);
    await tester.pumpAndSettle();
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
}
