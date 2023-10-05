import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_filter.freezed.dart';

@freezed
class ViewByOrdersFilter with _$ViewByOrdersFilter {
  const ViewByOrdersFilter._();
  factory ViewByOrdersFilter({
    required DateTimeStringValue orderDateFrom,
    required DateTimeStringValue orderDateTo,
  }) = _ViewByOrderHistoryFilter;

  factory ViewByOrdersFilter.empty() => ViewByOrdersFilter(
        orderDateFrom: DateTimeStringValue(''),
        orderDateTo: DateTimeStringValue(''),
      );

  DateTimeRange get getOrderDateFilterDateRange => DateTimeRange(
        start: orderDateFrom.dateTime,
        end: orderDateTo.dateTime,
      );

  //TODO: this is the number which will be displayed on top of tune icon, for view_by_order,
  //there will be only date range filter always applied.
  //In future, if there is more filter we can modify here.
  int get appliedFilterCount {
    return 1;
  }
}
