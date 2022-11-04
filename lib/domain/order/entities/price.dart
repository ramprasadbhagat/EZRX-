import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_bundle.dart';
import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';

@freezed
class Price with _$Price {
  const Price._();
  const factory Price({
    required MaterialNumber materialNumber,
    required List<PriceRule> rules,
    required List<PriceTier> tiers,
    required List<PriceBonus> bonuses,
    required List<PriceBundle> bundles,
    required bool overrideRulePresent,
    required String zdp5MaxQuota,
    required String zdp5RemainingQuota,
    required bool zmgDiscount,
    required MaterialPrice lastPrice,
    required MaterialPrice finalPrice,
    required MaterialPrice finalTotalPrice,
    required bool additionalBonusEligible,
    @Default(true) bool isValid,
    @Default(false) bool isFOC,
  }) = _Price;

  factory Price.empty() => Price(
        materialNumber: MaterialNumber(''),
        bundles: [],
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
      );
}
