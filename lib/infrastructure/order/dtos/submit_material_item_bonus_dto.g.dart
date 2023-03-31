// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_material_item_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitMaterialItemBonusDto _$$_SubmitMaterialItemBonusDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitMaterialItemBonusDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: json['qty'] as int? ?? 0,
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubmitMaterialItemBonusDtoToJson(
        _$_SubmitMaterialItemBonusDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'qty': instance.qty,
      'comment': instance.comment,
    };
