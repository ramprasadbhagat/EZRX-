import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class StatementOfAccountRobot {
  final WidgetTester tester;

  StatementOfAccountRobot(this.tester);

  final page = find.byKey(WidgetKeys.soaPage);
  final soaHeaderCustomerCodeKey = find.byKey(
    WidgetKeys.soaHeaderCustomerCodeKey,
  );
  final soaFilterButtonKey = find.byKey(WidgetKeys.soaFilterButton);
  final soaFilterDefaultCountKey =
      find.byKey(WidgetKeys.genericKey(key: 'soaFilterCount#1'));
  final soaFromDateFilter = find.byKey(WidgetKeys.soaFromDateFieldKey);
  final soaToDateFilter = find.byKey(WidgetKeys.soaToDateFieldKey);
  final soaSearchResultsKey = find.byKey(WidgetKeys.soaSearchResultsKey);
  final soaNewpaymentButtonKey = find.byKey(WidgetKeys.soaNewpaymentButtonKey);
  final soaFilterApplyButtonKey =
      find.byKey(WidgetKeys.soaFilterApplyButtonKey);
  final firstSoaItemKey = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
  final soaDownloadButtonKey = find.byKey(WidgetKeys.soaItemTextKey);
  final soaFilterbottomSheetKey =
      find.byKey(WidgetKeys.soaFilterbottomSheetKey);
  final soaDownloadButtonLoadingKey =
      find.byKey(WidgetKeys.soaLoadingAnimationWidgetKey);
  final soaFilterResetButtonKey =
      find.byKey(WidgetKeys.soaFilterResetButtonKey);
  final soaCloseButtonKey = find.byKey(WidgetKeys.closeButton);
  final customSnackBar = find.byKey(WidgetKeys.customSnackBar);

  List<String?> getItemList() {
    return tester
        .widgetList<Text>(find.byKey(WidgetKeys.soaItemTextKey))
        .map((e) => e.data)
        .toList();
  }

  void verifySOAPage() {
    expect(page, findsOneWidget);
  }

  void verifySOACustomerCode(String shipToCode) {
    expect(soaHeaderCustomerCodeKey, findsOneWidget);
    final richTextChildren =
        (tester.widget<RichText>(soaHeaderCustomerCodeKey).text as TextSpan)
            .children;
    final shipToCodeText = (richTextChildren!.last as TextSpan).text;
    expect(shipToCodeText, shipToCode);
  }

  void verifySOAFilterButton() {
    if (getItemList().isEmpty) {
      expect(soaFilterButtonKey, findsNothing);
    } else {
      expect(soaFilterButtonKey, findsOneWidget);
    }
  }

  void verifySOAFilterCount() {
    if (getItemList().isEmpty) {
      expect(soaFilterButtonKey, findsNothing);
    } else {
      expect(soaFilterDefaultCountKey, findsOneWidget);
    }
  }

  void verifSOASearchResults() {
    if (getItemList().isEmpty) {
      expect(soaSearchResultsKey, findsNothing);
    } else {
      expect(soaSearchResultsKey, findsOneWidget);
    }
  }

  void verifySOANewpaymentButton() {
    expect(soaNewpaymentButtonKey, findsOneWidget);
  }

  void verifySOAFilterbottomSheet() {
    if (getItemList().isEmpty) {
      verifySOAFilterbottomSheetNot();
    } else {
      expect(soaFilterbottomSheetKey, findsOneWidget);
    }
  }

  void verifySOAFilterbottomSheetNot() {
    expect(soaFilterbottomSheetKey, findsNothing);
  }

  void verifySOAItemText(String item) {
    expect(
      tester
          .widget<Text>(
            find.descendant(
              of: firstSoaItemKey,
              matching: soaDownloadButtonKey,
            ),
          )
          .data,
      item,
    );
  }

  void verifySOAItem() {
    if (getItemList().isEmpty) {
      expect(firstSoaItemKey, findsNothing);
    } else {
      expect(firstSoaItemKey, findsOneWidget);
    }
  }

  Future<void> verifyPullToRefresh() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      final item = getItemList().first;
      verifySOAItemText(
        item ?? '',
      );
      await tester.drag(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, 500),
      );
      await tester.pumpAndSettle();
      verifySOAItemText(
        item ?? '',
      );
    }
  }

  Future<void> verifyAndTapStatementOfAccountDownloadButton() async {
    for (final i in getItemList()) {
      final soaDownloadButton = find.byKey(
        WidgetKeys.genericKey(
          key: 'soaDownloadButton#$i',
        ),
      );
      expect(soaDownloadButton, findsOneWidget);
      await tester.tap(soaDownloadButton);
      await tester.pumpAndSettle();
      expect(customSnackBar, findsOneWidget);
      expect(
        tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage)).data,
        'File downloaded successfully',
      );
      await tester.pump(const Duration(seconds: 2));
    }
  }

  Future<void> tapSOAFilterButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaFilterButtonKey);
      await tester.pumpAndSettle();
    }
  }

  Future<void> enterTextSOAFilterDateField() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.enterText(soaFromDateFilter, getItemList().first ?? '');
      await tester.enterText(soaToDateFilter, getItemList().last ?? '');
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapSOAApplyButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaFilterApplyButtonKey);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapSOANewpaymentButton() async {
    await tester.tap(soaNewpaymentButtonKey);
    await tester.pumpAndSettle();
  }

  Future<void> tapSOAResetFilterButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaFilterResetButtonKey);
      await tester.pumpAndSettle();
    }
  }

  Future<void> tapSOAFilterClosedButton() async {
    if (getItemList().isEmpty) {
      return;
    } else {
      await tester.tap(soaCloseButtonKey);
      await tester.pumpAndSettle();
    }
  }
}
