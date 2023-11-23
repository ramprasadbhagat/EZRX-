import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'view_by_item_filter.freezed.dart';

@freezed
class ViewByItemFilter with _$ViewByItemFilter {
  const ViewByItemFilter._();
  factory ViewByItemFilter({
    required DateTimeStringValue orderDateFrom,
    required DateTimeStringValue orderDateTo,
    required List<StatusType> orderStatusList,
  }) = _ViewByItemFilter;

  factory ViewByItemFilter.empty() => ViewByItemFilter(
        orderDateFrom: DateTimeStringValue(''),
        orderDateTo: DateTimeStringValue(''),
        orderStatusList: <StatusType>[],
      );

  DateTimeRange get getOrderDateFilterDateRange => DateTimeRange(
        start: orderDateFrom.dateTime,
        end: orderDateTo.dateTime,
      );

  bool isNotEqual({required ViewByItemFilter newFilter}) =>
      orderStatusList.length != newFilter.orderStatusList.length ||
      orderDateTo.apiDateTimeString !=
          newFilter.orderDateTo.apiDateTimeString ||
      orderDateFrom.apiDateTimeString !=
          newFilter.orderDateFrom.apiDateTimeString;

  int get appliedFilterCount {
    var filterCount = 0;
    if (orderDateFrom.isValid() && orderDateTo.isValid()) filterCount++;
    if (orderStatusList.isNotEmpty) filterCount++;

    return filterCount;
  }
}
