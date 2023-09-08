// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceDto _$$_PriceDtoFromJson(Map<String, dynamic> json) => _$_PriceDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      oldMaterialCode: json['OldMaterialCode'] as String? ?? '',
      listPrice: (json['ListPrice'] as num?)?.toDouble() ?? 0,
      finalIndividualPrice:
          (json['FinalIndividualPrice'] as num?)?.toDouble() ?? 0,
      finalTotalPrice: (json['FinalTotalPrice'] as num?)?.toDouble() ?? 0,
      rules: (json['PriceRules'] as List<dynamic>?)
              ?.map((e) => PriceRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bonuses: (json['Bonuses'] as List<dynamic>?)
              ?.map((e) => PriceBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tiers: (json['TieredPricing'] as List<dynamic>?)
              ?.map((e) => PriceTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bundles: (json['Bundles'] as List<dynamic>?)
              ?.map((e) => PriceBundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isValid: json['Valid'] as bool? ?? false,
      additionalBonusEligible:
          json['AdditionalBonusEligible'] as bool? ?? false,
      zmgDiscount: json['ZMGDiscount'] as bool? ?? false,
      zdp5MaxQuota: json['ZDP5MaxQuota'] as String? ?? '',
      zdp5RemainingQuota: json['ZDP5RemainingQuota'] as String? ?? '',
      exceedQty: json['ExceedQty'] as bool? ?? false,
      overrideRulePresent: json['OverridenRulePresent'] as bool? ?? false,
      overridenRules: (json['OverridenRules'] as List<dynamic>?)
              ?.map((e) => PriceRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      overridenRuleTier: (json['OverridenRuleTier'] as List<dynamic>?)
              ?.map((e) =>
                  OverridenRuleTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isPriceOverride: json['isPriceOverride'] as bool? ?? false,
      zdp8Override: (json['zdp8Override'] as num?)?.toDouble() ?? 0,
      priceOverride: (json['priceOverride'] as num?)?.toDouble() ?? 0,
      comboDeal: json['ComboDeals'] == null
          ? PriceComboDealDto.empty
          : PriceComboDealDto.fromJson(
              json['ComboDeals'] as Map<String, dynamic>),
      isDiscountOverride: json['isDiscountOverride'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PriceDtoToJson(_$_PriceDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'OldMaterialCode': instance.oldMaterialCode,
      'ListPrice': instance.listPrice,
      'FinalIndividualPrice': instance.finalIndividualPrice,
      'FinalTotalPrice': instance.finalTotalPrice,
      'PriceRules': instance.rules.map((e) => e.toJson()).toList(),
      'Bonuses': instance.bonuses.map((e) => e.toJson()).toList(),
      'TieredPricing': instance.tiers.map((e) => e.toJson()).toList(),
      'Bundles': instance.bundles.map((e) => e.toJson()).toList(),
      'Valid': instance.isValid,
      'AdditionalBonusEligible': instance.additionalBonusEligible,
      'ZMGDiscount': instance.zmgDiscount,
      'ZDP5MaxQuota': instance.zdp5MaxQuota,
      'ZDP5RemainingQuota': instance.zdp5RemainingQuota,
      'ExceedQty': instance.exceedQty,
      'OverridenRulePresent': instance.overrideRulePresent,
      'OverridenRules': instance.overridenRules.map((e) => e.toJson()).toList(),
      'OverridenRuleTier':
          instance.overridenRuleTier.map((e) => e.toJson()).toList(),
      'isPriceOverride': instance.isPriceOverride,
      'zdp8Override': instance.zdp8Override,
      'priceOverride': instance.priceOverride,
      'ComboDeals': instance.comboDeal.toJson(),
      'isDiscountOverride': instance.isDiscountOverride,
    };
