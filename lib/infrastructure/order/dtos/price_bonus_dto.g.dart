// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bonus_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceBonusDtoAdapter extends TypeAdapter<_$_PriceBonusDto> {
  @override
  final int typeId = 107;

  @override
  _$_PriceBonusDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceBonusDto(
      items: fields[25] == null
          ? []
          : (fields[25] as List).cast<PriceBonusItemDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceBonusDto obj) {
    writer
      ..writeByte(1)
      ..writeByte(25)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceBonusDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceBonusItemDtoAdapter extends TypeAdapter<_$_PriceBonusItemDto> {
  @override
  final int typeId = 108;

  @override
  _$_PriceBonusItemDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceBonusItemDto(
      calculation: fields[26] == null ? '' : fields[26] as String,
      qualifyingQuantity: fields[27] == null ? 0 : fields[27] as int,
      bonusMaterials: fields[28] == null
          ? []
          : (fields[28] as List).cast<BonusMaterialDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceBonusItemDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(26)
      ..write(obj.calculation)
      ..writeByte(27)
      ..write(obj.qualifyingQuantity)
      ..writeByte(28)
      ..write(obj.bonusMaterials);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceBonusItemDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BonusMaterialDtoAdapter extends TypeAdapter<_$_BonusMaterialDto> {
  @override
  final int typeId = 109;

  @override
  _$_BonusMaterialDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_BonusMaterialDto(
      materialNumber: fields[29] == null ? '' : fields[29] as String,
      materialDescription: fields[30] == null ? '' : fields[30] as String,
      calculation: fields[31] == null ? '' : fields[31] as String,
      bonusRatio: fields[32] == null ? 0 : fields[32] as int,
      qualifyingQuantity: fields[33] == null ? 0 : fields[33] as int,
      bonusQuantity: fields[34] == null ? 0 : fields[34] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_BonusMaterialDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(29)
      ..write(obj.materialNumber)
      ..writeByte(30)
      ..write(obj.materialDescription)
      ..writeByte(31)
      ..write(obj.calculation)
      ..writeByte(32)
      ..write(obj.bonusRatio)
      ..writeByte(33)
      ..write(obj.qualifyingQuantity)
      ..writeByte(34)
      ..write(obj.bonusQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BonusMaterialDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBonusDto _$$_PriceBonusDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusDto(
      items: (json['BonusTiers'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBonusItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusDtoToJson(_$_PriceBonusDto instance) =>
    <String, dynamic>{
      'BonusTiers': instance.items,
    };

_$_PriceBonusItemDto _$$_PriceBonusItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusItemDto(
      calculation: json['Calculation'] as String? ?? '',
      qualifyingQuantity: json['QualifyingQuantity'] as int? ?? 0,
      bonusMaterials: (json['BonusMaterial'] as List<dynamic>?)
              ?.map((e) => BonusMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusItemDtoToJson(
        _$_PriceBonusItemDto instance) =>
    <String, dynamic>{
      'Calculation': instance.calculation,
      'QualifyingQuantity': instance.qualifyingQuantity,
      'BonusMaterial': instance.bonusMaterials,
    };

_$_BonusMaterialDto _$$_BonusMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_BonusMaterialDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      calculation: json['Calculation'] as String? ?? '',
      bonusRatio: json['BonusRatio'] as int? ?? 0,
      qualifyingQuantity: json['QualifyingQuantity'] as int? ?? 0,
      bonusQuantity: json['BonusQuantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_BonusMaterialDtoToJson(_$_BonusMaterialDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Calculation': instance.calculation,
      'BonusRatio': instance.bonusRatio,
      'QualifyingQuantity': instance.qualifyingQuantity,
      'BonusQuantity': instance.bonusQuantity,
    };
