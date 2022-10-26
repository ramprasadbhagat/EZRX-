import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_filter.freezed.dart';

@freezed
class OrderHistoryFilter with _$OrderHistoryFilter {
  const OrderHistoryFilter._();
  factory OrderHistoryFilter({
    required String orderId,
    required String poNumber,
    required MaterialNumber materialSearch,
    required String principalSearch,
    required DateTime toDate,
    required DateTime fromDate,
  }) = _OrderHistoryFilter;

  factory OrderHistoryFilter.empty() => OrderHistoryFilter(
        orderId: '',
        poNumber: '',
        materialSearch: MaterialNumber(''),
        principalSearch: '',
        fromDate:DateTime.now().subtract(const Duration(days: 7)),
        toDate: DateTime.now(),
      );
}
