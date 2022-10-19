// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_bundle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialBundleDto _$$_MaterialBundleDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialBundleDto(
      materialNumber: json['MaterialNumber'] as String,
      bundles: (json['Bundles'] as List<dynamic>?)
              ?.map((e) => BundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialBundleDtoToJson(
        _$_MaterialBundleDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'Bundles': instance.bundles,
    };
