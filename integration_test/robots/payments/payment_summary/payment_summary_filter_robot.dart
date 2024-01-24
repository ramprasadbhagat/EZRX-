import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentSummaryFilterRobot {
  final WidgetTester tester;

  PaymentSummaryFilterRobot(this.tester);

  final fromDateFilter = find.byKey(WidgetKeys.fromDocumentDateField);
  final toDateFilter = find.byKey(WidgetKeys.toDocumentDateField);
  final fromAmountFilter = find.byKey(WidgetKeys.amountValueFrom);
  final toAmountFilter = find.byKey(WidgetKeys.amountValueTo);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final statusFilterOptions = [
    'In Progress',
    'Failed',
    'Processed',
    'Successful',
  ];

  void verifyDefaultFilterApplied() {
    verifyRadioListTileFilter();
    verifyDateRangeFilterApplied(
      fromDate: '',
      toDate: '',
    );
    verifyAmountRangeFilterApplied(
      fromAmount: '',
      toAmount: '',
    );
  }

  void verifyRadioListTileFilter() {
    for (final option in statusFilterOptions) {
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus(option)),
        findsOneWidget,
      );
    }
  }

  Future<void> enterFromAmount(String text) async {
    await tester.tap(fromAmountFilter);
    await tester.enterText(fromAmountFilter, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> enterToAmount(String text) async {
    await tester.tap(toAmountFilter);
    await tester.enterText(toAmountFilter, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  void verifyAmountRangeFilterApplied({
    required String fromAmount,
    required String toAmount,
  }) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextFormField &&
            widget.key == WidgetKeys.amountValueFrom &&
            widget.initialValue == fromAmount,
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextFormField &&
            widget.key == WidgetKeys.amountValueTo &&
            widget.initialValue == toAmount,
      ),
      findsOneWidget,
    );
    expect(find.text('Invalid Amount range!'.tr()), findsNothing);
  }

  void verifyInvalidAmountErrorVisible() {
    expect(find.text('Invalid Amount range!'.tr()), findsOneWidget);
  }

  void verifyDateRangeFilterApplied({
    required String fromDate,
    required String toDate,
  }) {
    expect(
      find.descendant(
        of: fromDateFilter,
        matching: find.text(
          DateTimeStringValue(fromDate).dateString,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: toDateFilter,
        matching: find.text(
          DateTimeStringValue(toDate).dateString,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyApplyButtonVisible() {
    expect(applyButton, findsOneWidget);
  }

  void verifyResetButtonVisible() {
    expect(resetButton, findsOneWidget);
  }

  Future<void> tapCloseIcon() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> tapFromDateField() async {
    await tester.tap(fromDateFilter);
    await tester.pump();
  }

  Future<void> tapToDateField() async {
    await tester.tap(toDateFilter);
    await tester.pump();
  }

  Future<void> tapApplyButton() async {
    await tester.tap(applyButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapResetButton() async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapStatusCheckbox(String name) async {
    await tester.tap(
      find.byWidgetPredicate(
        (widget) =>
            widget is RadioListTile &&
            widget.key == WidgetKeys.paymentSummaryFilterStatus(name),
      ),
    );
    await tester.pump();
  }

  void verifyStatusFilterValue(String name) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RadioListTile &&
            widget.key == WidgetKeys.paymentSummaryFilterStatus(name) &&
            widget.groupValue == FilterStatus(name),
      ),
      findsOneWidget,
    );
  }
}
