import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_items_tender_contract_details_dto.freezed.dart';
part 'order_history_details_order_items_tender_contract_details_dto.g.dart';

@freezed
class OrderHistoryDetailsOrderItemTenderContractDetailsDto
    with _$OrderHistoryDetailsOrderItemTenderContractDetailsDto {
  const OrderHistoryDetailsOrderItemTenderContractDetailsDto._();
  const factory OrderHistoryDetailsOrderItemTenderContractDetailsDto({
    @JsonKey(name: 'ContractNumber', defaultValue: '')
        required String tenderContractNumber,
    @JsonKey(name: 'ContractReference', defaultValue: '')
        required String tenderContractReference,
  }) = _OrderHistoryDetailsOrderItemTenderContractDetailsDto;
  factory OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(
    OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails,
  ) {
    return OrderHistoryDetailsOrderItemTenderContractDetailsDto(
      tenderContractNumber: tenderContractDetails.tenderContractNumber,
      tenderContractReference: tenderContractDetails.tenderContractReference,
    );
  }

  OrderHistoryDetailsOrderItemTenderContractDetails toDomain() {
    return OrderHistoryDetailsOrderItemTenderContractDetails(
      tenderContractNumber: tenderContractNumber,
      tenderContractReference: tenderContractReference,
    );
  }

  factory OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoFromJson(json);
}
