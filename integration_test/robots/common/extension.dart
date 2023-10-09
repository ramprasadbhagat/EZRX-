import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final _priceFormatter = NumberFormat('###,###,###,###,###.00');

extension DateTimeExt on DateTime {
  bool isDateBetween(DateTime from, DateTime to) =>
      DateUtils.dateOnly(from).millisecondsSinceEpoch <=
          DateUtils.dateOnly(this).millisecondsSinceEpoch &&
      DateUtils.dateOnly(to).millisecondsSinceEpoch >=
          DateUtils.dateOnly(this).millisecondsSinceEpoch;
}

extension NumExt on num {
  String get priceFormatted => _priceFormatter.format(this);
}

extension StringExt on String {
  double get priceValue {
    try {
      return _priceFormatter.parse(this).toDouble();
    } catch (_) {
      return 0;
    }
  }
}
