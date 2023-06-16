import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_bundle.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/overriden_rule_tier.dart';

part 'price.freezed.dart';

@freezed
class Price with _$Price {
  const Price._();
  const factory Price({
    required MaterialNumber materialNumber,
    required MaterialCode materialCode,
    required MaterialPrice lastPrice,
    required MaterialPrice finalPrice,
    required MaterialPrice finalTotalPrice,
    required List<PriceRule> rules,
    required List<PriceTier> tiers,
    required List<PriceBonus> bonuses,
    required List<PriceBundle> bundles,
    required bool isValid,
    required bool additionalBonusEligible,
    required bool zmgDiscount,
    required ZDP5Info zdp5MaxQuota,
    required ZDP5Info zdp5RemainingQuota,
    required bool exceedQty,
    required bool overrideRulePresent,
    required List<PriceRule> overridenRules,
    required List<OverridenRuleTier> overridenRuleTier,
    @Default(true) bool isValidMaterial,
    @Default(false) bool isFOC,
    @Default(false) bool isPriceOverride,
    required Zdp8OverrideValue zdp8Override,
    required PriceOverrideValue priceOverride,
    required PriceComboDeal comboDeal,
  }) = _Price;

  factory Price.empty() => Price(
        materialNumber: MaterialNumber(''),
        materialCode: MaterialCode(''),
        lastPrice: MaterialPrice(0),
        finalPrice: MaterialPrice(0),
        finalTotalPrice: MaterialPrice(0),
        bundles: [],
        rules: [],
        tiers: [],
        bonuses: [],
        isValid: true,
        additionalBonusEligible: false,
        zmgDiscount: false,
        zdp5MaxQuota: ZDP5Info(''),
        zdp5RemainingQuota: ZDP5Info(''),
        exceedQty: false,
        overrideRulePresent: false,
        overridenRules: [],
        overridenRuleTier: [],
        zdp8Override: Zdp8OverrideValue(0),
        priceOverride: PriceOverrideValue(0),
        comboDeal: PriceComboDeal.empty(),
      );

  List<PriceTierItem> get priceTireItem =>
      tiers.isNotEmpty ? tiers.first.getItems : <PriceTierItem>[];

  bool get isTireDiscountEligible => tiers.isNotEmpty;

  bool get isDiscountEligible => isTireDiscountEligible || zmgDiscount;

  bool get isBonusDealEligible => _availableBonus.isNotEmpty;

  List<PriceBonusItem> get priceBonusItem => bonuses.isNotEmpty
      ? bonuses.first.sortedPriceBonusItem
      : <PriceBonusItem>[];

  Iterable<BonusMaterial> get _availableBonus =>
      priceBonusItem.expand((element) => element.bonusMaterials);

  Iterable<BonusMaterial> get sameMaterialBonus => _availableBonus.where(
        (BonusMaterial element) => element.materialNumber == materialNumber,
      );

  Iterable<BonusMaterial> get otherMaterialBonus => _availableBonus.where(
        (BonusMaterial element) => element.materialNumber != materialNumber,
      );

  bool get isFailurePrice =>
      isValidMaterial && !isFOC && finalPrice == MaterialPrice.unavailable();
}
