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
      bundleName: fields[18] == null ? '' : fields[18] as String,
      bundleCode: fields[19] == null ? '' : fields[19] as String,
      bundleInformation:
          fields[20] == null ? [] : (fields[20] as List).cast<BundleInfoDto>(),
      materials:
          fields[21] == null ? [] : (fields[21] as List).cast<MaterialDto>(),
      conditions: fields[22] == null ? '' : fields[22] as String,
      bonusEligible: fields[23] == null ? false : fields[23] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_BundleDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(18)
      ..write(obj.bundleName)
      ..writeByte(19)
      ..write(obj.bundleCode)
      ..writeByte(22)
      ..write(obj.conditions)
      ..writeByte(23)
      ..write(obj.bonusEligible)
      ..writeByte(20)
      ..write(obj.bundleInformation)
      ..writeByte(21)
      ..write(obj.materials);
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
      bundleName: json['BundleName'] as String? ?? '',
      bundleCode: json['BundleCode'] as String? ?? '',
      bundleInformation: (json['BundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materials: (handleEmptyMaterialList(json, 'materials') as List<dynamic>)
          .map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: json['Conditions'] as String? ?? '',
      bonusEligible: json['BonusEligible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BundleDtoToJson(_$_BundleDto instance) =>
    <String, dynamic>{
      'BundleName': instance.bundleName,
      'BundleCode': instance.bundleCode,
      'BundleInformation':
          instance.bundleInformation.map((e) => e.toJson()).toList(),
      'materials': instance.materials.map((e) => e.toJson()).toList(),
      'Conditions': instance.conditions,
      'BonusEligible': instance.bonusEligible,
    };
