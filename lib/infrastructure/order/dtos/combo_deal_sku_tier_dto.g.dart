// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_sku_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealSKUTierDto _$$_ComboDealSKUTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealSKUTierDto(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealSKUTierDtoToJson(
        _$_ComboDealSKUTierDto instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'type': instance.type,
    };
