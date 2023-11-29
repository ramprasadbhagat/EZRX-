import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class ViewByOrdersDetailRobot {
  final WidgetTester tester;

  ViewByOrdersDetailRobot(this.tester);

  final scrollView = find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
  final buyAgainButton = find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

  void verifyPage() {
    expect(find.byType(ViewByOrderDetailsPage), findsOneWidget);
  }

  void verifyOrderIdVisible(String orderId) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.viewByOrderDetailOrderCode &&
            widget is Text &&
            (widget.data ?? '').contains(orderId),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderDateVisible() {
    expect(
      find.byKey(WidgetKeys.viewByOrderDetailOrderDate),
      findsOneWidget,
    );
  }

  void verifyPoReferenceVisible(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('PO reference'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyDeliveryInstructionsVisible(String text) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Delivery instructions'.tr(), text)),
      findsOneWidget,
    );
  }

  void verifyOrderAddressVisible(String address) {
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

  Future<void> dragToVerifySummaryVisible() async {
    await tester.dragUntilVisible(
      find.byType(OrderSummarySection),
      scrollView,
      const Offset(0.0, -200),
    );
  }

  void verifySubTotalVisible(String value) {
    final subTotalWidget = find.byKey(WidgetKeys.viewByOrderSubtotalKey);
    expect(subTotalWidget, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalWidget,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGrandTotalVisible(String value) {
    final subTotalWidget = find.byKey(WidgetKeys.viewByOrderGrandTotalKey);
    expect(subTotalWidget, findsOneWidget);
    expect(
      find.descendant(
        of: subTotalWidget,
        matching: find.text(value, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Future<void> dragToVerifyItemsSectionVisible() async {
    await tester.dragUntilVisible(
      find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
      scrollView,
      const Offset(0.0, -200),
    );
  }

  Future<void> verifyMaterialVisible(
    String materialNumber,
    int qty,
    String price,
  ) async {
    final productWidget =
        find.byKey(WidgetKeys.viewByOrderDetailItem(materialNumber, false));
    await tester.pumpUntilVisible(productWidget);
    expect(productWidget, findsOneWidget);
    expect(
      tester
          .widget<Text>(
            find.descendant(
              of: productWidget,
              matching: find.byKey(WidgetKeys.cartItemProductQty),
            ),
          )
          .data,
      contains(qty.toString()),
    );
    expect(
      find.descendant(
        of: find.descendant(
          of: productWidget,
          matching: find.byKey(WidgetKeys.cartItemProductTotalPrice),
        ),
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyBuyAgainButtonVisible() {
    expect(buyAgainButton, findsOneWidget);
  }

  Future<void> tapBuyAgainButton() async {
    await tester.tap(buyAgainButton);
    await tester.pumpUntilVisible(find.byKey(WidgetKeys.cartPage));
  }
}
