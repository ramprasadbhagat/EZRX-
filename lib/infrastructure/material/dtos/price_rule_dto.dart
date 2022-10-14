import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/material/entities/price_rule.dart';

part 'price_rule_dto.freezed.dart';
part 'price_rule_dto.g.dart';

@freezed
class PriceRuleDto with _$PriceRuleDto {
  const PriceRuleDto._();
  const factory PriceRuleDto({
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'Rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'Conditions', defaultValue: '') required String condition,
    @JsonKey(name: 'ConditionNumber', defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'BonusEligible', defaultValue: false)
        required bool bonusEligible,
  }) = _PriceRuleDto;

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
