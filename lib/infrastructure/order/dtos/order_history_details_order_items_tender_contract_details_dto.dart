import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_items_tender_contract_details_dto.freezed.dart';
part 'order_history_details_order_items_tender_contract_details_dto.g.dart';
@freezed
class OrderHistoryDetailsOrderItemTenderContractDetailsDto with _$OrderHistoryDetailsOrderItemTenderContractDetailsDto {
  const OrderHistoryDetailsOrderItemTenderContractDetailsDto._();
  const factory OrderHistoryDetailsOrderItemTenderContractDetailsDto({
    @JsonKey(name: 'TenderContractNumber',defaultValue: '') required String tenderContractNumber,
    @JsonKey(name: 'TenderContractReference',defaultValue: '') required String tenderContractReference, 
    @JsonKey(name: 'TenderPackageDescription',defaultValue: '') required String tenderPackageDescription,

  }) = _OrderHistoryDetailsOrderItemTenderContractDetailsDto;
  factory OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(OrderHistoryDetailsOrderItemTenderContractDetails tenderContractDetails) {
    return OrderHistoryDetailsOrderItemTenderContractDetailsDto(
      tenderContractNumber: tenderContractDetails.tenderContractNumber,
      tenderContractReference: tenderContractDetails.tenderContractReference,
      tenderPackageDescription: tenderContractDetails.tenderPackageDescription,
      
       );
  }

  OrderHistoryDetailsOrderItemTenderContractDetails toDomain() {
    return OrderHistoryDetailsOrderItemTenderContractDetails(
    tenderContractNumber: tenderContractNumber,
    tenderContractReference: tenderContractReference,
    tenderPackageDescription: tenderPackageDescription,
    );
  }
 
  factory OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoFromJson(json);
}
