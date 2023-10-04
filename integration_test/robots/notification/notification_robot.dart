import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/notification/notification_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class NotificationRobot extends CommonRobot {
  NotificationRobot(WidgetTester tester) : super(tester);

  final deleteButton = find.byKey(WidgetKeys.notificationDeleteButton);
  final items = find.byKey(WidgetKeys.notificationItem);
  final itemDescription = find.byKey(WidgetKeys.notificationItemDescription);
  final itemIcon = find.byKey(WidgetKeys.notificationItemIcon);
  final itemTitle = find.byKey(WidgetKeys.notificationItemTitle);
  final itemCreatedAt = find.byKey(WidgetKeys.notificationItemCreatedAt);
  final itemDifferenceTime =
      find.byKey(WidgetKeys.notificationItemDifferenceTime);

  bool checkIfNotificationListEmpty() => items.evaluate().isEmpty;

  void verifyPage() {
    expect(find.byType(NotificationTab), findsOneWidget);
  }

  void verifyScrollList() {
    expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
  }

  void verifyNoRecordFound() {
    expect(
      find.byKey(WidgetKeys.notificationNotFoundRecordKey),
      findsOneWidget,
    );
    expect(find.text('No notifications to show'), findsOneWidget);
    expect(
      find.text('We\'ll notify you when there is something'),
      findsOneWidget,
    );
  }

  void verifyDeleteButton() {
    expect(deleteButton, findsOneWidget);
  }

  void verifyNotificationItems() {
    final itemCount = items.evaluate().length;
    expect(items, findsAtLeastNWidgets(1));
    expect(
      find.descendant(of: items, matching: itemCreatedAt),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: itemDifferenceTime),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: itemIcon),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: itemTitle),
      findsNWidgets(itemCount),
    );
    expect(
      find.descendant(of: items, matching: itemDescription),
      findsNWidgets(itemCount),
    );
  }

  String getNotificationDescription(int index) {
    return tester.widget<Text>(itemDescription.at(index)).data ?? '';
  }

  void verifyNotificationWithDescription(int index, String descriptionText) {
    expect(
      tester.widget<Text>(itemDescription.at(index)).data,
      descriptionText,
    );
  }

  Future<void> tapNotificationItem(int index) async {
    await tester.tap(items.at(index));
    await tester.pumpAndSettle();
  }

  void verifyRedirectNotAvailableMessage() {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.customSnackBar),
        matching: find.text("You don't have access".tr()),
      ),
      findsOneWidget,
    );
  }
}
