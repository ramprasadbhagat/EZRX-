import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ViewByItemsFilterRobot {
  final WidgetTester tester;

  ViewByItemsFilterRobot(this.tester);

  final fromDateFilter = find.byKey(WidgetKeys.viewByItemsFilterFromDateKey);
  final toDateFilter = find.byKey(WidgetKeys.viewByItemsFilterToDateKey);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final statusFilterOptions = [
    'Order created',
    'Pending',
    'Order packed and ready for delivery',
    'Picking in-progress',
    'Out for delivery',
    'Delivered',
    'Cancelled',
    'Failed',
  ];

  void verifyDefaultFilterApplied() {
    verifyNoStatusFilterApplied();
    verifyDateRangeFilterApplied('', '');
  }

  void verifyNoStatusFilterApplied() {
    for (final option in statusFilterOptions) {
      expect(
        find.byKey(WidgetKeys.viewByItemsFilterStatusKey(option, true)),
        findsNothing,
      );
    }
  }

  void verifyDateRangeFilterApplied(String fromDate, String toDate) {
    expect(
      find.descendant(of: fromDateFilter, matching: find.text(fromDate)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: toDateFilter, matching: find.text(toDate)),
      findsOneWidget,
    );
  }

  void verifyApplyButton() {
    expect(applyButton, findsOneWidget);
  }

  void verifyResetButton() {
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

  Future<void> tapStatusCheckbox(String name) async {
    await tester.tap(find.widgetWithText(CheckboxListTile, name));
    await tester.pump();
  }

  void verifyStatusFilterValue(String name, bool value) {
    expect(
      find.byKey(WidgetKeys.viewByItemsFilterStatusKey(name, value)),
      findsOneWidget,
    );
  }
}
