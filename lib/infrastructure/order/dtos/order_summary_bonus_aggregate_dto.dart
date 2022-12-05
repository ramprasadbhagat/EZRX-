import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_details_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_tender_contract_details_dto.dart';

class OrderSummaryBonusAggregateDto {
  OrderSummaryBonusAggregateDto({
    required this.orderItem,
    required this.details,
    required this.tenderContractDetails,
    required this.bonusList,
  });

  OrderHistoryDetailsOrderItemDto orderItem;
  List<OrderHistoryDetailsOrderItemDetailsDto> details;
  OrderHistoryDetailsOrderItemTenderContractDetailsDto tenderContractDetails;
  List<OrderHistoryDetailsOrderItemDto> bonusList;

  factory OrderSummaryBonusAggregateDto.fromDomain(
    OrderHistoryDetailsBonusAggregate bonus,
  ) {
    return OrderSummaryBonusAggregateDto(
      orderItem: OrderHistoryDetailsOrderItemDto.fromDomain(bonus.orderItem),
      details: List.from(
        bonus.details,
      )
          .map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromDomain(e))
          .toList(),
      tenderContractDetails:
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(
              bonus.orderItem.tenderContractDetails,),
      bonusList: List.from(
        bonus.bonusList,
      )
          .map(
            (e) => OrderHistoryDetailsOrderItemDto.fromDomain(
              e,
            ),
          )
          .toList(),
    );
  }

  OrderHistoryDetailsBonusAggregate toDomain() {
    return OrderHistoryDetailsBonusAggregate(
      orderItem: orderItem.toDomain(),
      details: details.map((e) => e.toDomain()).toList(),
      tenderContractDetails: tenderContractDetails.toDomain(),
      bonusList: bonusList.map((e) => e.toDomain()).toList(),
    );
  }
}
