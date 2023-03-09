// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_qty_tier_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealQtyTierDtoAdapter extends TypeAdapter<_$_ComboDealQtyTierDto> {
  @override
  final int typeId = 29;

  @override
  _$_ComboDealQtyTierDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealQtyTierDto(
      rate: fields[0] == null ? 0 : fields[0] as double,
      conditionNumber: fields[1] == null ? '' : fields[1] as String,
      minQty: fields[2] == null ? 0 : fields[2] as int,
      type: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealQtyTierDto obj) {
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
      other is ComboDealQtyTierDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealQtyTierDto _$$_ComboDealQtyTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealQtyTierDto(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealQtyTierDtoToJson(
        _$_ComboDealQtyTierDto instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'type': instance.type,
    };
