import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ViewByOrdersDetailRobot {
  final WidgetTester tester;

  ViewByOrdersDetailRobot(this.tester);

  final scrollView = find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
  final buyAgainButton = find.byKey(WidgetKeys.viewByOrderDetailBuyAgain);

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
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Subtotal (excl. tax)'.tr(), value)),
      findsOneWidget,
    );
  }

  void verifyGrandTotalVisible(String value) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Grand total'.tr(), value)),
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

  void verifyMaterialVisible(String materialNumber, int qty, String price) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemTitle &&
            widget is Text &&
            widget.data!.contains(materialNumber),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyBuyAgainButtonVisible() {
    expect(buyAgainButton, findsOneWidget);
  }

  Future<void> tapBuyAgainButton() async {
    await tester.tap(buyAgainButton);
    await tester.pumpAndSettle();
  }
}
