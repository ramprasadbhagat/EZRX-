import 'package:ezrxmobile/domain/material/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/material/entities/price_rule.dart';
import 'package:ezrxmobile/domain/material/entities/price_tier.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';

@freezed
class Price with _$Price {
  const Price._();
  const factory Price({
    required String materialNumber,
    required List<PriceRule> rules,
    required List<PriceTier> tiers,
    required List<PriceBonus> bonuses,
    required bool overrideRulePresent,
    required String zdp5MaxQuota,
    required String zdp5RemainingQuota,
    required bool zmgDiscount,
    required MaterialPrice lastPrice,
    required MaterialPrice finalPrice,
    required MaterialPrice finalTotalPrice,
    required bool additionalBonusEligible,
    required bool isValid,
  }) = _Price;

  factory Price.empty() => Price(
        materialNumber: '',
        rules: [],
        tiers: [],
        bonuses: [],
        overrideRulePresent: false,
        zdp5MaxQuota: '',
        zdp5RemainingQuota: '',
        zmgDiscount: false,
        lastPrice: MaterialPrice(0),
        finalPrice: MaterialPrice(0),
        finalTotalPrice: MaterialPrice(0),
        additionalBonusEligible: false,
        isValid: false,
      );
}
