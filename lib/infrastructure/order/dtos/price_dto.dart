import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'price_dto.freezed.dart';
part 'price_dto.g.dart';

@freezed
class PriceDto with _$PriceDto {
  const PriceDto._();

  @HiveType(typeId: 6, adapterName: 'PriceDtoAdapter')
  const factory PriceDto({
    @JsonKey(name: 'MaterialNumber')
    @HiveField(0, defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
    @HiveField(1, defaultValue: <PriceRuleDto>[])
        required List<PriceRuleDto> rules,
    @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
    @HiveField(2, defaultValue: <PriceTierDto>[])
        required List<PriceTierDto> tiers,
    @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
    @HiveField(3, defaultValue: <PriceBonusDto>[])
        required List<PriceBonusDto> bonuses,
    @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
    @HiveField(4, defaultValue: <PriceBundleDto>[])
        required List<PriceBundleDto> bundles,
    @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
    @HiveField(5, defaultValue: false)
        required bool overrideRulePresent,
    @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
    @HiveField(6, defaultValue: '')
        required String zdp5MaxQuota,
    @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
    @HiveField(7, defaultValue: '')
        required String zdp5RemainingQuota,
    @JsonKey(name: 'ZMGDiscount', defaultValue: false)
    @HiveField(8, defaultValue: false)
        required bool zmgDiscount,
    @JsonKey(name: 'ListPrice', defaultValue: 0)
    @HiveField(9, defaultValue: 0)
        required double listPrice,
    @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
    @HiveField(10, defaultValue: 0)
        required double finalIndividualPrice,
    @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
    @HiveField(11, defaultValue: 0)
        required double finalTotalPrice,
    @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
    @HiveField(12, defaultValue: false)
        required bool additionalBonusEligible,
    @JsonKey(name: 'Valid', defaultValue: false)
    @HiveField(13, defaultValue: false)
        required bool isValid,
    @JsonKey(name: 'isPriceOverride', defaultValue: false)
    @HiveField(14, defaultValue: false)
        required bool isPriceOverride,
    @HiveField(15, defaultValue: 0)
    @JsonKey(name: 'zdp8Override', defaultValue: 0)
        required double zdp8Override,
    @HiveField(16, defaultValue: 0)
    @JsonKey(name: 'priceOverride', defaultValue: 0)
        required double priceOverride,
    @HiveField(17, defaultValue: PriceComboDealDto.empty)
    @Default(PriceComboDealDto.empty)
    @JsonKey(name: 'ComboDeals')
        PriceComboDealDto comboDeal,
  }) = _PriceDto;

  Price toDomain() => Price(
        materialNumber: MaterialNumber(materialNumber),
        rules: rules.map((e) => e.toDomain()).toList(),
        tiers: tiers.map((e) => e.toDomain()).toList(),
        bonuses: bonuses.map((e) => e.toDomain()).toList(),
        bundles: bundles.map((e) => e.toDomain()).toList(),
        overrideRulePresent: overrideRulePresent,
        zdp5MaxQuota: ZDP5Info(zdp5MaxQuota),
        zdp5RemainingQuota: ZDP5Info(zdp5RemainingQuota),
        zmgDiscount: zmgDiscount,
        lastPrice: MaterialPrice(listPrice),
        finalPrice: MaterialPrice(finalIndividualPrice),
        finalTotalPrice: MaterialPrice(finalTotalPrice),
        additionalBonusEligible: additionalBonusEligible,
        isValid: isValid,
        isPriceOverride: isPriceOverride,
        zdp8Override: Zdp8OverrideValue(zdp8Override),
        priceOverride: PriceOverrideValue(priceOverride),
        comboDeal: comboDeal.toDomain,
      );

  factory PriceDto.fromDomain(Price price) {
    return PriceDto(
      materialNumber: price.materialNumber.getOrDefaultValue(''),
      rules: price.rules.map((e) => PriceRuleDto.fromDomain(e)).toList(),
      tiers: price.tiers.map((e) => PriceTierDto.fromDomain(e)).toList(),
      bonuses: price.bonuses.map((e) => PriceBonusDto.fromDomain(e)).toList(),
      bundles: price.bundles.map((e) => PriceBundleDto.fromDomain(e)).toList(),
      overrideRulePresent: price.overrideRulePresent,
      zdp5MaxQuota: price.zdp5MaxQuota.getOrCrash(),
      zdp5RemainingQuota: price.zdp5RemainingQuota.getOrCrash(),
      zmgDiscount: price.zmgDiscount,
      listPrice: price.lastPrice.getOrDefaultValue(0),
      finalIndividualPrice: price.finalPrice.getOrDefaultValue(0),
      finalTotalPrice: price.finalTotalPrice.getOrDefaultValue(0),
      additionalBonusEligible: price.additionalBonusEligible,
      isValid: price.isValid,
      isPriceOverride: price.isPriceOverride,
      zdp8Override: price.zdp8Override.getOrDefaultValue(0),
      priceOverride: price.priceOverride.getOrDefaultValue(0),
      comboDeal: PriceComboDealDto.fromDomain(price.comboDeal),
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

   Map<String, dynamic> materialQueryWithExceedQty(bool exceedQty) {
    final data = <String, dynamic>{
      'MaterialNumber': materialNumber,
      'exceedQty': exceedQty,
    };

    return data;
  }

  Map<String, dynamic> priceOverrideQuery(double overridePrice) {
    final data = <String, dynamic>{
      'MaterialNumber': materialNumber,
      'ZPO1': overridePrice,
    };

    if (zdp8Override != 0) {
      data['ZDP8'] = zdp8Override;
    }

    return data;
  }
}
