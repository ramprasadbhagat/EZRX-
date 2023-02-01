import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String makeBoolYesNo(bool isReturnsAllowed) {
  return isReturnsAllowed ? 'Yes' : 'No';
}

Color getReturnsAllowedLabelColor(bool isReturnsAllowed) {
  return isReturnsAllowed ? ZPColors.lightSecondary : ZPColors.lightRed;
}

String zeroIfEmpty(String text) {
  return text.isEmpty ? '0' : text;
}

String displayDateOrEmpty(String text) {
  return text.isEmpty
      ? ''
      : DateFormat('dd MMM yyyy').format(DateTime.parse(text));
}
