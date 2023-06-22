import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

String makeBoolYesNo(bool isReturnsAllowed) {
  return isReturnsAllowed ? 'Yes' : 'No';
}

Color getReturnsAllowedLabelColor(bool isReturnsAllowed) {
  return isReturnsAllowed ? ZPColors.lightSecondary : ZPColors.lightRed;
}

String zeroIfEmpty(String text) {
  return text.isEmpty ? '0' : text;
}

double refundTotalStringAsFixed(String value) {
  return double.tryParse(value) ?? 0;
}

String filterLabel(String sort) {
  switch (sort) {
    case 'COMPLETED':
      return 'Completed';
    case 'ALL':
      return 'All';

    default:
      return 'Pending Review';
  }
}

String covertSortToApiDateString(String value) =>
    value.isNotEmpty && value != 'ALL' ? value : '';
