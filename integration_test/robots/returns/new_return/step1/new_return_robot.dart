import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/extension.dart';

class NewReturnRobot {
  final WidgetTester tester;

  NewReturnRobot(this.tester);

  final searchItem = find.byKey(WidgetKeys.newRequestSearchItem);
  final filterIcon = find.byKey(WidgetKeys.newRequestFilterIcon);
  final listAbleToReturn =
      find.byKey(WidgetKeys.newRequestListItemAbleToReturn);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final returnFor = find.byKey(WidgetKeys.newRequestReturnFor);
  final addressInfoSectionActionLabel =
      find.byKey(WidgetKeys.addressInfoSectionActionLabel);
  final addressInfoSectionCustomerCodeLabel =
      find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel);
  final addressInfoSectionDeliveryToLabel =
      find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel);
  final fromInvoiceDateField = find.byKey(
    WidgetKeys.fromInvoiceDateField,
  );
  final searchBar = find.byKey(WidgetKeys.genericKey(key: ''));
  final item = find.byKey(WidgetKeys.newReturnItem);
  final applyButton = find.byKey(WidgetKeys.filterApplyButton);
  final resetButton = find.byKey(WidgetKeys.filterResetButton);
  final closeSummaryInfoNewRequestPage =
      find.byKey(WidgetKeys.closeSummaryInfoNewRequestPage);
  final searchIcon = find.byKey(WidgetKeys.searchIconKey);
  final closeStep1 = find.byKey(WidgetKeys.closeButton);

  final clearIcon = find.byKey(WidgetKeys.clearIconKey);
  final cannotMoveToNextStep = find.byKey(WidgetKeys.cannotMoveToNextStep);
  final step2Title = find.byKey(WidgetKeys.newRequestStep2Title);
  void verifySearchItemVisible() {
    expect(
      searchItem,
      findsOneWidget,
    );
  }

  String firstItemTitleWithoutFilter = '';

  void verifyFilterIconVisible() {
    expect(
      filterIcon,
      findsOneWidget,
    );
  }

  void verifyListAbleToReturnVisible() {
    expect(
      listAbleToReturn,
      findsOneWidget,
    );
  }

  void verifyReturnForVisible(String selectedAddress) {
    expect(
      returnFor,
      findsOneWidget,
    );
    expect(tester.widget<Text>(returnFor).data, contains(selectedAddress));
  }

  Future<void> tapReturnFor() async {
    expect(
      returnFor,
      findsOneWidget,
    );
    await tester.tap(returnFor);
    await tester.pumpAndSettle();
  }

  void verifyDetailBottomSheetVisible() {
    expect(addressInfoSectionActionLabel, findsOneWidget);
    expect(addressInfoSectionCustomerCodeLabel, findsOneWidget);
    expect(addressInfoSectionDeliveryToLabel, findsOneWidget);
    expect(closeSummaryInfoNewRequestPage, findsOneWidget);
  }

  Future<void> closeBottomSheetDetail() async {
    await tester.tap(closeSummaryInfoNewRequestPage);
    await tester.pumpAndSettle();
  }

  void verifyDetailBottomSheetIsHide() {
    expect(addressInfoSectionActionLabel, findsNothing);
    expect(addressInfoSectionCustomerCodeLabel, findsNothing);
    expect(addressInfoSectionDeliveryToLabel, findsNothing);
    expect(closeSummaryInfoNewRequestPage, findsNothing);
  }

  Future<void> tapFilterIcon() async {
    expect(filterIcon, findsOneWidget);
    await tester.tap(filterIcon);
    await tester.pumpAndSettle();
  }

  Future<void> tapTheDateField() async {
    expect(fromInvoiceDateField, findsOneWidget);
    await tester.tap(fromInvoiceDateField);
    await tester.pumpAndSettle();
  }

  Future<void> tapApply() async {
    expect(applyButton, findsOneWidget);
    await tester.tap(applyButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapReset() async {
    expect(resetButton, findsOneWidget);
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  void collectTheFirstItemTitleWithoutFilter() {
    expect(item, findsAtLeastNWidgets(1));
    firstItemTitleWithoutFilter = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
  }

  void verifyTheFirstItemAfterReset() {
    final itemTitleAfterReset = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
    expect(itemTitleAfterReset, equals(firstItemTitleWithoutFilter));
  }

  Future<void> verifyTheReturnListBaseOnFilter({
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    expect(item, findsAtLeastNWidgets(1));
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.textContaining('Invoice date'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Invoice date'.tr()}: ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyNextButtonVisible() {
    expect(
      nextButton,
      findsOneWidget,
    );
  }

  void verifyTheFirstItemAfterSearch(String searchKey) {
    final itemTitleAfterReset = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
    expect(itemTitleAfterReset, contains(searchKey));
  }

  Future<void> tapFirstItem() async {
    await tester.tap(item.at(1));
    await tester.pumpAndSettle();
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyNoItemFound() {
    expect(item, findsNothing);
  }

  Future<void> verifySnackbarVisible() async {
    expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage)).data,
      equals('Please enter at least 2 characters.'.tr()),
    );
  }

  Future<void> pressCloseButtonToolbar() async {
    await tester.tap(closeStep1);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(WidgetKeys.confirmBottomSheetConfirmButton));
    await tester.pumpAndSettle();
  }

  void verifyStep2Visible() {
    expect(step2Title, findsOneWidget);
    final title = tester.widget<Text>(step2Title).data!;
    expect(
      title,
      equals(
        '${'Step'.tr()} 2 ${'of'.tr()} 3: ${'Fill in return details'.tr()}',
      ),
    );
  }

  void verifyCannotMoveToNextScreen() {
    expect(cannotMoveToNextStep, findsOneWidget);
  }

  Future<void> verifyTheFirstItemAfterClearSearch() async {
    final itemTitleAfterReset = tester
        .widgetList<Text>(
          find.descendant(
            of: item,
            matching: find.byKey(WidgetKeys.itemTitleKey),
          ),
        )
        .map((e) => e.data!)
        .first;
    expect(itemTitleAfterReset, equals(firstItemTitleWithoutFilter));
  }
}
