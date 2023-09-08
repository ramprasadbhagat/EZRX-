import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_rule_dto.freezed.dart';
part 'price_rule_dto.g.dart';

@freezed
class PriceRuleDto with _$PriceRuleDto {
  const PriceRuleDto._();

  const factory PriceRuleDto({
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'Rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'Conditions', defaultValue: '') required String condition,
    @Default(TieredRulesDto.empty)
    @JsonKey(name: 'TieredRules')
        TieredRulesDto tieredRules,
    @JsonKey(name: 'BonusEligible', defaultValue: false)
        required bool bonusEligible,
    @JsonKey(name: 'ConditionNumber', defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'OverriddenBy', defaultValue: '')
        required String overriddenBy,
    @JsonKey(name: 'MaxQuota', defaultValue: '') required String maxQuota,
    @JsonKey(name: 'RemainingQuota', defaultValue: '')
        required String remainingQuota,
  }) = _PriceRuleDto;

  factory PriceRuleDto.fromDomain(PriceRule priceRule) {
    return PriceRuleDto(
      type: priceRule.type,
      rate: priceRule.rate,
      condition: priceRule.condition,
      tieredRules: TieredRulesDto.fromDomain(priceRule.tieredRules),
      bonusEligible: priceRule.bonusEligible,
      conditionNumber: priceRule.conditionNumber,
      overriddenBy: priceRule.overriddenBy,
      maxQuota: priceRule.maxQuota,
      remainingQuota: priceRule.remainingQuota,
    );
  }

  PriceRule toDomain() => PriceRule(
        type: type,
        rate: rate,
        condition: condition,
        tieredRules: tieredRules.toDomain(),
        bonusEligible: bonusEligible,
        conditionNumber: conditionNumber,
        overriddenBy: overriddenBy,
        maxQuota: maxQuota,
        remainingQuota: remainingQuota,
      );

  factory PriceRuleDto.fromJson(Map<String, dynamic> json) =>
      _$PriceRuleDtoFromJson(json);
}

@freezed
class TieredRulesDto with _$TieredRulesDto {
  const TieredRulesDto._();

  const factory TieredRulesDto({
    @JsonKey(name: 'Tier', defaultValue: '') required String tier,
    @JsonKey(name: 'RuleTier', defaultValue: [])
        required List<RuleTierDto> ruleTier,
  }) = _TieredRulesDto;

  factory TieredRulesDto.fromDomain(TieredRules tieredRules) {
    return TieredRulesDto(
      tier: tieredRules.tier,
      ruleTier:
          tieredRules.ruleTier.map((e) => RuleTierDto.fromDomain(e)).toList(),
    );
  }

  TieredRules toDomain() => TieredRules(
        tier: tier,
        ruleTier: ruleTier.map((e) => e.toDomain()).toList(),
      );

  static const empty = TieredRulesDto(
    tier: '',
    ruleTier: [],
  );

  factory TieredRulesDto.fromJson(Map<String, dynamic> json) =>
      _$TieredRulesDtoFromJson(json);
}

@freezed
class RuleTierDto with _$RuleTierDto {
  const RuleTierDto._();

  const factory RuleTierDto({
    @JsonKey(name: 'Rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'Quantity', defaultValue: 0) required double quantity,
  }) = _RuleTierDto;

  factory RuleTierDto.fromDomain(RuleTier ruleTier) {
    return RuleTierDto(
      rate: ruleTier.rate,
      quantity: ruleTier.quantity,
    );
  }

  RuleTier toDomain() => RuleTier(
        rate: rate,
        quantity: quantity,
      );

  factory RuleTierDto.fromJson(Map<String, dynamic> json) =>
      _$RuleTierDtoFromJson(json);
}
