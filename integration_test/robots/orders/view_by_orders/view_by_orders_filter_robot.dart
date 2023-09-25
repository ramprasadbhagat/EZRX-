import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class ViewByOrdersFilterRobot {
  final WidgetTester tester;

  ViewByOrdersFilterRobot(this.tester);

  final fromDateFilter = find.byKey(WidgetKeys.viewByOrdersFilterFromDateKey);
  final toDateFilter = find.byKey(WidgetKeys.viewByOrdersFilterToDateKey);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);

  void verifyDefaultFilterApplied() {
    final currentTime = DateTime.now();
    verifyDateRangeFilterApplied(
      fromDate: currentTime.subtract(const Duration(days: 7)),
      toDate: currentTime,
    );
  }

  void verifyDateRangeFilterApplied({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    expect(
      find.descendant(
        of: fromDateFilter,
        matching: find.text(
          DateTimeStringValue(fromDate.toIso8601String()).dateString,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: toDateFilter,
        matching: find.text(
          DateTimeStringValue(toDate.toIso8601String()).dateString,
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
}
