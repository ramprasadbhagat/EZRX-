import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ContactUsRobot extends CommonRobot {
  ContactUsRobot(WidgetTester tester) : super(tester);

  final scrollView = find.byKey(WidgetKeys.userNameKey);
  final userNameKey = find.byKey(WidgetKeys.userNameKey);
  final phoneNumberKey = find.byKey(WidgetKeys.phoneNumberKey);
  final emailKey = find.byKey(WidgetKeys.emailKey);
  final contactMessageKey = find.byKey(WidgetKeys.contactMessageKey);
  final contactDetails = find.byKey(WidgetKeys.contactDetailsKey);
  final timeSupport = find.byKey(WidgetKeys.timeSupport);
  final sendMessageButtonKey = find.byKey(WidgetKeys.sendMessageButtonKey);
  final internationalPhoneNumberInputKey =
      find.byKey(WidgetKeys.internationalPhoneNumberInputKey);

  Future<void> enterUserNameField(String name) async {
    await tester.tap(userNameKey);
    await tester.enterText(userNameKey, name);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterPhoneNumberField(String phoneNumber) async {
    await tester.tap(phoneNumberKey);
    await tester.enterText(phoneNumberKey, phoneNumber);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterEmailField(String email) async {
    await tester.tap(emailKey);
    await tester.enterText(emailKey, email);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterMessageField(String message) async {
    await tester.tap(contactMessageKey);
    await tester.enterText(contactMessageKey, message);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> tapToSendMessage() async {
    await scrollEnsureFinderVisible(sendMessageButtonKey);
    await tester.pumpAndSettle();
    await tester.tap(sendMessageButtonKey);
    await tester.pumpAndSettle();
  }

  void verifyContactDetailInfo({
    required String email,
    required String numberPhone,
  }) {
    expect(
      find.descendant(
        of: contactDetails,
        matching: find.text(email.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: contactDetails,
        matching: find.text(numberPhone.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyTimeSupport() {
    expect(
      find.descendant(
        of: timeSupport,
        matching: find.text('Monday to Friday: 8am - 8pm'.tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: timeSupport,
        matching: find.text('Saturday: 8am - 5pm'.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyAllFieldVisible() {
    expect(userNameKey, findsOneWidget);
    expect(phoneNumberKey, findsOneWidget);
    expect(emailKey, findsOneWidget);
    expect(contactMessageKey, findsOneWidget);
    expect(sendMessageButtonKey, sendMessageButtonKey);
  }

  void verifyInitValueField({
    required String userName,
    required String email,
  }) {
    expect(_getValueTextFormField(userNameKey), userName);
    expect(_getValueTextFormField(emailKey), emailKey);
  }

  String _getValueTextFormField(Finder finder) {
    final editableText = find.descendant(
      of: finder,
      matching: find.byType(EditableText),
    );
    return tester.widget<EditableText>(editableText).controller.text;
  }

  void verifyUserNameRequireErrorMsg() {
    expect(
      _errorMessageField(userNameKey, 'Name is required.'),
      findsOneWidget,
    );
  }

  void verifyPhoneNumberInValidErrorMsg() {
    expect(
      _errorMessageField(phoneNumberKey, 'Enter a valid contact number.'),
      findsOneWidget,
    );
  }

  void verifyEmailInValidErrorMsg() {
    expect(
      _errorMessageField(emailKey, 'Enter a valid email address.'),
      findsOneWidget,
    );
  }

  void verifyEmailRequireErrorMsg() {
    expect(
      _errorMessageField(emailKey, 'Email is required.'),
      findsOneWidget,
    );
  }

  void verifyMessageFieldRequireErrorMsg() {
    expect(
      _errorMessageField(contactMessageKey, 'Message is required.'),
      findsOneWidget,
    );
  }

  Finder _errorMessageField(Finder ancestorFinder, String errorMessage) {
    return find.descendant(
      of: ancestorFinder,
      matching: find.text(errorMessage.tr()),
    );
  }
}
