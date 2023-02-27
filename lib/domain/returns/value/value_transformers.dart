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

String getReturnSummaryStatus(String status) {
  switch (status) {
    case 'PENDING':
      return 'Pending Approval';
    case 'APPROVED':
    case 'FAILED':
      return 'Approved for Return';
    case 'REJECTED':
      return 'Rejected';
    default:
      return 'Return Completed';
  }
}

String getReturnSummaryStatusInList(String statusType) {
  switch (statusType) {
    case 'PENDING':
      return 'Active';
    case 'APPROVED':
    case 'FAILED':
    case 'REJECTED':
      return 'Completed';

    default:
      return statusType;
  }
}

Color getStatusLabelColor(String statusType) {
  switch (statusType) {
    case 'PENDING':
      return ZPColors.lightRed;
    case 'APPROVED':
    case 'FAILED':
      return ZPColors.lightSecondary;
    case 'REJECTED':
      return ZPColors.darkGray;

    default:
      return ZPColors.defaultReturnSummaryStatusColor;
  }
}

Color getStatusTextColor(String statusType) {
  switch (statusType) {
    case 'PENDING':
    case 'APPROVED':
    case 'FAILED':
      return ZPColors.returnSummaryStatusTextColor;
    case 'REJECTED':
      return ZPColors.darkGray;

    default:
      return ZPColors.white;
  }
}

DateTime getDateTimebyDateString(String value) {
  return DateTime.tryParse(value) ?? DateTime.now();
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

