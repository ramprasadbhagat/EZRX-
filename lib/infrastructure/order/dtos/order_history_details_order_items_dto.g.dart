// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsOrderItemDto _$$_OrderHistoryDetailsOrderItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryDetailsOrderItemDto(
      sAPStatus: json['SAPStatus'] as String,
      plannedDeliveryDate: json['PlannedDeliveryDate'] as String,
      pickedQuantity: json['PickedQuantity'] as int,
      batch: json['Batch'] as String,
      expiryDate: json['ExpiryDate'] as String,
      lineReferenceNotes: json['LineReferenceNotes'] as String,
      isTenderContractMaterial: json['IsTenderContractMaterial'] as bool,
      details: (json['Details'] as List<dynamic>)
          .map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      tenderContractDetails:
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
              json['TenderContractDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderHistoryDetailsOrderItemDtoToJson(
        _$_OrderHistoryDetailsOrderItemDto instance) =>
    <String, dynamic>{
      'SAPStatus': instance.sAPStatus,
      'PlannedDeliveryDate': instance.plannedDeliveryDate,
      'PickedQuantity': instance.pickedQuantity,
      'Batch': instance.batch,
      'ExpiryDate': instance.expiryDate,
      'LineReferenceNotes': instance.lineReferenceNotes,
      'IsTenderContractMaterial': instance.isTenderContractMaterial,
      'Details': instance.details,
      'TenderContractDetails': instance.tenderContractDetails,
    };
