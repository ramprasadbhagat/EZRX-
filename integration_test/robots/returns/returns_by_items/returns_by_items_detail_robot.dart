import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/sections/return_request_summary_item_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ReturnsByItemsDetailRobot {
  final WidgetTester tester;

  ReturnsByItemsDetailRobot(this.tester);

  final scrollView = find.byKey(WidgetKeys.returnItemDetailScrollList);
  final copyButton = find.byKey(WidgetKeys.returnItemDetailCopyButton);
  final showDetailButton = find.byKey(WidgetKeys.returnDetailShowDetailButton);

  void verifyReturnIdVisible(String returnId) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.returnItemDetailReturnId &&
            widget is Text &&
            (widget.data ?? '').contains(returnId),
      ),
      findsOneWidget,
    );
  }

  void verifyRequestDateVisible(DateTime requestDate) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow(
          'Request date'.tr(),
          DateTimeStringValue(requestDate.toIso8601String()).dateString,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyReturnReferenceVisible(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Return reference'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifySpecialInstructionsVisible(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Special instructions'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyReturnAddressVisible(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is RichText &&
            widget.text.toPlainText().contains(address),
      ),
      findsOneWidget,
    );
  }

  void verifyStatusTrackerVisible(String status, DateTime dateTime) {
    expect(
      find.byKey(
        WidgetKeys.statusTracker(
          status,
          DateTimeStringValue(dateTime.toIso8601String()).dateTimeWithTimeZone,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCodeVisible(String customerCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
  }

  void verifyDeliveryToVisible(String shipToCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  Future<void> dragToVerifyItemSectionVisible() async {
    await tester.dragUntilVisible(
      find.byType(ReturnSummaryItemSection),
      scrollView,
      const Offset(0.0, -200),
    );
  }

  void verifyMaterialVisible(String materialNumber, int qty, String price) {
    expect(
      find.byKey(
        WidgetKeys.returnDetailMaterialItem(
          materialNumber,
          qty.toString(),
          price,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialDetailCollapsed(bool isCollapsed) {
    expect(
      find.descendant(
        of: showDetailButton,
        matching:
            find.text(isCollapsed ? 'Show details'.tr() : 'Hide details'.tr()),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapShowDetailButton() async {
    await tester.tap(showDetailButton);
    await tester.pump();
  }

  void verifyMaterialPrincipalCode(String code) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Principal code'.tr(), code)),
      findsOneWidget,
    );
  }

  void verifyMaterialPrincipalName(String name) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Principal name'.tr(), name)),
      findsOneWidget,
    );
  }

  void verifyMaterialInvoiceNumber(String number) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Invoice number'.tr(), number)),
      findsOneWidget,
    );
  }

  void verifyMaterialInvoiceDate(DateTime date) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow(
          'Invoice date'.tr(),
          DateTimeStringValue(date.toIso8601String()).dateString,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialReturnReason(String reason) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Reason'.tr(), reason)),
      findsOneWidget,
    );
  }

  void verifyMaterialReturnComments(String comment) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Comments'.tr(), comment)),
      findsOneWidget,
    );
  }

  Future<void> tapCopyButton() async {
    await tester.tap(copyButton);
    await tester.pump();
  }

  void verifyCopiedTextVisible() {
    final copyButtonText = tester.widget<Text>(copyButton).data;
    expect(copyButtonText, 'Copied'.tr());
  }

  void verifyCopyTextVisible() {
    final copyButtonText = tester.widget<Text>(copyButton).data;
    expect(copyButtonText, 'Copy'.tr());
  }
}
