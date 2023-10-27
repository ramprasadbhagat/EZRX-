import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:flutter/material.dart';

final _priceFormatter = StringUtils.priceFormatter;

extension DateTimeExt on DateTime {
  bool isDateBetween(DateTime from, DateTime to) =>
      DateUtils.dateOnly(from).millisecondsSinceEpoch <=
          DateUtils.dateOnly(this).millisecondsSinceEpoch &&
      DateUtils.dateOnly(to).millisecondsSinceEpoch >=
          DateUtils.dateOnly(this).millisecondsSinceEpoch;
  String get displayDate => DateTimeStringValue(toIso8601String()).dateString;
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
