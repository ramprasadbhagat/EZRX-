import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/extension.dart';

class AccountSummaryTabRobot {
  final WidgetTester _tester;
  AccountSummaryTabRobot(this._tester);

  final _allSummaryPage = find.byKey(WidgetKeys.allSummaryPage);
  final _filterButton = find.byKey(WidgetKeys.accountSummaryFilterButton);
  final _downloadButton = find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final _newPaymentButton = find.byType(ScaleButton);
  final _summaryItem = find.byKey(
    WidgetKeys.invoiceCreditItem,
  );
  final _priceLabel = find.byKey(WidgetKeys.priceComponent);
  final _summaryDocumentDateLabel = find.byKey(
    WidgetKeys.invoiceCreditDocumentDate,
  );
  final _statusLabel = find.byKey(WidgetKeys.invoiceItemStatus);
  final _summaryId = find.byKey(WidgetKeys.invoiceCreditItemId);
  final _summaryExpandableSection =
      find.byKey(WidgetKeys.summaryExpandableSection);
  final _newPaymentButtonFinder = find.byKey(WidgetKeys.newPaymentButton);

  void verifyPage() {
    expect(_allSummaryPage, findsOneWidget);
  }

  void verifyFilterButton() {
    expect(_filterButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await _tester.tap(_filterButton);
    await _tester.pumpAndSettle();
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: _filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyDownloadButton() {
    expect(_downloadButton, findsOneWidget);
  }

  Future<void> tapDownloadButton() async {
    await _tester.tap(_downloadButton);
    await _tester.pumpAndSettle();
  }

  void verifyNewPaymentButton() {
    expect(_newPaymentButton, findsOneWidget);
  }

  Future<void> tapNewPaymentButton() async {
    await _tester.tap(_newPaymentButton);
    await _tester.pumpAndSettle();
  }

  void verifyNoRecordFound() {
    final widget = find.byType(NoRecordFound);
    expect(widget, findsOneWidget);
    expect(
      find.descendant(
        of: widget,
        matching: find.text("That didn't match anything".tr()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: widget,
        matching: find.text(
          'Try adjusting your search or filter selection to find what you’re looking for.'
              .tr(),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyItems() {
    expect(_summaryItem, findsAtLeastNWidgets(1));
    final itemCount = _summaryItem.evaluate().length;
    expect(
      find.descendant(of: _summaryItem, matching: _summaryDocumentDateLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _summaryId),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _summaryExpandableSection),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _priceLabel),
      findsAtLeastNWidgets(itemCount),
    );
    expect(
      find.descendant(of: _summaryItem, matching: _statusLabel),
      findsAtLeastNWidgets(itemCount),
    );
  }

  void verifyItemWithId(String id, bool isCredit) {
    final itemId = '${isCredit ? 'Credit' : 'Debit'} #$id';
    expect(
      find.descendant(of: _summaryItem, matching: find.text(itemId)),
      findsOneWidget,
    );
  }

  Future<void> tapItemWithId(String id, bool isCredit) async {
    final itemId = '${isCredit ? 'Credit' : 'Debit'} #$id';
    await _tester
        .tap(find.descendant(of: _summaryItem, matching: find.text(itemId)));
    await _tester.pumpAndSettle();
  }

  void verifyExpandableDetailsButton() {
    expect(_summaryExpandableSection, findsWidgets);
  }

  Future<void> tapExpandableDetailsButton({int index = 0}) async {
    await _tester.tap(_summaryExpandableSection.at(index));
    await _tester.pumpAndSettle();
  }

  void displayDetails({bool isHidden = false, int index = 0}) {
    expect(
      find.descendant(
        of: _summaryExpandableSection.at(index),
        matching: find.text(
          isHidden
              ? 'Show reference details'.tr()
              : 'Hide reference details'.tr(),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapPaymentButton() async {
    await _tester.tap(_newPaymentButtonFinder);
    await _tester.pumpAndSettle();
  }

  Future<void> tapFirstSummaryItem() async {
    await _tester.tap(_summaryItem.first);
    await _tester.pumpAndSettle();
  }

  void verifySummaryItemsDate({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    expect(_summaryDocumentDateLabel, findsAtLeastNWidgets(1));
    final dateText = _tester
        .widgetList<Text>(
          _summaryDocumentDateLabel,
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(text);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyCreditsItemListWithStatus(String status, {bool isVisible = true}) {
    final statusText = _tester
        .widgetList<Text>(
          find.descendant(
            of: _statusLabel,
            matching: find.text(status),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == status, isVisible);
    }
    expect(_summaryItem.evaluate().length, isVisible ? statusText.length : 0);
  }
}
