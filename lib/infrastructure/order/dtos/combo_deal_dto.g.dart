// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealDtoAdapter extends TypeAdapter<_$_ComboDealDto> {
  @override
  final int typeId = 24;

  @override
  _$_ComboDealDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealDto(
      groupDeal: fields[0] == null
          ? ComboDealGroupDealDto.empty
          : fields[0] as ComboDealGroupDealDto,
      flexiSKUTier: fields[1] == null
          ? []
          : (fields[1] as List).cast<ComboDealSKUTierDto>(),
      flexiQtyTier: fields[2] == null
          ? []
          : (fields[2] as List).cast<ComboDealQtyTierDto>(),
      flexiAmountTier: fields[3] == null
          ? []
          : (fields[3] as List).cast<ComboDealAmountTierDto>(),
      materialComboDeals: fields[4] == null
          ? []
          : (fields[4] as List).cast<ComboDealMaterialSetDto>(),
      flexiTierRule: fields[5] == null
          ? []
          : (fields[5] as List).cast<ComboDealTierRuleDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.groupDeal)
      ..writeByte(1)
      ..write(obj.flexiSKUTier)
      ..writeByte(2)
      ..write(obj.flexiQtyTier)
      ..writeByte(3)
      ..write(obj.flexiAmountTier)
      ..writeByte(4)
      ..write(obj.materialComboDeals)
      ..writeByte(5)
      ..write(obj.flexiTierRule);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealDto _$$_ComboDealDtoFromJson(Map<String, dynamic> json) =>
    _$_ComboDealDto(
      groupDeal: json['groupDeal'] == null
          ? ComboDealGroupDealDto.empty
          : ComboDealGroupDealDto.fromJson(
              json['groupDeal'] as Map<String, dynamic>),
      flexiSKUTier: (json['flexiSKUTier'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealSKUTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      flexiQtyTier: (json['flexiQtyTier'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealQtyTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      flexiAmountTier: (json['flexiAmmountTier'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealAmountTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materialComboDeals: (json['materialComboDeals'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealMaterialSetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      flexiTierRule: (json['flexiTierRule'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealTierRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ComboDealDtoToJson(_$_ComboDealDto instance) =>
    <String, dynamic>{
      'groupDeal': instance.groupDeal.toJson(),
      'flexiSKUTier': instance.flexiSKUTier.map((e) => e.toJson()).toList(),
      'flexiQtyTier': instance.flexiQtyTier.map((e) => e.toJson()).toList(),
      'flexiAmmountTier':
          instance.flexiAmountTier.map((e) => e.toJson()).toList(),
      'materialComboDeals':
          instance.materialComboDeals.map((e) => e.toJson()).toList(),
      'flexiTierRule': instance.flexiTierRule.map((e) => e.toJson()).toList(),
    };
