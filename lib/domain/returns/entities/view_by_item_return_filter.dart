import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'view_by_item_return_filter.freezed.dart';

@freezed
class ViewByItemReturnFilter with _$ViewByItemReturnFilter {
  const ViewByItemReturnFilter._();
  factory ViewByItemReturnFilter({
    required DateTimeStringValue returnDateFrom,
    required DateTimeStringValue returnDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<StatusType> returnStatusList,
  }) = _ViewByItemReturnFilter;

  factory ViewByItemReturnFilter.empty() => ViewByItemReturnFilter(
        returnDateFrom: DateTimeStringValue(''),
        returnDateTo: DateTimeStringValue(''),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        returnStatusList: <StatusType>[],
      );

  DateTimeRange get getReturnDateFilterDateRange => DateTimeRange(
        start: returnDateFrom.dateTimeByDateString,
        end: returnDateTo.dateTimeByDateString,
      );

  bool get isReturnAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  int get appliedFilterCount {
    var count = 0;
    if (returnDateFrom.isNotEmpty && returnDateTo.isNotEmpty) {
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
