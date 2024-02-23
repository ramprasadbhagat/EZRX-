import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ReturnsByRequestDetailRobot {
  final WidgetTester tester;

  ReturnsByRequestDetailRobot(this.tester);

  final scrollView = find.byKey(WidgetKeys.returnRequestDetailScrollList);
  final showDetailButton = find.byKey(WidgetKeys.returnDetailShowDetailButton);

  void verifyReturnIdVisible(
    String returnId,
  ) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.returnItemDetailReturnId &&
            widget is BalanceTextRow &&
            widget.keyText.contains(returnId),
      ),
      findsOneWidget,
    );
  }

  void verifyRequestDateVisible() {
    expect(
      find.byKey(WidgetKeys.returnRequestDetailRequestDate),
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

  void verifyStatusTrackerVisible(String status) {
    expect(
      find.byKey(WidgetKeys.statusTracker(status)),
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

  void verifySubTotalVisible(String value) {
    final subTotalLabel = find.byKey(WidgetKeys.returnRequestDetailSubTotal);
    expect(subTotalLabel, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalLabel,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGrandTotalVisible(String value) {
    final grandTotalLabel =
        find.byKey(WidgetKeys.returnRequestDetailGrandTotal);
    expect(grandTotalLabel, findsOneWidget);
    expect(
      find.descendant(
        of: grandTotalLabel,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyMaterialVisible({
    required int index,
    required String materialNumber,
  }) async {
    await tester.dragUntilVisible(
      find.descendant(
        of: _materialWidget(0),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.commonTileItemLabel &&
              widget is Text &&
              widget.data == materialNumber,
        ),
      ),
      scrollView,
      const Offset(0.0, -200),
    );
  }

  Future<void> verifyMaterialDetailCollapsed(
    int index,
    bool isCollapsed,
  ) async {
    await tester.dragUntilVisible(
      showDetailButton.at(index),
      scrollView,
      const Offset(0.0, -200),
    );
    await tester.pump();
  }

  Future<void> tapShowDetailButton(int index) async {
    await tester.tap(showDetailButton.at(index));
    await tester.pumpAndSettle();
  }

  Finder _materialWidget(int index) =>
      find.byKey(WidgetKeys.returnRequestDetailMaterial(index));
}
