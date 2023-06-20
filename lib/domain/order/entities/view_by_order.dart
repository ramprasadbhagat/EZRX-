import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order.freezed.dart';

@freezed
class ViewByOrderHistory with _$ViewByOrderHistory {
  const ViewByOrderHistory._();
  factory ViewByOrderHistory({
    required int orderCount,
    required List<String> creatingOrderIds,
    required List<OrderHistoryDetailsOrderHeader> orderHeaders,
  }) = _ViewByOrderHistory;

  factory ViewByOrderHistory.empty() => ViewByOrderHistory(
        creatingOrderIds: [],
        orderCount: 0,
        orderHeaders: <OrderHistoryDetailsOrderHeader>[],
      );
}
