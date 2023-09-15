// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundleDto _$$_BundleDtoFromJson(Map<String, dynamic> json) => _$_BundleDto(
      bundleName: json['bundleName'] as String? ?? '',
      bundleCode: json['bundleCode'] as String? ?? '',
      bundleInformation: (json['bundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materials: (handleEmptyMaterialList(json, 'materials') as List<dynamic>)
          .map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: json['conditions'] as String? ?? '',
      bonusEligible: json['bonusEligible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BundleDtoToJson(_$_BundleDto instance) =>
    <String, dynamic>{
      'bundleName': instance.bundleName,
      'bundleCode': instance.bundleCode,
      'bundleInformation':
          instance.bundleInformation.map((e) => e.toJson()).toList(),
      'materials': instance.materials.map((e) => e.toJson()).toList(),
      'conditions': instance.conditions,
      'bonusEligible': instance.bonusEligible,
    };
