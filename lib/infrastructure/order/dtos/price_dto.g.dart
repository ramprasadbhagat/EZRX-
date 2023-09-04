// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceDtoAdapter extends TypeAdapter<_$_PriceDto> {
  @override
  final int typeId = 6;

  @override
  _$_PriceDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceDto(
      materialNumber: fields[0] == null ? '' : fields[0] as String,
      oldMaterialCode: fields[1] == null ? '' : fields[1] as String,
      listPrice: fields[2] == null ? 0 : fields[2] as double,
      finalIndividualPrice: fields[3] == null ? 0 : fields[3] as double,
      finalTotalPrice: fields[4] == null ? 0 : fields[4] as double,
      rules: fields[5] == null ? [] : (fields[5] as List).cast<PriceRuleDto>(),
      bonuses:
          fields[6] == null ? [] : (fields[6] as List).cast<PriceBonusDto>(),
      tiers: fields[7] == null ? [] : (fields[7] as List).cast<PriceTierDto>(),
      bundles:
          fields[8] == null ? [] : (fields[8] as List).cast<PriceBundleDto>(),
      isValid: fields[9] == null ? false : fields[9] as bool,
      additionalBonusEligible: fields[10] == null ? false : fields[10] as bool,
      zmgDiscount: fields[11] == null ? false : fields[11] as bool,
      zdp5MaxQuota: fields[12] == null ? '' : fields[12] as String,
      zdp5RemainingQuota: fields[13] == null ? '' : fields[13] as String,
      exceedQty: fields[14] == null ? false : fields[14] as bool,
      overrideRulePresent: fields[15] == null ? false : fields[15] as bool,
      overridenRules:
          fields[16] == null ? [] : (fields[16] as List).cast<PriceRuleDto>(),
      overridenRuleTier: fields[17] == null
          ? []
          : (fields[17] as List).cast<OverridenRuleTierDto>(),
      isPriceOverride: fields[18] == null ? false : fields[18] as bool,
      zdp8Override: fields[19] == null ? 0 : fields[19] as double,
      priceOverride: fields[20] == null ? 0 : fields[20] as double,
      comboDeal: fields[21] == null
          ? PriceComboDealDto.empty
          : fields[21] as PriceComboDealDto,
      isDiscountOverride: fields[22] == null ? false : fields[22] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceDto obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.materialNumber)
      ..writeByte(1)
      ..write(obj.oldMaterialCode)
      ..writeByte(2)
      ..write(obj.listPrice)
      ..writeByte(3)
      ..write(obj.finalIndividualPrice)
      ..writeByte(4)
      ..write(obj.finalTotalPrice)
      ..writeByte(9)
      ..write(obj.isValid)
      ..writeByte(10)
      ..write(obj.additionalBonusEligible)
      ..writeByte(11)
      ..write(obj.zmgDiscount)
      ..writeByte(12)
      ..write(obj.zdp5MaxQuota)
      ..writeByte(13)
      ..write(obj.zdp5RemainingQuota)
      ..writeByte(14)
      ..write(obj.exceedQty)
      ..writeByte(15)
      ..write(obj.overrideRulePresent)
      ..writeByte(18)
      ..write(obj.isPriceOverride)
      ..writeByte(19)
      ..write(obj.zdp8Override)
      ..writeByte(20)
      ..write(obj.priceOverride)
      ..writeByte(21)
      ..write(obj.comboDeal)
      ..writeByte(22)
      ..write(obj.isDiscountOverride)
      ..writeByte(5)
      ..write(obj.rules)
      ..writeByte(6)
      ..write(obj.bonuses)
      ..writeByte(7)
      ..write(obj.tiers)
      ..writeByte(8)
      ..write(obj.bundles)
      ..writeByte(16)
      ..write(obj.overridenRules)
      ..writeByte(17)
      ..write(obj.overridenRuleTier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
