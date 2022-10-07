// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_aup_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingAupDto _$$_SettingAupDtoFromJson(Map<String, dynamic> json) =>
    _$_SettingAupDto(
      acceptAUP: json['acceptAUP'] as bool,
      acceptAUPTimestamp:
          dateTimeStringFormatCheck(json, 'acceptAUPTC') as String? ??
              '1970-01-01 00:00:00',
    );
