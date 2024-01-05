import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ProfileRobot {
  final WidgetTester tester;

  ProfileRobot(this.tester);

  final page = find.byKey(WidgetKeys.profilePage);

  void verifyPageVisible() {
    expect(page, findsOneWidget);
    _verifyTextVisible('Profile');
  }

  void _verifyTextVisible(String text) {
    final textWidget = find.textContaining(text.tr());
    expect(textWidget, findsOneWidget);
  }

  void _verifyInfoRowVisible(String name, String value) {
    final infoRow = find.byKey(WidgetKeys.balanceTextRow(name.tr(), value));
    expect(infoRow, findsOneWidget);
  }

  void verifyAccountAndBusinessDetailsVisible({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String mobilePhone,
    required String language,
  }) {
    _verifyTextVisible('Account & business details:');
    final userDetails = find.byKey(WidgetKeys.profileUserDetails);
    expect(userDetails, findsOneWidget);
    _verifyInfoRowVisible('First name', firstName);
    _verifyInfoRowVisible('Last name', lastName);
    _verifyInfoRowVisible('Email', email);
    _verifyInfoRowVisible('Username', username);
    _verifyInfoRowVisible('Contact number', mobilePhone);
    _verifyTextVisible('Language');
    _verifyTextVisible(language);
  }

  void verifyLicenseListVisible() {
    _verifyTextVisible('License information:');
    final noItemFound =
        find.byKey(WidgetKeys.noRecordsFoundSearchIcon).evaluate().isNotEmpty;
    if (noItemFound) {
      _verifyTextVisible('Looks like you don`t have any license here'.tr());
    } else {
      final licenseItems = find.byKey(WidgetKeys.profileLicenseTile);
      final itemCount = licenseItems.evaluate().length;
      expect(licenseItems, findsAtLeastNWidgets(1));
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseName),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseNo),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseDateRange),
        ),
        findsNWidgets(itemCount),
      );
      expect(
        find.descendant(
          of: licenseItems,
          matching: find.byKey(WidgetKeys.profileLicenseStatus),
        ),
        findsNWidgets(itemCount),
      );
    }
  }

  void _verifyButtonDisabled(Key key) {
    final button = find.byKey(key);
    expect(button, findsOneWidget);
    final buttonWidget = tester.widget<ButtonStyleButton>(button);
    expect(buttonWidget.onPressed, null);
  }

  void verifyButtonsDisabled() {
    _verifyButtonDisabled(WidgetKeys.profileClearButton);
    _verifyButtonDisabled(WidgetKeys.profileSaveButton);
  }
}
