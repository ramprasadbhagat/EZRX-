import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
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
    @HiveField(0)
        required String materialNumber,
    @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
    @HiveField(1)
        required List<PriceRuleDto> rules,
    @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
    @HiveField(2)
        required List<PriceTierDto> tiers,
    @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
    @HiveField(3)
        required List<PriceBonusDto> bonuses,
    @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
    @HiveField(4)
        required List<PriceBundleDto> bundles,
    @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
    @HiveField(5)
        required bool overrideRulePresent,
    @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
    @HiveField(6)
        required String zdp5MaxQuota,
    @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
    @HiveField(7)
        required String zdp5RemainingQuota,
    @JsonKey(name: 'ZMGDiscount', defaultValue: false)
    @HiveField(8)
        required bool zmgDiscount,
    @JsonKey(name: 'ListPrice', defaultValue: 0)
    @HiveField(9)
        required double listPrice,
    @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
    @HiveField(10)
        required double finalIndividualPrice,
    @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
    @HiveField(11)
        required double finalTotalPrice,
    @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
    @HiveField(12)
        required bool additionalBonusEligible,
    @JsonKey(name: 'Valid', defaultValue: false)
    @HiveField(13)
        required bool isValid,
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
