// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_dto.dart';

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
