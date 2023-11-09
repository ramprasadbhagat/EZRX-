import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getDeliveryDateString(DateTime deliveryDate) =>
      DateFormat(DateTimeFormatString.displayDateFormat).format(deliveryDate);

  static DateTime getNearestWorkingDate(DateTime time) {
    time = time.add(const Duration(days: 1));

    while (isWeekend(time)) {
      time = time.add(const Duration(days: 1));
    }

    return DateUtils.dateOnly(time);
  }

  static bool isWeekend(DateTime dateTime) =>
      dateTime.weekday >= DateTime.saturday;

  static String getDateTimeString(DateTime dateTime) =>
      DateFormat(DateTimeFormatString.displayDateTimeFormat).format(dateTime);
}
