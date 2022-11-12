// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_info_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BundleInfoDtoAdapter extends TypeAdapter<_$_BundleInfoDto> {
  @override
  final int typeId = 16;

  @override
  _$_BundleInfoDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_BundleInfoDto(
      sequence: fields[21] == null ? 1 : fields[21] as int,
      quantity: fields[22] == null ? 1 : fields[22] as int,
      type: fields[23] == null ? '%' : fields[23] as String,
      rate: fields[24] == null ? -10 : fields[24] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_BundleInfoDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(21)
      ..write(obj.sequence)
      ..writeByte(22)
      ..write(obj.quantity)
      ..writeByte(23)
      ..write(obj.type)
      ..writeByte(24)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BundleInfoDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundleInfoDto _$$_BundleInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_BundleInfoDto(
      sequence: json['sequence'] as int,
      quantity: json['quantity'] as int,
      type: json['type'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BundleInfoDtoToJson(_$_BundleInfoDto instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'type': instance.type,
      'rate': instance.rate,
    };
