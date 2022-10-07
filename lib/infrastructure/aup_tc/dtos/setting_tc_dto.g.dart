// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_tc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingTcDto _$$_SettingTcDtoFromJson(Map<String, dynamic> json) =>
    _$_SettingTcDto(
      acceptTC: json['acceptTC'] as bool,
      acceptTCTimestamp:
          dateTimeStringFormatCheck(json, 'acceptTCTimestamp') as String? ??
              '1970-01-01 00:00:00',
    );
