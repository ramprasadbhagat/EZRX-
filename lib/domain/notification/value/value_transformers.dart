import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

IconData notificationIcon(
  String title,
) {
  final iconMap = {
    'Order created': Icons.receipt_long_outlined,
    'Return request created': Icons.electric_rickshaw,
    'Return request failed': Icons.close,
    'Payment advice deleted': Icons.close,
    'Return request reviewed': Icons.electric_rickshaw,
    'Payment Advice created': Icons.account_balance_wallet_outlined,
    'Reminder: Payment advice expiring': Icons.error,
    'Alert': Icons.push_pin_outlined,
  };

  return iconMap[title] ?? Icons.receipt_long_outlined;
}

Color getIconBGColor(
  String title,
) {
  final accentColor = {
    'Order created': ZPColors.accentColor,
    'Return request created': ZPColors.accentColor,
    'Payment Advice created': ZPColors.accentColor,
    'Alert': ZPColors.accentColor,
  };
  final lightRed = {
    'Return request failed': ZPColors.lightRed,
    'Payment advice deleted': ZPColors.lightRed,
    'Reminder: Payment advice expiring': ZPColors.lightRed,
  };

  final titleMap = {
    ...accentColor,
    ...lightRed,
    'Return request reviewed': ZPColors.lightSecondary,
  };

  return titleMap[title] ?? ZPColors.accentColor;
}

Color getIconColor(
  String title,
) {
  final primary = {
    'Order created': ZPColors.primary,
    'Return request created': ZPColors.primary,
    'Payment advice created': ZPColors.primary,
    'Alert': ZPColors.primary,
  };
  final red = {
    'Return request failed': ZPColors.red,
    'Payment advice deleted': ZPColors.red,
    'Reminder: Payment advice expiring': ZPColors.red,
  };

  final titleMap = {
    ...primary,
    ...red,
    'Return request reviewed': ZPColors.lightGreen,
  };

  return titleMap[title] ?? ZPColors.primary;
}

bool checkReturn(String val) =>
    val == 'ReturnRequestReminder' ||
    val == 'ReturnRequestCreatedForApprover' ||
    val == 'ReturnRequestCreated';

bool checkOrder(String val) => val == 'OrderCreated';

bool checkPayment(String val) => val == 'PaymentAdviceCreated';

bool checkAnnouncement(String val) => val == 'AnnouncementBanner';
