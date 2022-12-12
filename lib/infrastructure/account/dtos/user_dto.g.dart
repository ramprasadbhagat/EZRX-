// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String? ?? '',
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      role: RoleDto.fromJson(json['role'] as Map<String, dynamic>),
      customerCode: json['customerCode'] as String,
      userSalesOrganisations: json['userSalesOrganisationList'] == null
          ? []
          : const _SalesOrganisationListConverter().fromJson(
              json['userSalesOrganisationList'] as Map<String, dynamic>),
      emailNotifications: json['emailNotifications'] as bool? ?? false,
      mobileNotifications: json['mobileNotifications'] as bool? ?? false,
      languagePreference:
          handleEmptyLanguagePreference(json, 'languagePreference') as String,
      enableOrderType: json['enableOrderType'] as bool? ?? false,
      acceptPrivacyPolicy: json['acceptPrivacyPolicy'] as bool? ?? false,
      acceptPrivacyPolicyTime:
          dateTimeStringFormatCheck(json, 'acceptPrivacyPolicyTime')
                  as String? ??
              '1970-01-01 00:00:00',
      privacyPolicyAcceptedPlatform:
          json['privacyPolicyAcceptedPlatform'] as String? ?? '',
      hasBonusOverride: json['hasBonusOverride'] as bool? ?? false,
      disableCreateOrder: json['disableCreateOrder'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'customerCode': instance.customerCode,
      'userSalesOrganisationList': const _SalesOrganisationListConverter()
          .toJson(instance.userSalesOrganisations),
      'emailNotifications': instance.emailNotifications,
      'mobileNotifications': instance.mobileNotifications,
      'languagePreference': instance.languagePreference,
      'enableOrderType': instance.enableOrderType,
      'acceptPrivacyPolicy': instance.acceptPrivacyPolicy,
      'acceptPrivacyPolicyTime': instance.acceptPrivacyPolicyTime,
      'privacyPolicyAcceptedPlatform': instance.privacyPolicyAcceptedPlatform,
      'hasBonusOverride': instance.hasBonusOverride,
      'disableCreateOrder': instance.disableCreateOrder,
    };
