// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnMaterialDto _$$_ReturnMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnMaterialDto(
      targetQuantity: json['targetQuantity'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
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
    );

Map<String, dynamic> _$$_ReturnMaterialDtoToJson(
        _$_ReturnMaterialDto instance) =>
    <String, dynamic>{
      'targetQuantity': instance.targetQuantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'material': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'batch': instance.batch,
      'assignmentNumber': instance.assignmentNumber,
      'principalCode': instance.principalCode,
      'principalName': instance.principalName,
      'expiryDate': instance.expiryDate,
      'priceDate': instance.priceDate,
      'bonusItem': instance.bonusItems.map((e) => e.toJson()).toList(),
    };
