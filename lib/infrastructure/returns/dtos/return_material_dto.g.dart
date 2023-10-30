// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnMaterialDto _$$_ReturnMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnMaterialDto(
      balanceQuantity: json['balanceQuantity'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      itemNumber: json['itemNumber'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      eligibleForReturn: json['eligibleForReturn'] as bool? ?? false,
      assignmentNumber: json['assignmentNumber'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      priceDate: json['priceDate'] as String? ?? '',
      bonusItems: (json['bonusItem'] as List<dynamic>?)
              ?.map(
                  (e) => ReturnMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReturnMaterialDtoToJson(
        _$_ReturnMaterialDto instance) =>
    <String, dynamic>{
      'balanceQuantity': instance.balanceQuantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'material': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'itemNumber': instance.itemNumber,
      'batch': instance.batch,
      'eligibleForReturn': instance.eligibleForReturn,
      'assignmentNumber': instance.assignmentNumber,
      'principalCode': instance.principalCode,
      'principalName': instance.principalName,
      'expiryDate': instance.expiryDate,
      'priceDate': instance.priceDate,
      'bonusItem': instance.bonusItems.map((e) => e.toJson()).toList(),
      'outsidePolicy': instance.outsidePolicy,
    };
