// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceDto _$$_PriceDtoFromJson(Map<String, dynamic> json) => _$_PriceDto(
      materialNumber: json['MaterialNumber'] as String,
      rules: (json['PriceRules'] as List<dynamic>?)
              ?.map((e) => PriceRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tiers: (json['TieredPricing'] as List<dynamic>?)
              ?.map((e) => PriceTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bonuses: (json['TieredBonus'] as List<dynamic>?)
              ?.map((e) => PriceBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      overrideRulePresent: json['OverridenRulePresent'] as bool? ?? false,
      zdp5MaxQuota: json['ZDP5MaxQuota'] as String? ?? '',
      zdp5RemainingQuota: json['ZDP5RemainingQuota'] as String? ?? '',
      zmgDiscount: json['ZMGDiscount'] as bool? ?? false,
      listPrice: (json['ListPrice'] as num?)?.toDouble() ?? 0,
      finalIndividualPrice:
          (json['FinalIndividualPrice'] as num?)?.toDouble() ?? 0,
      finalTotalPrice: (json['FinalTotalPrice'] as num?)?.toDouble() ?? 0,
      additionalBonusEligible:
          json['AdditionalBonusEligible'] as bool? ?? false,
      isValid: json['Valid'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PriceDtoToJson(_$_PriceDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'PriceRules': instance.rules,
      'TieredPricing': instance.tiers,
      'TieredBonus': instance.bonuses,
      'OverridenRulePresent': instance.overrideRulePresent,
      'ZDP5MaxQuota': instance.zdp5MaxQuota,
      'ZDP5RemainingQuota': instance.zdp5RemainingQuota,
      'ZMGDiscount': instance.zmgDiscount,
      'ListPrice': instance.listPrice,
      'FinalIndividualPrice': instance.finalIndividualPrice,
      'FinalTotalPrice': instance.finalTotalPrice,
      'AdditionalBonusEligible': instance.additionalBonusEligible,
      'Valid': instance.isValid,
    };
