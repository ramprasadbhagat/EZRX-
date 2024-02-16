// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp_remote_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MPRemoteConfigDto _$$_MPRemoteConfigDtoFromJson(Map<String, dynamic> json) =>
    _$_MPRemoteConfigDto(
      marketplaceConfig: MPRemoteConfigValueDto.fromJson(
          json['marketplaceConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MPRemoteConfigDtoToJson(
        _$_MPRemoteConfigDto instance) =>
    <String, dynamic>{
      'marketplaceConfig': instance.marketplaceConfig.toJson(),
    };

_$_MPRemoteConfigValueDto _$$_MPRemoteConfigValueDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MPRemoteConfigValueDto(
      whiteList:
          (json['whitelist'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_MPRemoteConfigValueDtoToJson(
        _$_MPRemoteConfigValueDto instance) =>
    <String, dynamic>{
      'whitelist': instance.whiteList,
    };
