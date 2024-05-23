// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_tender_contract_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsTenderContractDtoImpl
    _$$OrderHistoryDetailsTenderContractDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$OrderHistoryDetailsTenderContractDtoImpl(
          contractNumber: json['ContractNumber'] as String? ?? '',
          contractReference: json['ContractReference'] as String? ?? '',
          price: json['Price'] as String? ?? '',
          priceUnit: (json['PriceUnit'] as num?)?.toInt() ?? 0,
          contractQuantity: (json['ContractQuantity'] as num?)?.toInt() ?? 0,
          remainingQuantity: (json['RemainingQuantity'] as num?)?.toInt() ?? 0,
          isTenderExpired: json['isTenderExpired'] as bool? ?? false,
          expiryDate: json['ExpiryDate'] as String? ?? '',
          orderReason: json['OrderReason'] as String? ?? '',
          visaNumber: json['VisaNumber'] as String? ?? '',
          announcementLetterNumber:
              json['AnnouncementLetterNumber'] as String? ?? '',
        );

Map<String, dynamic> _$$OrderHistoryDetailsTenderContractDtoImplToJson(
        _$OrderHistoryDetailsTenderContractDtoImpl instance) =>
    <String, dynamic>{
      'ContractNumber': instance.contractNumber,
      'ContractReference': instance.contractReference,
      'Price': instance.price,
      'PriceUnit': instance.priceUnit,
      'ContractQuantity': instance.contractQuantity,
      'RemainingQuantity': instance.remainingQuantity,
      'isTenderExpired': instance.isTenderExpired,
      'ExpiryDate': instance.expiryDate,
      'OrderReason': instance.orderReason,
      'VisaNumber': instance.visaNumber,
      'AnnouncementLetterNumber': instance.announcementLetterNumber,
    };
