// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_restriction_list_raw_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRestrictionRawMetaDataDto _$$_UserRestrictionRawMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    _$_UserRestrictionRawMetaDataDto(
      usernames:
          (json['usernames'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UserRestrictionRawMetaDataDtoToJson(
        _$_UserRestrictionRawMetaDataDto instance) =>
    <String, dynamic>{
      'usernames': instance.usernames,
    };
