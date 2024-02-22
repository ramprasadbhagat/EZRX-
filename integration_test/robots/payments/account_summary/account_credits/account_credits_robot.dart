import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../common/extension.dart';

class AccountCreditsRobot {
  final WidgetTester _tester;

  AccountCreditsRobot(this._tester);

  //initialize Finder
  final Finder _fileDownloadButtonFinder =
      find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final Finder _filterTuneIconFinder =
      find.byKey(WidgetKeys.accountSummaryFilterButton);
  final Finder _newPaymentButtonFinder =
      find.byKey(WidgetKeys.newPaymentButton);
  final Finder _searchBar = find.byKey(WidgetKeys.accountSummarySearchBar);
  final Finder _itemTile = find.byKey(WidgetKeys.creditsItemTile);
  final Finder _itemGroupDate = find.byKey(WidgetKeys.creditCreatedOn);

  //Robot Functions
  void verify() {
    expect(find.byKey(WidgetKeys.allCreditsPage), findsOneWidget);
  }

  void verifyCreditSearchBar() {
    expect(_searchBar, findsOneWidget);
  }

  Future<void> searchCredits(String input) async {
    await _tester.enterText(_searchBar, input);
    await _tester.testTextInput.receiveAction(TextInputAction.done);
    await _tester.pumpAndSettle();
  }

  void verifyFilterTuneIcon() {
    expect(_filterTuneIconFinder, findsOneWidget);
  }

  void verifyFilterAppliedCount(int count) {
    expect(find.byKey(WidgetKeys.creditFilterApplied(count)), findsOneWidget);
  }

  void verifyDownloadButton() {
    expect(_fileDownloadButtonFinder, findsOneWidget);
  }

  Future<void> tapDownloadButton() async {
    await _tester.tap(_fileDownloadButtonFinder);
    await _tester.pumpAndSettle();
  }

  void verifyNewPaymentButton() {
    expect(_newPaymentButtonFinder, findsOneWidget);
  }

  Future<void> tapFilterTuneIcon() async {
    await _tester.tap(_filterTuneIconFinder);
    await _tester.pumpAndSettle();
  }

  void verifyNoCreditFound() {
    expect(_itemTile, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text('No credit found'.tr()), findsOneWidget);
    expect(
      find.text(
        'Try adjusting your search or filter selection to find what you’re looking for.'
            .tr(),
      ),
      findsOneWidget,
    );
  }

  void verifyCreditItem(String searchKey, String status, String price) {
    _verifyCreditItemId(searchKey);
    _verifyCreditItemStatus(status);
    _verifyCreditItemPrice(price);
  }

  void verifyCreditItemForID(String searchKey, String price) {
    _verifyCreditItemId(searchKey);
    _verifyCreditItemPrice(price);
  }

  void _verifyCreditItemId(String searchKey) {
    _verifyOneCreditItem();
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byKey(WidgetKeys.creditItemId(searchKey)),
      ),
      findsOneWidget,
    );
  }

  void _verifyCreditItemStatus(String status) {
    _verifyOneCreditItem();
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.text(status),
      ),
      findsOneWidget,
    );
  }

  void _verifyOneCreditItem() {
    expect(_itemGroupDate, findsOneWidget);
    expect(_itemTile, findsOneWidget);
  }

  void _verifyCreditItemPrice(String price) {
    _verifyOneCreditItem();
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(price),
      ),
      findsOneWidget,
    );
  }

  bool get noCreditFound => find.byType(NoRecordFound).evaluate().isNotEmpty;

  void verifyCreditItemsList() {
    expect(_itemTile, findsAtLeastNWidgets(1));
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(StatusLabel),
      ),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(PriceComponent),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyCreditItemsListForID() {
    expect(_itemTile, findsAtLeastNWidgets(1));
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(StatusLabel),
      ),
      findsNothing,
    );
    expect(
      find.descendant(
        of: _itemTile,
        matching: find.byType(PriceComponent),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> tapPaymentButton() async {
    await _tester.tap(_newPaymentButtonFinder);
    await _tester.pumpAndSettle();
  }

  Future<void> tapFirstCreditItem() async {
    await _tester.tap(_itemTile.first);
    await _tester.pumpAndSettle();
  }

  void verifyCreditsCreatedGroupInDateRange({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    expect(_itemGroupDate, findsAtLeastNWidgets(1));
    final dateText = _tester
        .widgetList<Text>(
          find.descendant(
            of: _itemGroupDate,
            matching: find.textContaining('Created on'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Created on'.tr()} ');
      final date = DateFormat(DateTimeFormatString.displayDateFormat)
          .parse(dateText.last);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyCreditsItemListWithStatus(String status, {bool isVisible = true}) {
    final statusText = _tester
        .widgetList<Text>(
          find.descendant(
            of: _itemTile,
            matching: find.text(status),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == status, isVisible);
    }
    expect(_itemTile.evaluate().length, isVisible ? statusText.length : 0);
  }

  void verifyCreditsInAmountRange({
    required double fromAmount,
    required double toAmount,
    required String currency,
  }) {
    expect(_itemGroupDate, findsAtLeastNWidgets(1));
    final dateText = _tester
        .widgetList<RichText>(find.byKey(WidgetKeys.priceComponent))
        .map((e) => e.text.toPlainText());
    for (final text in dateText) {
      final price = text.split('$currency ').last.priceValue;
      expect(fromAmount <= price && price <= toAmount, true);
    }
  }
}
