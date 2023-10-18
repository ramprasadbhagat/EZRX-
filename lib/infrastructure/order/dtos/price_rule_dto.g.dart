// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceRuleDto _$$_PriceRuleDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceRuleDto(
      type: json['type'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      condition: json['conditions'] as String? ?? '',
      tieredRules: json['tieredRules'] == null
          ? TieredRulesDto.empty
          : TieredRulesDto.fromJson(
              json['tieredRules'] as Map<String, dynamic>),
      bonusEligible: json['bonusEligible'] as bool? ?? false,
      conditionNumber: json['conditionNumber'] as String? ?? '',
      overriddenBy: json['overriddenBy'] as String? ?? '',
      maxQuota: json['maxQuota'] as String? ?? '',
      remainingQuota: json['remainingQuota'] as String? ?? '',
    );

Map<String, dynamic> _$$_PriceRuleDtoToJson(_$_PriceRuleDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'rate': instance.rate,
      'conditions': instance.condition,
      'tieredRules': instance.tieredRules.toJson(),
      'bonusEligible': instance.bonusEligible,
      'conditionNumber': instance.conditionNumber,
      'overriddenBy': instance.overriddenBy,
      'maxQuota': instance.maxQuota,
      'remainingQuota': instance.remainingQuota,
    };

_$_TieredRulesDto _$$_TieredRulesDtoFromJson(Map<String, dynamic> json) =>
    _$_TieredRulesDto(
      tier: json['tier'] as String? ?? '',
      ruleTier: (json['ruleTier'] as List<dynamic>?)
              ?.map((e) => RuleTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TieredRulesDtoToJson(_$_TieredRulesDto instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'ruleTier': instance.ruleTier.map((e) => e.toJson()).toList(),
    };

_$_RuleTierDto _$$_RuleTierDtoFromJson(Map<String, dynamic> json) =>
    _$_RuleTierDto(
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_RuleTierDtoToJson(_$_RuleTierDto instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'quantity': instance.quantity,
    };
