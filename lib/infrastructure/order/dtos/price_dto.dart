import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_dto.freezed.dart';
part 'price_dto.g.dart';

@freezed
class PriceDto with _$PriceDto {
  const PriceDto._();

  const factory PriceDto({
    @JsonKey(name: 'MaterialNumber') required String materialNumber,
    @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
        required List<PriceRuleDto> rules,
    @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
        required List<PriceTierDto> tiers,
    @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
        required List<PriceBonusDto> bonuses,
    @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
        required List<PriceBundleDto> bundles,
    @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
        required bool overrideRulePresent,
    @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
        required String zdp5MaxQuota,
    @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
        required String zdp5RemainingQuota,
    @JsonKey(name: 'ZMGDiscount', defaultValue: false)
        required bool zmgDiscount,
    @JsonKey(name: 'ListPrice', defaultValue: 0) required double listPrice,
    @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
        required double finalIndividualPrice,
    @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
        required double finalTotalPrice,
    @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
        required bool additionalBonusEligible,
    @JsonKey(name: 'Valid', defaultValue: false) required bool isValid,
  }) = _PriceDto;

  Price toDomain() => Price(
        materialNumber: MaterialNumber(materialNumber),
        rules: rules.map((e) => e.toDomain()).toList(),
        tiers: tiers.map((e) => e.toDomain()).toList(),
        bonuses: bonuses.map((e) => e.toDomain()).toList(),
        bundles: bundles.map((e) => e.toDomain()).toList(),
        overrideRulePresent: overrideRulePresent,
        zdp5MaxQuota: zdp5MaxQuota,
        zdp5RemainingQuota: zdp5RemainingQuota,
        zmgDiscount: zmgDiscount,
        lastPrice: MaterialPrice(listPrice),
        finalPrice: MaterialPrice(finalIndividualPrice),
        finalTotalPrice: MaterialPrice(finalTotalPrice),
        additionalBonusEligible: additionalBonusEligible,
        isValid: isValid,
      );

  factory PriceDto.fromDomain(Price price) {
    return PriceDto(
      materialNumber: price.materialNumber.getOrCrash(),
      rules: price.rules.map((e) => PriceRuleDto.fromDomain(e)).toList(),
      tiers: price.tiers.map((e) => PriceTierDto.fromDomain(e)).toList(),
      bonuses: price.bonuses.map((e) => PriceBonusDto.fromDomain(e)).toList(),
      bundles: price.bundles.map((e) => PriceBundleDto.fromDomain(e)).toList(),
      overrideRulePresent: price.overrideRulePresent,
      zdp5MaxQuota: price.zdp5MaxQuota,
      zdp5RemainingQuota: price.zdp5RemainingQuota,
      zmgDiscount: price.zmgDiscount,
      listPrice: price.lastPrice.getOrCrash(),
      finalIndividualPrice: price.finalPrice.getOrCrash(),
      finalTotalPrice: price.finalTotalPrice.getOrCrash(),
      additionalBonusEligible: price.additionalBonusEligible,
      isValid: price.isValid,
    );
  }

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);
}
