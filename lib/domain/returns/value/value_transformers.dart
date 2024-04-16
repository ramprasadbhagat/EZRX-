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

bool isUserOverride(String value) {
  return value == 'USEROVR';
}

bool isApproverOverride(String value) {
  return value == 'Approver';
}

String statusReason(String reason) =>
    reason.isNotEmpty ? reason : 'Updated at EZA';

bool _isReturnType(String returnType) =>
    returnType.isEmpty || returnType == '500';

String getReturnValue(String returnType) =>
    _isReturnType(returnType) ? 'Return' : 'Exchange';

String getQuantityHeading(String returnType) =>
    _isReturnType(returnType) ? 'Return quantity' : 'Exchange quantity';

String getQuantityHintText(String returnType) => _isReturnType(returnType)
    ? 'Enter return quantity'
    : 'Enter exchange quantity';

String getreturnTypeBottomASheetBodyText(String returnType) => _isReturnType(
      returnType,
    )
        ? 'After your request is approved, you will receive a credit note'
        : 'After your request is approved, you will receive a replacement item.';

bool getisCounterOfferElegible(String returnType) => returnType == '500';
