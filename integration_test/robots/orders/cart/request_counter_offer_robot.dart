import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class RequestCounterOfferRobot {
  final WidgetTester tester;

  RequestCounterOfferRobot(this.tester);

  final bottomSheet = find.byKey(WidgetKeys.counterOfferBottomSheet);
  final cancelButton = find.byKey(WidgetKeys.counterOfferCancelButton);
  final confirmButton = find.byKey(WidgetKeys.counterOfferConfirmButton);
  final listPrice = find.byKey(WidgetKeys.counterOfferListPriceWidget);
  final offerPrice = find.byKey(WidgetKeys.counterOfferPriceWidget);
  final priceTextField = find.byKey(WidgetKeys.counterOfferPriceField);
  final remarkTextField = find.byKey(WidgetKeys.counterOfferRemarksField);

  void verifySheet({required bool isVisible}) {
    expect(bottomSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCancelButton() {
    expect(cancelButton, findsOneWidget);
  }

  Future<void> tapCancelButton() async {
    await tester.tap(cancelButton);
    await tester.pumpAndSettle();
  }

  void verifyConfirmButton() {
    expect(confirmButton, findsOneWidget);
  }

  Future<void> tapConfirmButton() async {
    await tester.tap(confirmButton);
    await tester.pumpAndSettle();
  }

  void verifyListPrice(String price, {bool isVisible = true}) {
    expect(
      find.descendant(
        of: listPrice,
        matching: find.textContaining(price, findRichText: true),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifyOfferPrice(String price) {
    expect(
      find.descendant(
        of: offerPrice,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyPriceTextField() {
    expect(priceTextField, findsOneWidget);
  }

  Future<void> enterPrice(String text) async {
    await tester.tap(priceTextField);
    await tester.enterText(priceTextField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyPriceText(String text) {
    expect(
      tester.widget<TextFormField>(priceTextField).controller?.text,
      text,
    );
  }

  void verifyPriceTextEmptyMessage() {
    expect(
      find.descendant(
        of: priceTextField,
        matching: find.text('Please enter counter offer price'.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyRemarkTextField() {
    expect(remarkTextField, findsOneWidget);
  }

  Future<void> enterRemark(String text) async {
    await tester.tap(remarkTextField);
    await tester.enterText(remarkTextField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyRemarkText(String text) {
    expect(
      tester.widget<TextFormField>(remarkTextField).controller?.text,
      text,
    );
  }

  void verifyRemarkMaximumLengthMessage() {
    expect(
      find.descendant(
        of: remarkTextField,
        matching: find.text('Maximum: 132 characters'.tr()),
      ),
      findsOneWidget,
    );
  }
}
