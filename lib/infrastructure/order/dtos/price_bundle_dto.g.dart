// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bundle_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceBundleDtoAdapter extends TypeAdapter<_$_PriceBundleDto> {
  @override
  final int typeId = 110;

  @override
  _$_PriceBundleDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceBundleDto(
      name: fields[35] == null ? '' : fields[35] as String,
      code: fields[36] == null ? '' : fields[36] as String,
      information: fields[37] == null
          ? []
          : (fields[37] as List).cast<PriceBundleItemDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceBundleDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(35)
      ..write(obj.name)
      ..writeByte(36)
      ..write(obj.code)
      ..writeByte(37)
      ..write(obj.information);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceBundleDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceBundleItemDtoAdapter extends TypeAdapter<_$_PriceBundleItemDto> {
  @override
  final int typeId = 111;

  @override
  _$_PriceBundleItemDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceBundleItemDto(
      type: fields[38] == null ? '' : fields[38] as String,
      sequence: fields[39] == null ? 0 : fields[39] as int,
      quantity: fields[40] == null ? 0 : fields[40] as int,
      rate: fields[41] == null ? 0 : fields[41] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceBundleItemDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(38)
      ..write(obj.type)
      ..writeByte(39)
      ..write(obj.sequence)
      ..writeByte(40)
      ..write(obj.quantity)
      ..writeByte(41)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceBundleItemDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBundleDto _$$_PriceBundleDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBundleDto(
      name: json['BundleName'] as String? ?? '',
      code: json['BundleCode'] as String? ?? '',
      information: (json['BundleInformation'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBundleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBundleDtoToJson(_$_PriceBundleDto instance) =>
    <String, dynamic>{
      'BundleName': instance.name,
      'BundleCode': instance.code,
      'BundleInformation': instance.information,
    };

_$_PriceBundleItemDto _$$_PriceBundleItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceBundleItemDto(
      type: json['Type'] as String? ?? '',
      sequence: json['Sequence'] as int? ?? 0,
      quantity: json['Quantity'] as int? ?? 0,
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PriceBundleItemDtoToJson(
        _$_PriceBundleItemDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Sequence': instance.sequence,
      'Quantity': instance.quantity,
      'Rate': instance.rate,
    };
