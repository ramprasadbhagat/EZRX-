import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history.freezed.dart';

@freezed
class OrderHistory with _$OrderHistory {
  const OrderHistory._();
  factory OrderHistory({
    required OrderHistoryBasicInfo orderBasicInformation,
    required List<OrderHistoryItem> orderHistoryItems,
  }) = _OrderHistory;

  factory OrderHistory.empty() => OrderHistory(
        orderBasicInformation: OrderHistoryBasicInfo.empty(),
        orderHistoryItems: <OrderHistoryItem>[],
      );
  bool get isOthersOrderItemsSectionVisible => orderHistoryItems.isNotEmpty;
}
