import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'order_history_filter.freezed.dart';

@freezed
class OrderHistoryFilter with _$OrderHistoryFilter {
  const OrderHistoryFilter._();
  factory OrderHistoryFilter({
    required SearchKey orderId,
    required SearchKey poNumber,
    required SearchKey materialSearch,
    required SearchKey principalSearch,
    required DateTimeStringValue toDate,
    required DateTimeStringValue fromDate,
  }) = _OrderHistoryFilter;

  factory OrderHistoryFilter.empty() => OrderHistoryFilter(
        orderId: SearchKey.searchFilter(''),
        poNumber: SearchKey.searchFilter(''),
        materialSearch: SearchKey.searchFilter(''),
        principalSearch: SearchKey.searchFilter(''),
        fromDate: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 7)),
          ),
        ),
        toDate: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
      );
}
