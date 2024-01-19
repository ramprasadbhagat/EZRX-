import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class OrderSuccessRobot extends CommonRobot {
  OrderSuccessRobot(WidgetTester tester) : super(tester);

  late Finder _verifyingItem;

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

  Future<void> verifyOrderSummarySection() => scrollEnsureFinderVisible(
        find.byKey(WidgetKeys.orderSuccessOrderSummarySection),
      );

  Future<void> verifySubTotal(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyGrandTotal(String price) => scrollEnsureFinderVisible(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.text(price, findRichText: true),
        ),
      );

  Future<void> verifyOrderItemTotalQty(int qty) async {
    final label = find.byKey(WidgetKeys.orderSuccessItemTotalQty);
    await scrollEnsureFinderVisible(label);
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  Future<void> startVerifyMaterial({required int index}) async {
    final materialSection = find.byKey(WidgetKeys.orderSuccessItemsSection);
    await scrollEnsureFinderVisible(materialSection);
    await tester.pumpUntilVisible(_material(index));
    await scrollEnsureFinderVisible(_material(index));
    _verifyingItem = _material(index);
  }

  void verifyMaterialNumber(String materialNumber) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.commonTileItemLabel),
    );
    expect(tester.widget<Text>(label).data, equals(materialNumber));
  }

  void verifyMateriaDescription(String text) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.commonTileItemTitle),
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyItemQty(int qty) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemProductQty),
    );
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyMaterialUnitPrice(String price, {bool isFree = false}) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.orderSuccessItemUnitPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(isFree ? 'FREE'.tr() : price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String price, {bool isFree = false}) {
    final label = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.orderSuccessItemTotalPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(isFree ? 'FREE'.tr() : price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialOnOfferTag() {
    expect(
      find.descendant(
        of: _verifyingItem,
        matching: find.byKey(WidgetKeys.offerTag),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialBonusTag() {
    expect(
      find.descendant(
        of: find.descendant(
          of: _verifyingItem,
          matching: find.byKey(WidgetKeys.commonTileItemStatusLabel),
        ),
        matching: find.text('Bonus'.tr()),
      ),
      findsOneWidget,
    );
  }

  Finder _material(int index) =>
      find.byKey(WidgetKeys.orderSuccessMaterialItem(index));

  Future<void> startVerifyBundle(String bundleNumber) async {
    await scrollEnsureFinderVisible(_bundle(bundleNumber));
    _verifyingItem = _bundle(bundleNumber);
  }

  void verifyBundleRate(int qty, String rate) {
    final rateWidget = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemBundleRate),
    );
    expect(
      find.descendant(
        of: rateWidget,
        matching: find.textContaining(qty.toString()),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: rateWidget,
        matching: find.textContaining(rate, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleTotalPrice(String price) {
    final priceWidget = find.descendant(
      of: _verifyingItem,
      matching: find.byKey(WidgetKeys.cartItemBundleTotalPrice),
    );
    expect(
      find.descendant(
        of: priceWidget,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyBundleTotalQty(int qty) {
    final widget = tester.widget<Text>(
      find.descendant(
        of: _verifyingItem,
        matching: find.byKey(WidgetKeys.cartItemBundleQty),
      ),
    );
    expect(widget.data, contains(qty.toString()));
  }

  Future<void> startVerifyBundleItem(
    String bundleNumber,
    String materialNumber,
  ) async {
    final item = find.descendant(
      of: _bundle(bundleNumber),
      matching:
          find.byKey(WidgetKeys.orderHistoryBundleItemMaterial(materialNumber)),
    );
    await tester.pumpUntilVisible(item);
    await scrollEnsureFinderVisible(item);
    _verifyingItem = item;
  }

  Finder _bundle(String bundleNumber) =>
      find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }
}
