import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extensions.dart';

class ViewByOrdersRobot {
  final WidgetTester tester;

  ViewByOrdersRobot(this.tester);

  final orderGroups = find.byKey(WidgetKeys.viewByOrdersGroupKey);
  final orderItems = find.byKey(WidgetKeys.viewByOrdersItemKey);
  final buyAgainButton = find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);
  final orderCodeLabel = find.byKey(WidgetKeys.viewByOrdersCodeLabelKey);
  final orderQtyLabel = find.byKey(WidgetKeys.viewByOrdersQtyLabelKey);

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
    expect(
      find.descendant(of: orderItems, matching: orderCodeLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: orderQtyLabel),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: orderItems, matching: buyAgainButton),
      findsNWidgets(itemCount),
    );
  }

  void verifyNoRecordFoundVisible() {
    expect(orderGroups, findsNothing);
    expect(orderItems, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text('No orders found'.tr()), findsOneWidget);
    expect(
      find.text(
        'Try adjusting your search or filter selection to find what you’re looking for.'
            .tr(),
      ),
      findsOneWidget,
    );
  }

  Future<void> pullToRefresh() async {
    await tester.drag(find.byKey(WidgetKeys.scrollList), const Offset(0, 500));
    await tester.pumpAndSettle();
  }

  void verifyOrdersWithOrderCodeVisible(String searchKey) {
    expect(orderItems, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.viewByOrdersCodeLabelKey &&
            widget.data!.contains(searchKey),
      ),
      findsNWidgets(orderItems.evaluate().length),
    );
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

  String getOrderIdText({required int index}) =>
      tester.widget<Text>(orderCodeLabel.at(index)).data ?? '';

  void verifyOrderIdTextVisible(String text, {required int index}) {
    expect(tester.widget<Text>(orderCodeLabel.at(index)).data, text);
  }

  void verifyOrderIdTextNotVisible(String text, {required int index}) {
    expect(
      orderCodeLabel.evaluate().length - 1 < index ||
          tester.widget<Text>(orderCodeLabel.at(index)).data != text,
      true,
    );
  }

  Future<void> tapFirstOrder() async {
    await tester.tap(orderCodeLabel.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstBuyAgainButton() async {
    await tester.tap(buyAgainButton.first);
    await tester.pumpAndSettle();
  }
}
