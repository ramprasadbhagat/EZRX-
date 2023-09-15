import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ViewByItemsRobot {
  final WidgetTester tester;

  ViewByItemsRobot(this.tester);

  final orderGroups = find.byKey(WidgetKeys.viewByItemsOrderGroupKey);
  final orderItems = find.byKey(WidgetKeys.viewByItemsOrderItemKey);

  void verifyOrdersVisible() {
    verifyOrderGroupsVisible();
    verifyOrderItemsVisible();
  }

  void verifyOrderGroupsVisible() {
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

  void verifyOrderItemsVisible() {
    expect(orderItems, findsAtLeastNWidgets(1));
    final itemCount = orderItems.evaluate().length;
    // Verify product name
    expect(
      find.descendant(
        of: orderItems,
        matching: find.byKey(WidgetKeys.commonTileItemTitle),
      ),
      findsNWidgets(itemCount),
    );
    // Verify product code
    expect(
      find.descendant(
        of: orderItems,
        matching: find.byKey(WidgetKeys.commonTileItemLabel),
      ),
      findsNWidgets(itemCount),
    );
    // Verify product image
    expect(
      find.descendant(of: orderItems, matching: find.byType(ProductImage)),
      findsNWidgets(itemCount),
    );
    // Verify order status
    expect(
      find.descendant(
        of: orderItems,
        matching: find.byKey(WidgetKeys.orderItemStatusKey),
      ),
      findsNWidgets(itemCount),
    );
    // Verify qty
    expect(
      find.descendant(
        of: orderItems,
        matching: find.byKey(WidgetKeys.commonTileItemQty),
      ),
      findsNWidgets(itemCount),
    );
    // Verify orderID
    expect(
      find.descendant(
        of: orderItems,
        matching: find.byKey(WidgetKeys.commonTileItemHeader),
      ),
      findsNWidgets(itemCount),
    );
  }

  void verifyBonusLabelVisible() {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byKey(WidgetKeys.commonTileItemStatusLabel),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyOrdersWithProductNameVisible(String searchKey) {
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

  void verifyOrdersWithProductCodeVisible(String searchKey) {
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

  void verifyOrdersWithOrderCodeVisible(String searchKey) {
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

  void verifyNoRecordFoundVisible() {
    expect(orderGroups, findsNothing);
    expect(orderItems, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text('No past orders to show'.tr()), findsOneWidget);
    expect(
      find.text('Items ordered on eZRx+ will be shown here'.tr()),
      findsOneWidget,
    );
    expect(find.byKey(WidgetKeys.startBrowsingViewByItem), findsOneWidget);
  }

  Future<void> pullToRefresh() async {
    await tester.drag(find.byKey(WidgetKeys.scrollList), const Offset(0, 500));
    await tester.pumpAndSettle();
  }

  void verifyOrderGroupInDateRangeVisible({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyOrderGroupsVisible();
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

  void verifyOrderWithStatusVisible(List<String> statuses) {
    verifyOrderItemsVisible();
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

  Future<void> tapFirstVisibleOrder() async {
    await tester.tap(orderItems.first);
    await tester.pumpAndSettle();
  }
}

extension DateTimeExt on DateTime {
  bool isDateBetween(DateTime from, DateTime to) =>
      DateUtils.dateOnly(from).millisecondsSinceEpoch <=
          DateUtils.dateOnly(this).millisecondsSinceEpoch &&
      DateUtils.dateOnly(to).millisecondsSinceEpoch >=
          DateUtils.dateOnly(this).millisecondsSinceEpoch;
}
