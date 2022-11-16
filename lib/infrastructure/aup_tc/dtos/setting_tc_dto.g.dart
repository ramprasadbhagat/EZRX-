// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_tc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingTcDto _$$_SettingTcDtoFromJson(Map<String, dynamic> json) =>
    _$_SettingTcDto(
      acceptPrivacyPolicy: json['acceptPrivacyPolicy'] as bool? ?? false,
      acceptPrivacyPolicyTime:
          dateTimeStringFormatCheck(json, 'acceptPrivacyPolicyTime')
                  as String? ??
              '1970-01-01 00:00:00',
      privacyPolicyAcceptedPlatform:
          json['privacyPolicyAcceptedPlatform'] as String? ?? '',
    );
