// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overriden_rule_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OverridenRuleTierDto _$$_OverridenRuleTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OverridenRuleTierDto(
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['Quantity'] as num?)?.toDouble() ?? 0,
      conditions: json['Conditions'] as String? ?? '',
      tier: json['Tier'] as String? ?? '',
      overrider: json['Overrider'] as String? ?? '',
    );

Map<String, dynamic> _$$_OverridenRuleTierDtoToJson(
        _$_OverridenRuleTierDto instance) =>
    <String, dynamic>{
      'Rate': instance.rate,
      'Quantity': instance.quantity,
      'Conditions': instance.conditions,
      'Tier': instance.tier,
      'Overrider': instance.overrider,
    };
