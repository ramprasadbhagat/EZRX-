import 'package:easy_localization/easy_localization.dart';
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

String getFileSizeString(int sizeInBytes) {
  final df = NumberFormat('0.00');

  const sizeKb = 1024.0;
  const sizeMb = sizeKb * sizeKb;
  const sizeGb = sizeMb * sizeKb;
  const sizeTerra = sizeGb * sizeKb;

  if (sizeInBytes < sizeMb) {
    return '${df.format(sizeInBytes / sizeKb)} Kb';
  } else if (sizeInBytes < sizeGb) {
    return '${df.format(sizeInBytes / sizeMb)} Mb';
  } else if (sizeInBytes < sizeTerra) {
    return '${df.format(sizeInBytes / sizeGb)} Gb';
  }

  return '';
}
