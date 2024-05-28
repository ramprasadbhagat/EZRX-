import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/return_summary_by_item_details.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ReturnsByItemsDetailRobot extends CommonRobot {
  ReturnsByItemsDetailRobot(WidgetTester tester) : super(tester);

  final copyButton = find.byKey(WidgetKeys.returnItemDetailCopyButton);
  final showDetailButton = find.byKey(WidgetKeys.returnDetailShowDetailButton);
  final showDetailButtonFoBonus =
      find.byKey(WidgetKeys.returnDetailShowDetailButton);
  final _page = find.byType(ReturnRequestSummaryByItemDetails);

  void verifyPage() {
    expect(_page, findsOneWidget);
  }

  bool get isReturnDetailPage => _page.evaluate().isNotEmpty;

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

  void verifyRequestDateVisible() {
    expect(
      find.byKey(WidgetKeys.returnItemDetailRequestDate),
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

  void verifyStatusTrackerVisible(String status) {
    expect(
      find.byKey(WidgetKeys.statusTracker(status)),
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
    await scrollEnsureFinderVisible(
      find.byType(ReturnItemCard),
    );
    await tester.pump();
  }

  Future<void> dragToVerifyBonusSectionVisible() async {
    await scrollEnsureFinderVisible(
      find.byKey(WidgetKeys.returnBonusItemCard),
    );
  }

  void verifyMaterialVisible(String materialNumber, int qty, String price) {
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailMaterial(
          materialNumber,
          qty.toString(),
          price,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialVisibleWithBonus(
    String materialNumber,
    int qty,
    String price,
  ) {
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailMaterial(
          materialNumber,
          qty.toString(),
          price,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailBonusItem,
      ),
      findsOneWidget,
    );
  }

  void verifyOnlyBonusMaterial(
    String materialNumber,
    int qty,
    String price,
  ) {
    expect(
      find.byKey(
        WidgetKeys.returnItemDetailOnlyBonusMaterial(
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

  void verifyBonusDetailCollapsed(bool isCollapsed) {
    expect(
      find.descendant(
        of: showDetailButtonFoBonus,
        matching:
            find.text(isCollapsed ? 'Show details'.tr() : 'Hide details'.tr()),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapShowDetailButton() async {
    await scrollEnsureFinderVisible(showDetailButton);
    await tester.tap(showDetailButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapToShowDetailForBonus() async {
    final finder = find.descendant(
      of: showDetailButtonFoBonus,
      matching: find.text('Show details'.tr()),
    );
    if (finder.evaluate().isNotEmpty) {
      await scrollEnsureFinderVisible(showDetailButtonFoBonus);
      await tester.tap(showDetailButtonFoBonus);
      await tester.pumpAndSettle();
    }
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

  void verifyMaterialInvoiceDate() {
    expect(
      find.byKey(WidgetKeys.returnItemDetailMaterialInvoiceDate),
      findsOneWidget,
    );
  }

  void verifyMaterialReturnReason(String reason) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Reason'.tr(), reason)),
      findsWidgets,
    );
  }

  void verifyMaterialReturnType(String returnType) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Return type'.tr(), returnType)),
      findsWidgets,
    );
  }

  void verifyMaterialReturnComments(String comment) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Comments'.tr(), comment)),
      findsWidgets,
    );
  }

  Future<void> tapCopyButton() async {
    await tester.tap(copyButton);
    await tester.pumpAndSettle();
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
