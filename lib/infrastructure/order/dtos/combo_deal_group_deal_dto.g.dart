// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_group_deal_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealGroupDealDtoAdapter
    extends TypeAdapter<_$_ComboDealGroupDealDto> {
  @override
  final int typeId = 27;

  @override
  _$_ComboDealGroupDealDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealGroupDealDto(
      minTotalAmount: fields[0] == null ? 0 : fields[0] as double,
      maxTotalAmount: fields[1] == null ? 0 : fields[1] as double,
      minTotalQuantity: fields[2] == null ? 0 : fields[2] as int,
      rate: fields[3] == null ? 0 : fields[3] as double,
      type: fields[4] == null ? '' : fields[4] as String,
      conditionNumber: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealGroupDealDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.minTotalAmount)
      ..writeByte(1)
      ..write(obj.maxTotalAmount)
      ..writeByte(2)
      ..write(obj.minTotalQuantity)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.conditionNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealGroupDealDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealGroupDealDto _$$_ComboDealGroupDealDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealGroupDealDto(
      minTotalAmount: json['minTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['minTotalAmount'] as String),
      maxTotalAmount: json['maxTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['maxTotalAmount'] as String),
      minTotalQuantity: json['minTotalQuantity'] == null
          ? 0
          : const StringToIntConverter()
              .fromJson(json['minTotalQuantity'] as String),
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      type: json['type'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealGroupDealDtoToJson(
        _$_ComboDealGroupDealDto instance) =>
    <String, dynamic>{
      'minTotalAmount':
          const StringToDoubleConverter().toJson(instance.minTotalAmount),
      'maxTotalAmount':
          const StringToDoubleConverter().toJson(instance.maxTotalAmount),
      'minTotalQuantity':
          const StringToIntConverter().toJson(instance.minTotalQuantity),
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'type': instance.type,
      'conditionNumber': instance.conditionNumber,
    };
