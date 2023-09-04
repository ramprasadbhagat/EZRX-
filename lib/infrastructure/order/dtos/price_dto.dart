import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/overriden_rule_tier_dto.dart';

part 'price_dto.freezed.dart';
part 'price_dto.g.dart';

@freezed
class PriceDto with _$PriceDto {
  const PriceDto._();

  @HiveType(typeId: 6, adapterName: 'PriceDtoAdapter')
  const factory PriceDto({
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
    @HiveField(0, defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'OldMaterialCode', defaultValue: '')
    @HiveField(1, defaultValue: '')
        required String oldMaterialCode,
    @JsonKey(name: 'ListPrice', defaultValue: 0)
    @HiveField(2, defaultValue: 0)
        required double listPrice,
    @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
    @HiveField(3, defaultValue: 0)
        required double finalIndividualPrice,
    @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
    @HiveField(4, defaultValue: 0)
        required double finalTotalPrice,
    @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
    @HiveField(5, defaultValue: <PriceRuleDto>[])
        required List<PriceRuleDto> rules,
    @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
    @HiveField(6, defaultValue: <PriceBonusDto>[])
        required List<PriceBonusDto> bonuses,
    @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
    @HiveField(7, defaultValue: <PriceTierDto>[])
        required List<PriceTierDto> tiers,
    @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
    @HiveField(8, defaultValue: <PriceBundleDto>[])
        required List<PriceBundleDto> bundles,
    @JsonKey(name: 'Valid', defaultValue: false)
    @HiveField(9, defaultValue: false)
        required bool isValid,
    @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
    @HiveField(10, defaultValue: false)
        required bool additionalBonusEligible,
    @JsonKey(name: 'ZMGDiscount', defaultValue: false)
    @HiveField(11, defaultValue: false)
        required bool zmgDiscount,
    @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
    @HiveField(12, defaultValue: '')
        required String zdp5MaxQuota,
    @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
    @HiveField(13, defaultValue: '')
        required String zdp5RemainingQuota,
    @JsonKey(name: 'ExceedQty', defaultValue: false)
    @HiveField(14, defaultValue: false)
        required bool exceedQty,
    @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
    @HiveField(15, defaultValue: false)
        required bool overrideRulePresent,
    @JsonKey(name: 'OverridenRules', defaultValue: [])
    @HiveField(16, defaultValue: [])
        required List<PriceRuleDto> overridenRules,
    @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
    @HiveField(17, defaultValue: [])
        required List<OverridenRuleTierDto> overridenRuleTier,
    @JsonKey(name: 'isPriceOverride', defaultValue: false)
    @HiveField(18, defaultValue: false)
        required bool isPriceOverride,
    @HiveField(19, defaultValue: 0)
    @JsonKey(name: 'zdp8Override', defaultValue: 0)
        required double zdp8Override,
    @HiveField(20, defaultValue: 0)
    @JsonKey(name: 'priceOverride', defaultValue: 0)
        required double priceOverride,
    @HiveField(21, defaultValue: PriceComboDealDto.empty)
    @Default(PriceComboDealDto.empty)
    @JsonKey(name: 'ComboDeals')
        PriceComboDealDto comboDeal,
    @JsonKey(name: 'isDiscountOverride', defaultValue: false)
    @HiveField(22, defaultValue: false)
        required bool isDiscountOverride,
  }) = _PriceDto;

  Price toDomain() => Price(
        materialNumber: MaterialNumber(materialNumber),
        materialCode: MaterialCode(oldMaterialCode),
        lastPrice: MaterialPrice(listPrice),
        finalPrice: MaterialPrice(finalIndividualPrice),
        finalTotalPrice: MaterialPrice(finalTotalPrice),
        rules: rules.map((e) => e.toDomain()).toList(),
        tiers: tiers.map((e) => e.toDomain()).toList(),
        bonuses: bonuses.map((e) => e.toDomain()).toList(),
        bundles: bundles.map((e) => e.toDomain()).toList(),
        isValid: isValid,
        additionalBonusEligible: additionalBonusEligible,
        zmgDiscount: zmgDiscount,
        zdp5MaxQuota: ZDP5Info(zdp5MaxQuota),
        zdp5RemainingQuota: ZDP5Info(zdp5RemainingQuota),
        exceedQty: exceedQty,
        overrideRulePresent: overrideRulePresent,
        overridenRules: overridenRules.map((e) => e.toDomain()).toList(),
        overridenRuleTier: overridenRuleTier.map((e) => e.toDomain()).toList(),
        isPriceOverride: isPriceOverride,
        zdp8Override: Zdp8OverrideValue(zdp8Override),
        priceOverride: PriceOverrideValue(priceOverride),
        comboDeal: comboDeal.toDomain,
        isDiscountOverride: isDiscountOverride,
      );

  factory PriceDto.fromDomain(Price price) {
    return PriceDto(
      materialNumber: price.materialNumber.getOrDefaultValue(''),
      oldMaterialCode: price.materialCode.getOrDefaultValue(''),
      listPrice: price.lastPrice.getOrDefaultValue(0),
      finalIndividualPrice: price.finalPrice.getOrDefaultValue(0),
      finalTotalPrice: price.finalTotalPrice.getOrDefaultValue(0),
      rules: price.rules.map((e) => PriceRuleDto.fromDomain(e)).toList(),
      tiers: price.tiers.map((e) => PriceTierDto.fromDomain(e)).toList(),
      bonuses: price.bonuses.map((e) => PriceBonusDto.fromDomain(e)).toList(),
      bundles: price.bundles.map((e) => PriceBundleDto.fromDomain(e)).toList(),
      isValid: price.isValid,
      additionalBonusEligible: price.additionalBonusEligible,
      zmgDiscount: price.zmgDiscount,
      zdp5MaxQuota: price.zdp5MaxQuota.getOrCrash(),
      zdp5RemainingQuota: price.zdp5RemainingQuota.getOrCrash(),
      exceedQty: price.exceedQty,
      overrideRulePresent: price.overrideRulePresent,
      overridenRules:
          price.overridenRules.map((e) => PriceRuleDto.fromDomain(e)).toList(),
      overridenRuleTier: price.overridenRuleTier
          .map((e) => OverridenRuleTierDto.fromDomain(e))
          .toList(),
      isPriceOverride: price.isPriceOverride,
      zdp8Override: price.zdp8Override.getOrDefaultValue(0),
      priceOverride: price.priceOverride.getOrDefaultValue(0),
      comboDeal: PriceComboDealDto.fromDomain(price.comboDeal),
      isDiscountOverride: price.isDiscountOverride,
    );
  }

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);

  Map<String, dynamic> get overrideQuery {
    final data = <String, dynamic>{
      'MaterialNumber': materialNumber,
    };

    if (isPriceOverride) {
      data['ZPO1'] = priceOverride;
    }
    if (zdp8Override != 0) {
      data['ZDP8'] = zdp8Override;
    }

    return data;
  }

  Map<String, dynamic> materialQueryWithExceedQty(bool exceedQty) =>
      <String, dynamic>{
        'MaterialNumber': materialNumber,
        'exceedQty': exceedQty,
      };

  Map<String, dynamic> priceOverrideQuery(
    double overridePrice,
    double zdp8Override,
  ) {
    final data = <String, dynamic>{
      'MaterialNumber': materialNumber,
    };

    if (overridePrice != 0) {
      data['ZPO1'] = overridePrice;
    }

    if (zdp8Override != 0) {
      data['ZDP8'] = zdp8Override;
    }

    return data;
  }
}
