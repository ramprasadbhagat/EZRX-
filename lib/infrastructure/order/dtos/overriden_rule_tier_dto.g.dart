// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overriden_rule_tier_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OverridenRuleTierDtoAdapter extends TypeAdapter<_$_OverridenRuleTierDto> {
  @override
  final int typeId = 35;

  @override
  _$_OverridenRuleTierDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_OverridenRuleTierDto(
      rate: fields[19] == null ? 0 : fields[19] as double,
      quantity: fields[20] == null ? 0 : fields[20] as double,
      conditions: fields[21] == null ? '' : fields[21] as String,
      tier: fields[22] == null ? '' : fields[22] as String,
      overrider: fields[23] == null ? '' : fields[23] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_OverridenRuleTierDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(19)
      ..write(obj.rate)
      ..writeByte(20)
      ..write(obj.quantity)
      ..writeByte(21)
      ..write(obj.conditions)
      ..writeByte(22)
      ..write(obj.tier)
      ..writeByte(23)
      ..write(obj.overrider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverridenRuleTierDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OverridenRuleTierDto _$$_OverridenRuleTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OverridenRuleTierDto(
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['Quantity'] as num?)?.toDouble() ?? 0,
      conditions: json['Conditions'] as String? ?? '',
      tier: json['Tier'] as String? ?? '',
      overrider: json['Overrider'] as String? ?? '',
    );

Map<String, dynamic> _$$_OverridenRuleTierDtoToJson(
        _$_OverridenRuleTierDto instance) =>
    <String, dynamic>{
      'Rate': instance.rate,
      'Quantity': instance.quantity,
      'Conditions': instance.conditions,
      'Tier': instance.tier,
      'Overrider': instance.overrider,
    };
