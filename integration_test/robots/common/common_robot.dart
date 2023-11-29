import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'enum.dart';

class CommonRobot {
  final WidgetTester tester;

  CommonRobot(this.tester);

  final ordersTab = find.byKey(WidgetKeys.ordersTab);
  final moreTab = find.byKey(WidgetKeys.moreTab);
  final notificationTab = find.byKey(WidgetKeys.notificationTab);
  final customerCodeSelector = find.byKey(WidgetKeys.customerCodeSelector);
  final customSnackBar = find.byKey(WidgetKeys.customSnackBar);
  final searchBar = find.byType(CustomSearchBar);
  final invalidLengthSearchMessage =
      find.text('Please enter at least 2 characters.'.tr());

  Future<void> goToMoreTab() async {
    await tester.tap(moreTab);
    await tester.pumpAndSettle();
  }

  final homeTabBar = find.byKey(WidgetKeys.homeTabBar);
  final homeTab = find.byKey(WidgetKeys.homeTab);
  final productsTab = find.byKey(WidgetKeys.productsTab);
  final cartButton = find.byType(CartButton);

  Future<void> goToHomeTab() async {
    await tester.tap(homeTab);
    await tester.pumpAndSettle();
  }

  Future<void> goToOrderTab() async {
    await tester.tap(ordersTab);
    await tester.pumpAndSettle();
  }

  Future<void> changeDeliveryAddress(String shipToCode) async {
    if ((tester
                .widget<ListTile>(find.byKey(WidgetKeys.customerCodeSelect))
                .title as Text)
            .data ==
        shipToCode) {
      return;
    } else {
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
  }

  Future<void> setDateRangePickerValue({
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    final fromDateString = '${fromDate.month}/${fromDate.day}/${fromDate.year}';
    final toDateString = '${toDate.month}/${toDate.day}/${toDate.year}';
    final dialog = find.byType(DateRangePickerDialog);
    final editWidget = find.descendant(
      of: dialog,
      matching: find.widgetWithIcon(IconButton, Icons.edit),
    );
    final dateRangeFields =
        find.descendant(of: dialog, matching: find.byType(TextField));
    final isInputMode = dateRangeFields.evaluate().length == 2;
    if (!isInputMode) {
      await tester.tap(editWidget);
      await tester.pump();
    }

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

  Future<void> cancelDateRangePicker() async {
    final buttons = find.descendant(
      of: find.byType(DateRangePickerDialog),
      matching: find.byType(TextButton),
    );
    await tester.tap(buttons.first);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToScreen(NavigationTab navigationTab) async {
    switch (navigationTab) {
      case NavigationTab.home:
        await tester.tap(homeTab);
        break;
      case NavigationTab.products:
        await tester.tap(productsTab);
        break;
      case NavigationTab.orders:
        await tester.tap(ordersTab);
        break;
      case NavigationTab.more:
        await tester.tap(moreTab);
        break;
      case NavigationTab.notifications:
        await tester.tap(notificationTab);
        break;
    }
    await tester.pumpAndSettle();
  }

  void verifyLoadingImage({bool isVisible = true}) {
    expect(
      find.byKey(WidgetKeys.loaderImage),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> pullToRefresh() async {
    await tester.drag(find.byKey(WidgetKeys.scrollList), const Offset(0, 500));
    await tester.pumpAndSettle();
  }

  Future<void> dismissSnackbar({bool dismissAll = false}) async {
    final dismissButton = find.byKey(WidgetKeys.snackBarDismissButton);
    if (dismissAll) {
      while (dismissButton.evaluate().isNotEmpty) {
        await tester.tap(dismissButton.first);
        await tester.pumpAndSettle();
      }
    } else {
      if (dismissButton.evaluate().isNotEmpty) {
        await tester.tap(dismissButton.first);
        await tester.pumpAndSettle();
      }
    }
  }

  //============================================================
  //  Search bar
  //============================================================
  void verifySearchBarText(String text) {
    final editableText = find.descendant(
      of: searchBar,
      matching: find.byType(EditableText),
    );
    expect(tester.widget<EditableText>(editableText).controller.text, text);
  }

  void verifySearchBar() {
    expect(searchBar, findsOneWidget);
  }

  void verifyInvalidLengthSearchMessage({bool isVisible = true}) {
    expect(
      invalidLengthSearchMessage,
      isVisible ? findsOneWidget : findsNothing,
    );
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

  void verifyAppTabBarVisible() {
    expect(homeTabBar, findsOneWidget);
  }

  void verifyCustomerCodeSelectorVisible() {
    expect(customerCodeSelector, findsOneWidget);
  }

  Future<void> verifySnackbarVisible() async {
    expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> tapToBackIcon() async {
    final backButton = find.byKey(WidgetKeys.backButton).first;
    await tester.tap(backButton);
    await tester.pumpAndSettle();
  }

  //============================================================
  //  Cart button
  //============================================================

  Future<void> tapCartButton() async {
    await tester.tap(cartButton);
    await tester.pumpAndSettle();
  }

  void verifyCartButtonQty(int qty) {
    expect(
      find.descendant(of: cartButton, matching: find.text(qty.toString())),
      findsOneWidget,
    );
  }

  void verifyCustomSnackBar({
    required String message,
  }) {
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage)).data,
      message,
    );
  }

  Future<void> tapToBackScreen() async {
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
  }

  Future<void> scrollEnsureFinderVisible(Finder finder) async {
    await tester.dragUntilVisible(
      finder,
      find.byKey(WidgetKeys.scrollList),
      const Offset(0.0, -200),
    );
  }
}
