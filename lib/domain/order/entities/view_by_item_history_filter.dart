import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'view_by_item_history_filter.freezed.dart';

@freezed
class ViewByItemHistoryFilter with _$ViewByItemHistoryFilter {
  const ViewByItemHistoryFilter._();
  factory ViewByItemHistoryFilter({
    required DateTimeRange dateRange,
    required List<StatusType> orderStatusList,
  }) = _ViewByItemHistoryFilter;

  factory ViewByItemHistoryFilter.empty() => ViewByItemHistoryFilter(
        dateRange: DateTimeRange(
          end: DateTime.now(),
          start: DateTime.now().subtract(
            const Duration(days: 7),
          ),
        ),
        orderStatusList: <StatusType>[],
      );

  DateTimeStringValue get toDate =>
      DateTimeStringValue(dateRange.end.toIso8601String());

  DateTimeStringValue get fromDate =>
      DateTimeStringValue(dateRange.start.toIso8601String());

  bool isNotEqual({required ViewByItemHistoryFilter newFilter}) =>
      orderStatusList.length != newFilter.orderStatusList.length ||
      toDate.apiDateTimeFormat != newFilter.toDate.apiDateTimeFormat ||
      fromDate.apiDateTimeFormat != newFilter.fromDate.apiDateTimeFormat;

  int get appliedFilterCount {
    var count = 1;
    if (orderStatusList.isNotEmpty) {
      count += 1;
    }

    return count;
  }
}
