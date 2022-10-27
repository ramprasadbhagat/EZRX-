// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialItemDto _$$_MaterialItemDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialItemDto(
      qty: json['qty'] as int? ?? 0,
      hidePrice: json['hidePrice'] as bool? ?? false,
      bonuses: (json['additionalBonus'] as List<dynamic>?)
              ?.map((e) =>
                  MaterialItemBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      overridenPrice: (json['overridenPrice'] as num?)?.toDouble() ?? 0,
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      materialDescription: json['defaultMaterialDescription'] as String? ?? '',
      type: json['type'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      batchNumber: json['batchNumber'] as String? ?? '',
      zdp8Override:
          boolStringFormatCheck(json, 'zdp8Override') as bool? ?? false,
    );

Map<String, dynamic> _$$_MaterialItemDtoToJson(_$_MaterialItemDto instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'hidePrice': instance.hidePrice,
      'additionalBonus': instance.bonuses,
      'materialGroup2': instance.materialGroup2,
      'materialGroup4': instance.materialGroup4,
      'materialNumber': instance.materialNumber,
      'overridenPrice': instance.overridenPrice,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'defaultMaterialDescription': instance.materialDescription,
      'type': instance.type,
      'comment': instance.comment,
      'batchNumber': instance.batchNumber,
      'zdp8Override': instance.zdp8Override,
    };
