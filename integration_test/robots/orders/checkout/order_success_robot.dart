import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class OrderSuccessRobot extends CommonRobot {
  OrderSuccessRobot(WidgetTester tester) : super(tester);

  void verifyPage() {
    expect(find.byKey(WidgetKeys.orderSuccess), findsOneWidget);
  }

  void verifyPoReference(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('PO reference'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyDeliveryInstruction(String text) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Delivery instructions'.tr(), text),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      tester
          .widget<Text>(
            find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel),
          )
          .data,
      contains(customerCode),
    );
  }

  void verifyDeliveryTo(String shipToCode) {
    expect(
      tester
          .widget<Text>(
            find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel),
          )
          .data,
      contains(shipToCode),
    );
  }

  void verifyOrderAddress(String address) {
    expect(
      tester
          .widget<RichText>(
            find.byKey(WidgetKeys.addressInfoSectionActionLabel),
          )
          .text
          .toPlainText(),
      contains(address),
    );
  }

  void verifyOrderSubmittedMessage() {
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage)).data,
      equals('Order submitted'.tr()),
    );
  }

  void verifyOrderDate() {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow(
          'Order Date'.tr(),
          DateTimeStringValue(DateTime.now().toIso8601String()).dateString,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderId() {
    expect(find.byKey(WidgetKeys.orderSuccessOrderId), findsOneWidget);
  }

  Future<void> verifyOrderSummarySection() => _scrollUntilVisible(
        find.byKey(WidgetKeys.orderSuccessOrderSummarySection),
      );

  Future<void> verifySubTotal(String price) => _scrollUntilVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyGrandTotal(String price) => _scrollUntilVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyOrderItemsSection() =>
      _scrollUntilVisible(find.byKey(WidgetKeys.orderSuccessItemsSection));

  Future<void> verifyOrderItemTotalQty(int qty) async {
    final label = find.byKey(WidgetKeys.orderSuccessItemTotalQty);
    await _scrollUntilVisible(label);
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  Future<void> verifyItem(int index) => _scrollUntilVisible(_item(index));

  void verifyItemMaterialNumber(int index, String materialNumber) {
    final label = find.descendant(
      of: _item(index),
      matching: find.byKey(WidgetKeys.commonTileItemLabel),
    );
    expect(tester.widget<Text>(label).data, equals(materialNumber));
  }

  void verifyItemMateriaDescription(int index, String text) {
    final label = find.descendant(
      of: _item(index),
      matching: find.byKey(WidgetKeys.commonTileItemTitle),
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyItemQty(int index, int qty) {
    final label = find.descendant(
      of: _item(index),
      matching: find.byKey(WidgetKeys.orderSuccessItemQty),
    );
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyItemUnitPrice(int index, String price) {
    final label = find.descendant(
      of: _item(index),
      matching: find.byKey(WidgetKeys.orderSuccessItemUnitPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyItemTotalPrice(int index, String price) {
    final label = find.descendant(
      of: _item(index),
      matching: find.byKey(WidgetKeys.orderSuccessItemTotalPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Finder _item(int index) => find.byKey(WidgetKeys.orderSuccessItem(index));

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> _scrollUntilVisible(Finder finder) async {
    await tester.dragUntilVisible(
      finder,
      find.byKey(WidgetKeys.scrollList),
      const Offset(0, -200),
    );
    expect(finder, findsOneWidget);
    await tester.pump();
  }
}
