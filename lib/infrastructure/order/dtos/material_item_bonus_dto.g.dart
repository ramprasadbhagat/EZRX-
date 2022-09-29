// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialItemBonusDto _$$_MaterialItemBonusDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialItemBonusDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      qty: json['freeQuantity'] as int? ?? 0,
      comment: json['comment'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
    );

Map<String, dynamic> _$$_MaterialItemBonusDtoToJson(
        _$_MaterialItemBonusDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'freeQuantity': instance.qty,
      'comment': instance.comment,
      'MaterialDescription': instance.materialDescription,
    };
