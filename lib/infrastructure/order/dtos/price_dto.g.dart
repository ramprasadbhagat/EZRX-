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
      rules: fields[1] == null ? [] : (fields[1] as List).cast<PriceRuleDto>(),
      tiers: fields[2] == null ? [] : (fields[2] as List).cast<PriceTierDto>(),
      bonuses:
          fields[3] == null ? [] : (fields[3] as List).cast<PriceBonusDto>(),
      bundles:
          fields[4] == null ? [] : (fields[4] as List).cast<PriceBundleDto>(),
      overrideRulePresent: fields[5] == null ? false : fields[5] as bool,
      zdp5MaxQuota: fields[6] == null ? '' : fields[6] as String,
      zdp5RemainingQuota: fields[7] == null ? '' : fields[7] as String,
      zmgDiscount: fields[8] == null ? false : fields[8] as bool,
      listPrice: fields[9] == null ? 0 : fields[9] as double,
      finalIndividualPrice: fields[10] == null ? 0 : fields[10] as double,
      finalTotalPrice: fields[11] == null ? 0 : fields[11] as double,
      additionalBonusEligible: fields[12] == null ? false : fields[12] as bool,
      isValid: fields[13] == null ? false : fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceDto obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.materialNumber)
      ..writeByte(5)
      ..write(obj.overrideRulePresent)
      ..writeByte(6)
      ..write(obj.zdp5MaxQuota)
      ..writeByte(7)
      ..write(obj.zdp5RemainingQuota)
      ..writeByte(8)
      ..write(obj.zmgDiscount)
      ..writeByte(9)
      ..write(obj.listPrice)
      ..writeByte(10)
      ..write(obj.finalIndividualPrice)
      ..writeByte(11)
      ..write(obj.finalTotalPrice)
      ..writeByte(12)
      ..write(obj.additionalBonusEligible)
      ..writeByte(13)
      ..write(obj.isValid)
      ..writeByte(1)
      ..write(obj.rules)
      ..writeByte(2)
      ..write(obj.tiers)
      ..writeByte(3)
      ..write(obj.bonuses)
      ..writeByte(4)
      ..write(obj.bundles);
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
      materialNumber: json['MaterialNumber'] as String,
      rules: (json['PriceRules'] as List<dynamic>?)
              ?.map((e) => PriceRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tiers: (json['TieredPricing'] as List<dynamic>?)
              ?.map((e) => PriceTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bonuses: (json['Bonuses'] as List<dynamic>?)
              ?.map((e) => PriceBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bundles: (json['Bundles'] as List<dynamic>?)
              ?.map((e) => PriceBundleDto.fromJson(e as Map<String, dynamic>))
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
      'Bonuses': instance.bonuses,
      'Bundles': instance.bundles,
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
