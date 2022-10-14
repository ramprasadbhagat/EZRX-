import 'package:ezrxmobile/domain/material/entities/price.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/price_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/price_tier_dto.dart';
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
    @JsonKey(name: 'TieredBonus', defaultValue: <PriceBonusDto>[])
        required List<PriceBonusDto> bonuses,
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
        materialNumber: materialNumber,
        rules: rules.map((e) => e.toDomain()).toList(),
        tiers: tiers.map((e) => e.toDomain()).toList(),
        bonuses: bonuses.map((e) => e.toDomain()).toList(),
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

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);
}
