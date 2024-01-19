import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class ViewByItemsRobot {
  final WidgetTester tester;

  ViewByItemsRobot(this.tester);

  final orderGroups = find.byKey(WidgetKeys.viewByItemsOrderGroupKey);
  final orderItems = find.byKey(WidgetKeys.viewByItemsOrderItemKey);
  final orderId = find.byKey(WidgetKeys.commonTileItemHeader);
  final productName = find.byKey(WidgetKeys.commonTileItemTitle);
  final productId = find.byKey(WidgetKeys.commonTileItemLabel);
  final productQty = find.byKey(WidgetKeys.commonTileItemQty);
  final orderStatus = find.byKey(WidgetKeys.orderItemStatusKey);
  final bonusLabel = find.byKey(WidgetKeys.commonTileItemStatusLabel);
  final offerTag = find.byKey(WidgetKeys.offerTag);

  void verifyOrders() {
    verifyOrderGroups();
    verifyOrderItems();
  }

  void verifyOrderGroups() {
    expect(orderGroups, findsAtLeastNWidgets(1));
    final groupCount = orderGroups.evaluate().length;
    expect(
      find.descendant(
        of: orderGroups,
        matching: find.textContaining('Ordered on'.tr()),
      ),
      findsNWidgets(groupCount),
    );
  }

  void verifyOrderItems() {
    expect(orderItems, findsAtLeastNWidgets(1));
    final itemCount = orderItems.evaluate().length;
    // Verify product name
    expect(
      find.descendant(of: orderItems, matching: productName),
      findsNWidgets(itemCount),
    );
    // Verify product code
    expect(
      find.descendant(of: orderItems, matching: productId),
      findsNWidgets(itemCount),
    );
    // Verify product image
    expect(
      find.descendant(of: orderItems, matching: find.byType(ProductImage)),
      findsNWidgets(itemCount),
    );
    // Verify order status
    expect(
      find.descendant(of: orderItems, matching: orderStatus),
      findsNWidgets(itemCount),
    );
    // Verify qty
    expect(
      find.descendant(of: orderItems, matching: productQty),
      findsNWidgets(itemCount),
    );
    // Verify orderID
    expect(
      find.descendant(of: orderItems, matching: orderId),
      findsNWidgets(itemCount),
    );
  }

  void verifyBonusLabel() {
    expect(bonusLabel, findsAtLeastNWidgets(1));
  }

  Future<void> tapFirstBonusLabel() async {
    await tester.tap(bonusLabel.first);
    await tester.pumpAndSettle();
  }

  void verifyOfferTag() {
    expect(offerTag, findsAtLeastNWidgets(1));
  }

  Future<void> tapFirstOfferTag() async {
    await tester.tap(offerTag.first);
    await tester.pumpAndSettle();
  }

  void verifyOrdersWithProductName(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemTitle &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyOrdersWithProductCode(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemLabel &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyOrdersWithOrderCode(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.commonTileItemHeader &&
            (widget.data ?? '').contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyNoRecordFound() {
    expect(orderGroups, findsNothing);
    expect(orderItems, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text('No orders found'.tr()), findsOneWidget);
    expect(
      find.textContaining(
        'Try adjusting your search or filter selection to find what you’re looking for'
            .tr(),
      ),
      findsOneWidget,
    );
    expect(find.byKey(WidgetKeys.startBrowsingViewByItem), findsOneWidget);
  }

  void verifyOrderGroupInDateRange({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyOrderGroups();
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: orderGroups,
            matching: find.textContaining('Ordered on'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Ordered on'.tr()} ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyOrderWithStatus(List<String> statuses) {
    verifyOrderItems();
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: find.byKey(WidgetKeys.orderItemStatusKey),
            matching: find.byType(Text),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(statuses.contains(text), true);
    }
  }

  String getFirstOrderId() =>
      _getText(orderId.first).split('${'Order'.tr()} #')[1];

  String getFirstProductName() => _getText(productName.first);

  String getFirstProductId() => _getText(productId.first);

  String _getText(Finder finder) => tester.widget<Text>(finder).data ?? '';

  Future<void> tapFirstOrder() async {
    await tester.tap(orderItems.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstOrderWithMaterial(String materialNumber) async {
    await tester.tap(
      find
          .byWidgetPredicate(
            (widget) =>
                widget.key == WidgetKeys.commonTileItemLabel &&
                widget is Text &&
                (widget.data ?? '').contains(materialNumber),
          )
          .first,
    );
    await tester.pumpAndSettle();
  }
}
