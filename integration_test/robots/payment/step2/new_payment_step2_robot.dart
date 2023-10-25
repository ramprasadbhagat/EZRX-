import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentStep2Robot {
  final WidgetTester tester;
  NewPaymentStep2Robot(this.tester);
  final priceText = find.byKey(WidgetKeys.priceText);
  final checkAllWidget = find.byKey(WidgetKeys.checkAllWidget);
  final priceComponent = find.byKey(WidgetKeys.priceComponent);
  final filterBadge = find.byKey(WidgetKeys.customBadge);
  final fromDocumentDateField = find.byKey(WidgetKeys.fromDocumentDateField);
  final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
  final creditPaymentItem = find.byKey(WidgetKeys.creditPaymentItem);
  final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
  final itemCheckBadge = find.byKey(WidgetKeys.itemCheckBadge);
  final accountingDocument = find.byKey(WidgetKeys.accountingDocument);
  final documentReferenceID = find.byKey(WidgetKeys.documentReferenceID);
  final nextButton = find.byKey(WidgetKeys.nextButton);

  String firstDocumentReferenceID = '';
  String firstAccountingDocument = '';
  void verifyStep2InitialField(double price) {
    expect(
      find.textContaining('Select credit (Optional)'.tr()),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.genericKey(key: '')),
      findsOneWidget,
    );
    expect(priceComponent, findsOneWidget);
    expect(priceText, findsNWidgets(2));
    expect(checkAllWidget, findsOneWidget);
    expect(
      find.textContaining(price.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> tapFilter() async {
    await tester.tap(filterBadge);
    await tester.pumpAndSettle();
  }

  Future<void> clickDocumentDateField() async {
    await tester.tap(fromDocumentDateField);
    await tester.pumpAndSettle();
  }

  Future<void> tapApplyFilter() async {
    await tester.tap(filterApplyButton);
    await tester.pumpAndSettle();
  }

  void verifyNoItemFound() {
    expect(creditPaymentItem, findsNothing);
  }

  void verifyAtLeastOneItemFound() {
    expect(creditPaymentItem, findsAtLeastNWidgets(1));
  }

  void verifyDefaultFilter() {
    expect(
      find.text(
        DateTime.now().displayDate,
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        DateTime(
          DateTime.now().year,
          DateTime.now().month - 1,
          DateTime.now().day,
        ).displayDate,
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyOutOfRangeError() async {
    expect(find.textContaining('Out of range.'), findsOneWidget);
  }

  Future<void> tapResetFilter() async {
    await tester.tap(filterResetButton);
    await tester.pumpAndSettle();
  }

  void verifyCheckboxStatus(bool status) {
    expect(tester.widget<CheckboxListTile>(checkAllWidget).value, status);
  }

  Future<void> tapAllCheckbox() async {
    await tester.tap(checkAllWidget);
    await tester.pumpAndSettle();
  }

  void verifyNoItemIsCheck() {
    expect(itemCheckBadge, findsNothing);
  }

  void verifyAtLeast1ItemIsCheck() {
    expect(itemCheckBadge, findsAtLeastNWidgets(1));
  }

  Future<void> clickFirstItem() async {
    await tester.tap(creditPaymentItem.first);
    await tester.pumpAndSettle();
  }

  void collectTheFirstItem() {
    firstDocumentReferenceID =
        tester.widget<Text>(documentReferenceID.first).data!;
    firstAccountingDocument =
        tester.widget<Text>(accountingDocument.first).data!;
  }

  void verifyTheFirstItemAfterRefresh() {
    expect(
      tester.widget<Text>(documentReferenceID.first).data!,
      equals(firstDocumentReferenceID),
    );
    expect(
      tester.widget<Text>(accountingDocument.first).data!,
      equals(firstAccountingDocument),
    );
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyThePriceAndButton(
    double priceWithoutCredit,
    double priceWithCredit,
  ) {
    expect(
      find.textContaining(priceWithCredit.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(
        priceWithoutCredit.priceFormatted,
        findRichText: true,
      ),
      findsAtLeastNWidgets(1),
    );
    expect(tester.widget<ElevatedButton>(nextButton).enabled, true);
  }
}
