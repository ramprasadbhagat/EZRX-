import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_items_tender_contract_details_dto.freezed.dart';
part 'order_history_details_order_items_tender_contract_details_dto.g.dart';

@freezed
class OrderHistoryDetailsTenderContractDto
    with _$OrderHistoryDetailsTenderContractDto {
  const OrderHistoryDetailsTenderContractDto._();
  const factory OrderHistoryDetailsTenderContractDto({
    @JsonKey(name: 'ContractNumber', defaultValue: '')
    required String contractNumber,
    @JsonKey(name: 'ContractReference', defaultValue: '')
    required String contractReference,
    @JsonKey(name: 'Price', defaultValue: '') required String price,
    @JsonKey(name: 'PriceUnit', defaultValue: 0) required int priceUnit,
    @JsonKey(name: 'ContractQuantity', defaultValue: 0)
    required int contractQuantity,
    @JsonKey(name: 'RemainingQuantity', defaultValue: 0)
    required int remainingQuantity,
    @JsonKey(name: 'isTenderExpire', defaultValue: false)
    required bool isTenderExpired,
    @JsonKey(name: 'ExpiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'OrderReason', defaultValue: '') required String orderReason,
    @JsonKey(name: 'VisaNumber', defaultValue: '') required String visaNumber,
    @JsonKey(name: 'AnnouncementLetterNumber', defaultValue: '')
    required String announcementLetterNumber,
  }) = _OrderHistoryDetailsTenderContractDto;
  factory OrderHistoryDetailsTenderContractDto.fromDomain(
    OrderHistoryDetailsTenderContract tenderContractDetails,
  ) {
    return OrderHistoryDetailsTenderContractDto(
      contractNumber:
          tenderContractDetails.contractNumber.getOrDefaultValue(''),
      orderReason: tenderContractDetails.orderReason.getOrDefaultValue(''),
      price: tenderContractDetails.price,
      priceUnit: tenderContractDetails.priceUnit,
      contractQuantity: tenderContractDetails.contractQuantity,
      remainingQuantity: tenderContractDetails.remainingQuantity,
      expiryDate: tenderContractDetails.expiryDate.getOrDefaultValue(''),
      contractReference: tenderContractDetails.contractReference,
      visaNumber: tenderContractDetails.visaNumber,
      announcementLetterNumber: tenderContractDetails.announcementLetterNumber,
      isTenderExpired: tenderContractDetails.isTenderExpired,
    );
  }

  OrderHistoryDetailsTenderContract toDomain() {
    return OrderHistoryDetailsTenderContract(
      contractNumber: TenderContractNumber(contractNumber),
      orderReason: TenderContractReason(contractReference),
      price: price,
      priceUnit: priceUnit,
      contractQuantity: contractQuantity,
      remainingQuantity: remainingQuantity,
      expiryDate: DateTimeStringValue(expiryDate),
      contractReference: contractReference,
      visaNumber: visaNumber,
      announcementLetterNumber: announcementLetterNumber,
      salesDistrict: '',
      isTenderExpired: isTenderExpired,
    );
  }

  factory OrderHistoryDetailsTenderContractDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderHistoryDetailsTenderContractDtoFromJson(json);
}
