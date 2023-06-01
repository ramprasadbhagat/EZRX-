// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      role: json['role'] == null
          ? RoleDto.emptyRoleDto
          : RoleDto.fromJson(json['role'] as Map<String, dynamic>),
      customerCode: json['customerCode'] as String? ?? '',
      userSalesOrganisations: json['userSalesOrganisationList'] == null
          ? []
          : const _SalesOrganisationListConverter().fromJson(
              json['userSalesOrganisationList'] as Map<String, dynamic>),
      accessRight: json['accessRight'] == null
          ? AccessRightDto.emptyAccessRightDto
          : AccessRightDto.fromJson(
              json['accessRight'] as Map<String, dynamic>),
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
      disableReturns: json['disableReturns'] as bool? ?? false,
      hasPriceOverride: json['hasPriceOverride'] as bool? ?? false,
      disablePaymentNotification:
          json['disablePaymentNotification'] as bool? ?? false,
      paymentNotification: (json['paymentNotification'] as List<dynamic>?)
              ?.map((e) => PaymentAdviceExpiryNotificationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role.toJson(),
      'customerCode': instance.customerCode,
      'userSalesOrganisationList': const _SalesOrganisationListConverter()
          .toJson(instance.userSalesOrganisations),
      'accessRight': instance.accessRight.toJson(),
      'emailNotifications': instance.emailNotifications,
      'mobileNotifications': instance.mobileNotifications,
      'languagePreference': instance.languagePreference,
      'enableOrderType': instance.enableOrderType,
      'acceptPrivacyPolicy': instance.acceptPrivacyPolicy,
      'acceptPrivacyPolicyTime': instance.acceptPrivacyPolicyTime,
      'privacyPolicyAcceptedPlatform': instance.privacyPolicyAcceptedPlatform,
      'hasBonusOverride': instance.hasBonusOverride,
      'disableCreateOrder': instance.disableCreateOrder,
      'disableReturns': instance.disableReturns,
      'hasPriceOverride': instance.hasPriceOverride,
      'disablePaymentNotification': instance.disablePaymentNotification,
      'paymentNotification':
          instance.paymentNotification.map((e) => e.toJson()).toList(),
    };
