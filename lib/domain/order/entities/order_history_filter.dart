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
    required DateTime toDate,
    required DateTime fromDate,
  }) = _OrderHistoryFilter;

  factory OrderHistoryFilter.empty() => OrderHistoryFilter(
        orderId: SearchKey.orderHistoryFilter(''),
        poNumber: SearchKey.orderHistoryFilter(''),
        materialSearch: SearchKey.orderHistoryFilter(''),
        principalSearch: SearchKey.orderHistoryFilter(''),
        fromDate:DateTime.now().subtract(const Duration(days: 7)),
        toDate: DateTime.now(),
      );
}
