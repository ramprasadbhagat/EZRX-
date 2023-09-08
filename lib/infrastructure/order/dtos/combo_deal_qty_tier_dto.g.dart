// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_qty_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealQtyTierDto _$$_ComboDealQtyTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealQtyTierDto(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
      type: json['type'] as String? ?? '',
      suffix: json['suffix'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealQtyTierDtoToJson(
        _$_ComboDealQtyTierDto instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'type': instance.type,
      'suffix': instance.suffix,
    };
