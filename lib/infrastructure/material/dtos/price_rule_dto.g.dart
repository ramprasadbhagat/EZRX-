// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceRuleDto _$$_PriceRuleDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceRuleDto(
      type: json['Type'] as String? ?? '',
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      condition: json['Conditions'] as String? ?? '',
      conditionNumber: json['ConditionNumber'] as String? ?? '',
      bonusEligible: json['BonusEligible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PriceRuleDtoToJson(_$_PriceRuleDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Rate': instance.rate,
      'Conditions': instance.condition,
      'ConditionNumber': instance.conditionNumber,
      'BonusEligible': instance.bonusEligible,
    };
