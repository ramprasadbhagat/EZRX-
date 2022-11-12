// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_tender_contract_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsOrderItemTenderContractDetailsDto
    _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoFromJson(
            Map<String, dynamic> json) =>
        _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto(
          tenderContractNumber: json['TenderContractNumber'] as String? ?? '',
          tenderContractReference:
              json['TenderContractReference'] as String? ?? '',
          tenderPackageDescription:
              json['TenderPackageDescription'] as String? ?? '',
        );

Map<String, dynamic>
    _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoToJson(
            _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto instance) =>
        <String, dynamic>{
          'TenderContractNumber': instance.tenderContractNumber,
          'TenderContractReference': instance.tenderContractReference,
          'TenderPackageDescription': instance.tenderPackageDescription,
        };
