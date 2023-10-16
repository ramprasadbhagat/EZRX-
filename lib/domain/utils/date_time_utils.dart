import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getDeliveryDateString(DateTime deliveryDate) =>
      DateFormat(DateTimeFormatString.displayDateFormat).format(deliveryDate);

  static String getNearestDeliveryDateString(DateTime dateTime) =>
      getDeliveryDateString(
        getNearestWorkingDate(dateTime),
      );

  static bool isWeekend(DateTime dateTime) =>
      dateTime.weekday >= DateTime.saturday;

  static DateTime getNearestWorkingDate(DateTime value) {
    if (value.hour >= 15 || isWeekend(value)) {
      // If it's after 3 PM or a weekend, move to the next day.
      value = value.add(const Duration(days: 1));
    }
    while (isWeekend(value.add(const Duration(days: 1)))) {
      // Keep moving to the next day until it's a working day.
      value = value.add(const Duration(days: 1));
    }

    return value.add(const Duration(days: 1));
  }
}
