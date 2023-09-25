import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CommonRobot {
  final WidgetTester tester;

  CommonRobot(this.tester);

  final ordersTab = find.byKey(WidgetKeys.ordersTab);
  final moreTab = find.byKey(WidgetKeys.moreTab);
  final customerCodeSelector = find.byKey(WidgetKeys.customerCodeSelector);
  final searchBar = find.byType(CustomSearchBar);
  final invalidLengthSearchMessage =
      find.text('Please enter at least 2 characters.'.tr());

  Future<void> goToMoreTab() async {
    await tester.tap(moreTab);
    await tester.pumpAndSettle();
  }

  Future<void> goToOrderTab() async {
    await tester.tap(ordersTab);
    await tester.pumpAndSettle();
  }

  Future<void> changeDeliveryAddress(String shipToCode) async {
    await tester.tap(customerCodeSelector);
    await tester.pumpAndSettle();
    await searchWithKeyboardAction(shipToCode);
    await tester
        .tap(find.byKey(WidgetKeys.shipToAddressOption(shipToCode)).first);
    await tester.pumpAndSettle();
    final changeAddressButton = find.descendant(
      of: find.byKey(WidgetKeys.confirmButton),
      matching: find.text('Change address'.tr()),
    );
    if (tester.widgetList(changeAddressButton).isNotEmpty) {
      await tester.tap(changeAddressButton);
      await tester.pumpAndSettle();
    }
  }

  Future<void> setDateRangePickerValue({
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    final fromDateString = '${fromDate.month}/${fromDate.day}/${fromDate.year}';
    final toDateString = '${toDate.month}/${toDate.day}/${toDate.year}';

    await tester.tap(find.widgetWithIcon(IconButton, Icons.edit));
    await tester.pump();
    final dateRangeFields = find.descendant(
      of: find.byType(DateRangePickerDialog),
      matching: find.byType(TextField),
    );
    await tester.enterText(dateRangeFields.first, fromDateString);
    await tester.enterText(dateRangeFields.last, toDateString);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    final buttons = find.descendant(
      of: find.byType(DateRangePickerDialog),
      matching: find.byType(TextButton),
    );
    await tester.tap(buttons.last);
    await tester.pump();
  }

  void verifyLoadingNotVisible() {
    expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
  }

  //============================================================
  //  Search bar
  //============================================================
  void verifyInvalidLengthSearchMessageVisible() {
    expect(invalidLengthSearchMessage, findsOneWidget);
  }

  void verifyInvalidLengthSearchMessageNotVisible() {
    expect(invalidLengthSearchMessage, findsNothing);
  }

  Future<void> searchWithKeyboardAction(String text) async {
    await tester.tap(searchBar);
    await tester.enterText(searchBar, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> autoSearch(String text) async {
    await tester.enterText(searchBar, text);
    await tester.pumpAndSettle(
      Duration(milliseconds: locator<Config>().autoSearchTimeout),
    );
  }

  Future<void> searchWithSearchIcon(String text) async {
    await tester.tap(searchBar);
    await tester.enterText(searchBar, text);
    await tester.tap(find.byKey(WidgetKeys.searchIconKey));
    await tester.pumpAndSettle();
  }

  Future<void> tapClearSearch() async {
    await tester.tap(find.byKey(WidgetKeys.clearIconKey));
    await tester.pumpAndSettle();
  }

  Future<void> waitAutoSearchDuration() async {
    await tester
        .pump(Duration(milliseconds: locator<Config>().autoSearchTimeout));
  }
}
