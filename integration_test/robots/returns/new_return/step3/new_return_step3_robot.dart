import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NewReturnStep3Robot {
  final WidgetTester tester;
  NewReturnStep3Robot(this.tester);

  final submitButton = find.byKey(WidgetKeys.submitButton);
  final returnReferenceField = find.byKey(WidgetKeys.returnReferenceField);
  final specialInstructionsField =
      find.byKey(WidgetKeys.specialInstructionsField);
  final newRequestStep3MaterialDetail =
      find.byKey(WidgetKeys.newRequestStep3MaterialDetail);
  final returnFor = find.byKey(WidgetKeys.newRequestReturnFor);
  final newRequestSuccessMessage =
      find.byKey(WidgetKeys.newRequestSuccessMessage);

  void verifyStep3Visible() {
    expect(returnReferenceField, findsOneWidget);
    expect(specialInstructionsField, findsOneWidget);
    expect(submitButton, findsOneWidget);
    expect(newRequestStep3MaterialDetail, findsOneWidget);
    expect(returnFor, findsOneWidget);
  }

  String grandTotal = '';
  String itemTitle = '';
  String returnForAddress = '';
  Future<void> tapSubmit() async {
    await tester.tap(submitButton);
    await tester.pumpAndSettle();
  }

  void collectInfoBeforeSubmit() {
    returnForAddress = tester.widget<Text>(returnFor).data!;
    grandTotal = tester
        .widget<RichText>(find.byKey(WidgetKeys.priceComponent).last)
        .text
        .toPlainText();
    itemTitle = tester.widget<Text>(find.byKey(WidgetKeys.itemTitleKey)).data!;
  }

  void verifySubmitSuccessFully(String shipToAddress) {
    expect(newRequestSuccessMessage, findsOneWidget);
    expect(returnForAddress, contains(shipToAddress));
    final itemTitleSuccessPage = tester
        .widget<Text>(find.byKey(WidgetKeys.newRequestSuccessItemTitle))
        .data!;
    expect(itemTitleSuccessPage, equals(itemTitle));
    final grandTotalSuccessPage = grandTotal = tester
        .widget<RichText>(find.byKey(WidgetKeys.priceComponent).last)
        .text
        .toPlainText();
    expect(grandTotalSuccessPage, equals(grandTotal));
  }
}
