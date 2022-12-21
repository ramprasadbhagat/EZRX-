// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tier_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceTierDtoAdapter extends TypeAdapter<_$_PriceTierDto> {
  @override
  final int typeId = 8;

  @override
  _$_PriceTierDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceTierDto(
      tier: fields[19] == null ? '' : fields[19] as String,
      items: fields[20] == null
          ? []
          : (fields[20] as List).cast<PriceTierItemDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceTierDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(19)
      ..write(obj.tier)
      ..writeByte(20)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceTierDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceTierItemDtoAdapter extends TypeAdapter<_$_PriceTierItemDto> {
  @override
  final int typeId = 9;

  @override
  _$_PriceTierItemDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceTierItemDto(
      type: fields[21] == null ? '' : fields[21] as String,
      applyBonus: fields[22] == null ? false : fields[22] as bool,
      sequence: fields[23] == null ? 0 : fields[23] as int,
      quantity: fields[24] == null ? 0 : fields[24] as int,
      rate: fields[6] == null ? 0 : fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceTierItemDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(21)
      ..write(obj.type)
      ..writeByte(22)
      ..write(obj.applyBonus)
      ..writeByte(23)
      ..write(obj.sequence)
      ..writeByte(24)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceTierItemDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceTierDto _$$_PriceTierDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceTierDto(
      tier: json['Tier'] as String? ?? '',
      items: (json['PriceTier'] as List<dynamic>?)
              ?.map((e) => PriceTierItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceTierDtoToJson(_$_PriceTierDto instance) =>
    <String, dynamic>{
      'Tier': instance.tier,
      'PriceTier': instance.items.map((e) => e.toJson()).toList(),
    };

_$_PriceTierItemDto _$$_PriceTierItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceTierItemDto(
      type: json['Type'] as String? ?? '',
      applyBonus: json['ApplyBonus'] as bool? ?? false,
      sequence: json['Sequence'] as int? ?? 0,
      quantity: json['Quantity'] as int? ?? 0,
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PriceTierItemDtoToJson(_$_PriceTierItemDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'ApplyBonus': instance.applyBonus,
      'Sequence': instance.sequence,
      'Quantity': instance.quantity,
      'Rate': instance.rate,
    };
