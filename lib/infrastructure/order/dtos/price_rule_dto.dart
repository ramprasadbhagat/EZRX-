import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'price_rule_dto.freezed.dart';
part 'price_rule_dto.g.dart';

@freezed
class PriceRuleDto with _$PriceRuleDto {
  const PriceRuleDto._();
  @HiveType(typeId: 7, adapterName: 'PriceRuleDtoAdapter')
  const factory PriceRuleDto({
    @JsonKey(name: 'Type', defaultValue: '')
    @HiveField(14, defaultValue: '')
        required String type,
    @JsonKey(name: 'Rate', defaultValue: 0)
    @HiveField(15, defaultValue: 0)
        required double rate,
    @JsonKey(name: 'Conditions', defaultValue: '')
    @HiveField(16, defaultValue: '')
        required String condition,
    @JsonKey(name: 'ConditionNumber', defaultValue: '')
    @HiveField(17, defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'BonusEligible', defaultValue: false)
    @HiveField(18, defaultValue: false)
        required bool bonusEligible,
  }) = _PriceRuleDto;

  factory PriceRuleDto.fromDomain(PriceRule priceRule) {
    return PriceRuleDto(
      type: priceRule.type,
      rate: priceRule.rate,
      condition: priceRule.condition,
      conditionNumber: priceRule.conditionNumber,
      bonusEligible: priceRule.bonusEligible,
    );
  }

  PriceRule toDomain() => PriceRule(
        type: type,
        rate: rate,
        condition: condition,
        conditionNumber: conditionNumber,
        bonusEligible: bonusEligible,
      );

  factory PriceRuleDto.fromJson(Map<String, dynamic> json) =>
      _$PriceRuleDtoFromJson(json);
}
