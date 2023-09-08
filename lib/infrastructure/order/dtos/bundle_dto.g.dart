// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_dto.dart';

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
