// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_sku_tier_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealSKUTierDtoAdapter extends TypeAdapter<_$_ComboDealSKUTierDto> {
  @override
  final int typeId = 28;

  @override
  _$_ComboDealSKUTierDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealSKUTierDto(
      rate: fields[0] == null ? 0 : fields[0] as double,
      conditionNumber: fields[1] == null ? '' : fields[1] as String,
      minQty: fields[2] == null ? 0 : fields[2] as int,
      type: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealSKUTierDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.conditionNumber)
      ..writeByte(2)
      ..write(obj.minQty)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealSKUTierDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealSKUTierDto _$$_ComboDealSKUTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealSKUTierDto(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealSKUTierDtoToJson(
        _$_ComboDealSKUTierDto instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'type': instance.type,
    };
