// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnItemDto _$$_ReturnItemDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnItemDto(
      assignmentNumber: json['assignmentNumber'] as String? ?? '',
      referenceDocument: json['referenceDocument'] as String? ?? '',
      purchaseNumberC: json['purchaseNumberC'] as String? ?? '',
      poMethod: json['poMethod'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      itemNumber: json['itemNumber'] as String? ?? '',
      targetQuantity: json['targetQuantity'] as String? ?? '',
      storeLocation: json['storeLocation'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      highLevelItemCode: json['highLevelItemCode'] as String? ?? '',
      orderReason: json['orderReason'] as String? ?? '',
      priceDate: json['priceDate'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      eligibleForReturn: json['eligibleForReturn'] as bool? ?? true,
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map(
                  (e) => ReturnScheduleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      suggestedPriceOverride: json['suggestedPriceOverride'] as String? ?? '',
      balanceQuantity: json['balanceQuantity'] as String? ?? '',
      balanceValue: json['balanceValue'] as String? ?? '',
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReturnItemDtoToJson(_$_ReturnItemDto instance) =>
    <String, dynamic>{
      'assignmentNumber': instance.assignmentNumber,
      'referenceDocument': instance.referenceDocument,
      'purchaseNumberC': instance.purchaseNumberC,
      'poMethod': instance.poMethod,
      'createdDate': instance.createdDate,
      'currency': instance.currency,
      'plant': instance.plant,
      'material': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'itemNumber': instance.itemNumber,
      'targetQuantity': instance.targetQuantity,
      'storeLocation': instance.storeLocation,
      'batch': instance.batch,
      'highLevelItemCode': instance.highLevelItemCode,
      'orderReason': instance.orderReason,
      'priceDate': instance.priceDate,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'principalCode': instance.principalCode,
      'principalName': instance.principalName,
      'expiryDate': instance.expiryDate,
      'eligibleForReturn': instance.eligibleForReturn,
      'schedules': instance.schedules.map((e) => e.toJson()).toList(),
      'suggestedPriceOverride': instance.suggestedPriceOverride,
      'balanceQuantity': instance.balanceQuantity,
      'balanceValue': instance.balanceValue,
      'outsidePolicy': instance.outsidePolicy,
    };
