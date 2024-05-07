import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'enum.dart';
import 'extension.dart';

class CommonRobot {
  final WidgetTester tester;

  CommonRobot(this.tester);

  final ordersTab = find.byKey(WidgetKeys.ordersTab);
  final moreTab = find.byKey(WidgetKeys.moreTab);
  final notificationTab = find.byKey(WidgetKeys.notificationTab);
  final customerCodeSelector = find.byKey(WidgetKeys.customerCodeSelector);
  final customSnackBar = find.byKey(WidgetKeys.customSnackBar);
  final searchBar = find.byType(CustomSearchBar);
  final homeTabBar = find.byKey(WidgetKeys.homeTabBar);
  final homeTab = find.byKey(WidgetKeys.homeTab);
  final productsTab = find.byKey(WidgetKeys.productsTab);
  final cartButton = find.byType(CartButton);
  final payerInformationVn = find.byKey(WidgetKeys.payerInformation);
  final licenseExpiredBanner = find.byKey(WidgetKeys.licenseExpiredBanner);
  final viewLicenseButton = find.byKey(WidgetKeys.viewLicenseButton);

  Future<void> setDateRangePickerValue({
    required DateTime fromDate,
    required DateTime toDate,
    String? dateStringFormat = 'MM/dd/yyyy',
  }) async {
    final dateFormat = DateFormat(dateStringFormat);
    final fromDateString = dateFormat.format(fromDate);
    final toDateString = dateFormat.format(toDate);

    final dialog = find.byType(DateRangePickerDialog);
    final editWidget = find.descendant(
      of: dialog,
      matching: find.widgetWithIcon(IconButton, Icons.edit_outlined),
    );
    final dateRangeFields =
        find.descendant(of: dialog, matching: find.byType(TextField));
    final isInputMode = dateRangeFields.evaluate().length == 2;
    if (!isInputMode) {
      await tester.tap(editWidget);
      await tester.pumpAndSettle();
    }

    await tester.enterText(dateRangeFields.first, fromDateString);
    await tester.pump();
    await tester.enterText(dateRangeFields.last, toDateString);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    final buttons = find.descendant(
      of: find.byType(DateRangePickerDialog),
      matching: find.byType(TextButton),
    );
    await tester.tap(buttons.last);
    await tester.pumpAndSettle();
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

  //============================================================
  //  Snackbar
  //============================================================

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

  Future<void> verifySnackbarVisible() async {
    expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> verifyCustomSnackBar({required String message}) =>
      tester.pumpUntilVisible(
        find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.customSnackBarMessage &&
              widget is Text &&
              widget.data == message,
        ),
        maxIteration: 60,
      );

  //============================================================
  //  Customer code selector
  //============================================================

  void verifyCustomerCodeSelector() {
    expect(customerCodeSelector, findsOneWidget);
  }

  bool get isCustomerCodeSelectorVisible =>
      customerCodeSelector.evaluate().isNotEmpty;

  Future<void> tapCustomerCodeSelector() async {
    await tester.tap(customerCodeSelector);
    await tester.pumpAndSettle();
  }

  Future<void> changeDeliveryAddress(
    String shipToCode,
  ) async {
    if ((tester
                .widget<ListTile>(find.byKey(WidgetKeys.customerCodeSelect))
                .title as Text)
            .data ==
        shipToCode) {
      await closeAnnouncementAlertDialog();
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
      await closeAnnouncementAlertDialog();
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

  Future<void> verifyAndDismissInvalidLengthSearchMessageSnackbar({
    bool isVisible = true,
  }) async {
    expect(
      find.descendant(
        of: customSnackBar,
        matching: find.text('Please enter at least 2 characters.'.tr()),
      ),
      isVisible ? findsWidgets : findsNothing,
    );
    if (isVisible) {
      await dismissSnackbar(dismissAll: true);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    }
  }

  Future<void> searchWithKeyboardAction(String text) async {
    await tester.tap(searchBar);
    await tester.pump();
    await tester.enterText(searchBar, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> autoSearch(String text) async {
    await tester.tap(searchBar);
    await tester.pump();
    await tester.enterText(searchBar, text);
    await tester.pumpAndSettle(
      Duration(milliseconds: locator<Config>().autoSearchTimeout),
    );
  }

  Future<void> searchWithSearchIcon(String text) async {
    await tester.pumpUntilVisible(searchBar);
    await tester.tap(searchBar);
    await tester.pump();
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

  Future<void> tapToBackIcon() async {
    final backButton = find.byKey(WidgetKeys.backButton).last;
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

  Future<void> tapToBackScreen() async {
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
  }

  Future<void> scrollEnsureFinderVisible(
    Finder finder, {
    int maxIteration = 50,
    reversed = false,
  }) async {
    await tester.dragUntilVisible(
      finder,
      find.byKey(WidgetKeys.scrollList),
      Offset(0.0, reversed ? 200 : -200),
    );
    await tester.pump();
  }

  //============================================================
  //  Announcement/Alert Banner/dialog
  //============================================================

  Future<void> closeAnnouncementAlertDialog() async {
    //close dialog if present
    final closeAlertDialog = find.byKey(WidgetKeys.closeAlertDialog);
    await tester.pumpUntilVisible(
      closeAlertDialog,
      maxIteration: 3,
    );
    if (closeAlertDialog.evaluate().isNotEmpty) {
      await tester.tap(closeAlertDialog);
      await tester.pumpAndSettle();
    }
  }

  //============================================================
  //  Bill To information for VN
  //============================================================
  Future<void> verifyBillToInfoForVn({
    required String customerCode,
    required String shipToAddress,
    required String name,
    required String email,
    required String taxNumber,
    required String phoneNumber,
  }) async {
    final isExpanded =
        tester.widget<ExpansionTile>(payerInformationVn).initiallyExpanded;
    if (!isExpanded) {
      await tester.tap(find.byKey(WidgetKeys.billToCustomerCode));
      await tester.pumpAndSettle();
    }
    expect(
      find.descendant(
        of: payerInformationVn,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.billToCustomerCode &&
              widget is Text &&
              widget.data == '${'Bill-to'.tr()}: $customerCode',
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: payerInformationVn,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.billToAddress &&
              widget is Text &&
              widget.data == (shipToAddress),
        ),
      ),
      findsOneWidget,
    );
    _verifyBillToInfoField('Name', name);
    _verifyBillToInfoField('Email', email);
    _verifyBillToInfoField('Tax number', taxNumber);
    _verifyBillToInfoField('Phone', phoneNumber);
    await tester.tap(find.byKey(WidgetKeys.billToCustomerCode));
    await tester.pump();
  }

  void _verifyBillToInfoField(String keyText, String valueText) {
    expect(
      find.descendant(
        of: payerInformationVn,
        matching: find.byKey(
          WidgetKeys.balanceTextRow(keyText.tr(), valueText),
        ),
      ),
      findsOneWidget,
    );
  }

  //============================================================
  //  Language Translation stuff
  //============================================================

  String get noRecordFoundDefaultSubTitle =>
      '${'Try adjusting your search or filter selection to find what you’re looking for'.tr()}.';

  //============================================================
  //  Expiry date info bottomsheet
  //============================================================

  void findLicenseExpiredBanner() {
    final licenseExpiredBannerTitle = find.text(
      'You have licenses that are about to expire or has expired.'.tr(),
    );
    final licenseExpiredBannerSubTitle = find.text(
      'To continue using eZRx+, please renew your license.'.tr(),
    );

    expect(licenseExpiredBanner, findsOneWidget);
    expect(licenseExpiredBannerTitle, findsOneWidget);
    expect(licenseExpiredBannerSubTitle, findsOneWidget);
  }

  void findViewLicenseButton() {
    expect(viewLicenseButton, findsOneWidget);
  }

  Future<void> tapViewLicenseButton() async {
    await tester.tap(viewLicenseButton);
    await tester.pumpAndSettle();
  }
}
