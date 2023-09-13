import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'return_filter.freezed.dart';

@freezed
class ReturnFilter with _$ReturnFilter {
  const ReturnFilter._();
  factory ReturnFilter({
    required DateTimeStringValue returnDateFrom,
    required DateTimeStringValue returnDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<StatusType> returnStatusList,
  }) = _ReturnFilter;

  factory ReturnFilter.empty() => ReturnFilter(
        returnDateFrom: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(
              const Duration(days: 30),
            ),
          ),
        ),
        returnDateTo: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now(),
          ),
        ),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        returnStatusList: <StatusType>[],
      );

  DateTimeRange get getReturnDateFilterDateRange => DateTimeRange(
        start: returnDateFrom.dateTime,
        end: returnDateTo.dateTime,
      );

  bool get isReturnAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  int get appliedFilterCount {
    var count = 0;
    if (returnDateFrom.isValid() && returnDateTo.isValid()) {
      count += 1;
    }
    if (returnStatusList.isNotEmpty) {
      count += 1;
    }
    if (amountValueFrom != RangeValue('') && amountValueTo != RangeValue('')) {
      count += 1;
    }

    return count;
  }
}
