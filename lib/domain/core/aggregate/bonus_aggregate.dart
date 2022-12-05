import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bonus_aggregate.freezed.dart';

@freezed
class OrderHistoryDetailsBonusAggregate
    with _$OrderHistoryDetailsBonusAggregate {
  const OrderHistoryDetailsBonusAggregate._();

  factory OrderHistoryDetailsBonusAggregate({
    required OrderHistoryDetailsOrderItem orderItem,
    required List<OrderHistoryDetailsOrderItemDetails> details,
    required OrderHistoryDetailsOrderItemTenderContractDetails
        tenderContractDetails,
    required List<OrderHistoryDetailsOrderItem> bonusList,
  }) = _OrderHistoryDetailsOrderItem;

  factory OrderHistoryDetailsBonusAggregate.empty() =>
      OrderHistoryDetailsBonusAggregate(
        orderItem: OrderHistoryDetailsOrderItem.empty(),
        details: <OrderHistoryDetailsOrderItemDetails>[],
        tenderContractDetails:
            OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        bonusList: <OrderHistoryDetailsOrderItem>[],
      );
}
