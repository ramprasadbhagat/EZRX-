import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  bool isDateBetween(DateTime from, DateTime to) =>
      DateUtils.dateOnly(from).millisecondsSinceEpoch <=
          DateUtils.dateOnly(this).millisecondsSinceEpoch &&
      DateUtils.dateOnly(to).millisecondsSinceEpoch >=
          DateUtils.dateOnly(this).millisecondsSinceEpoch;
}

extension DoubleExt on double {
  String get priceFormatted =>
      NumberFormat('###,###,###,###,###.00').format(this);
}
