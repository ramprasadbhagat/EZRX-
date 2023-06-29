import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_history_filter.freezed.dart';

@freezed
class ViewByOrderHistoryFilter with _$ViewByOrderHistoryFilter {
  const ViewByOrderHistoryFilter._();
  factory ViewByOrderHistoryFilter({
    required DateTimeRange dateRange,
  }) = _ViewByOrderHistoryFilter;

  factory ViewByOrderHistoryFilter.empty() => ViewByOrderHistoryFilter(
        dateRange: DateTimeRange(
          end: DateTime.now(),
          start: DateTime.now().subtract(
            const Duration(days: 7),
          ),
        ),
      );
  DateTimeStringValue get toDate =>
      DateTimeStringValue(dateRange.end.toIso8601String());

  DateTimeStringValue get fromDate =>
      DateTimeStringValue(dateRange.start.toIso8601String());
}
