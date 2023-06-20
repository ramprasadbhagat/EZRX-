import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'view_by_order_history_filter.freezed.dart';

@freezed
class ViewByOrderHistoryFilter with _$ViewByOrderHistoryFilter {
  const ViewByOrderHistoryFilter._();
  factory ViewByOrderHistoryFilter({
    required DateTimeStringValue toDate,
    required DateTimeStringValue fromDate,
  }) = _ViewByOrderHistoryFilter;

  factory ViewByOrderHistoryFilter.empty() => ViewByOrderHistoryFilter(
        fromDate: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 28)),
          ),
        ),
        toDate: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
      );
}
