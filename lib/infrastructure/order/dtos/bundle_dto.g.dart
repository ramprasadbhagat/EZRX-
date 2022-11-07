// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BundleDtoAdapter extends TypeAdapter<_$_BundleDto> {
  @override
  final int typeId = 15;

  @override
  _$_BundleDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_BundleDto(
      bundleName: fields[18] as String,
      bundleCode: fields[19] as String,
      bundleInformation: (fields[20] as List).cast<BundleInfoDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_BundleDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(18)
      ..write(obj.bundleName)
      ..writeByte(19)
      ..write(obj.bundleCode)
      ..writeByte(20)
      ..write(obj.bundleInformation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BundleDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundleDto _$$_BundleDtoFromJson(Map<String, dynamic> json) => _$_BundleDto(
      bundleName: json['bundleName'] as String,
      bundleCode: json['bundleCode'] as String,
      bundleInformation: (json['bundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_BundleDtoToJson(_$_BundleDto instance) =>
    <String, dynamic>{
      'bundleName': instance.bundleName,
      'bundleCode': instance.bundleCode,
      'bundleInformation': instance.bundleInformation,
    };
