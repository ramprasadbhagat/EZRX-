import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_rule.freezed.dart';

@freezed
class PriceRule with _$PriceRule {
  const PriceRule._();
  const factory PriceRule({
    required String type,
    required double rate,
    required String condition,
    required String conditionNumber,
    required bool bonusEligible,
  }) = _PriceRule;

  factory PriceRule.empty() => const PriceRule(
        type: '',
        rate: 0,
        condition: '',
        conditionNumber: '',
        bonusEligible: false,
      );
}
