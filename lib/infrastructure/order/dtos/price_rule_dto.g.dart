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
      tieredRules: json['TieredRules'] == null
          ? TieredRulesDto.empty
          : TieredRulesDto.fromJson(
              json['TieredRules'] as Map<String, dynamic>),
      bonusEligible: json['BonusEligible'] as bool? ?? false,
      conditionNumber: json['ConditionNumber'] as String? ?? '',
      overriddenBy: json['OverriddenBy'] as String? ?? '',
      maxQuota: json['MaxQuota'] as String? ?? '',
      remainingQuota: json['RemainingQuota'] as String? ?? '',
    );

Map<String, dynamic> _$$_PriceRuleDtoToJson(_$_PriceRuleDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Rate': instance.rate,
      'Conditions': instance.condition,
      'TieredRules': instance.tieredRules.toJson(),
      'BonusEligible': instance.bonusEligible,
      'ConditionNumber': instance.conditionNumber,
      'OverriddenBy': instance.overriddenBy,
      'MaxQuota': instance.maxQuota,
      'RemainingQuota': instance.remainingQuota,
    };

_$_TieredRulesDto _$$_TieredRulesDtoFromJson(Map<String, dynamic> json) =>
    _$_TieredRulesDto(
      tier: json['Tier'] as String? ?? '',
      ruleTier: (json['RuleTier'] as List<dynamic>?)
              ?.map((e) => RuleTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TieredRulesDtoToJson(_$_TieredRulesDto instance) =>
    <String, dynamic>{
      'Tier': instance.tier,
      'RuleTier': instance.ruleTier.map((e) => e.toJson()).toList(),
    };

_$_RuleTierDto _$$_RuleTierDtoFromJson(Map<String, dynamic> json) =>
    _$_RuleTierDto(
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['Quantity'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_RuleTierDtoToJson(_$_RuleTierDto instance) =>
    <String, dynamic>{
      'Rate': instance.rate,
      'Quantity': instance.quantity,
    };
