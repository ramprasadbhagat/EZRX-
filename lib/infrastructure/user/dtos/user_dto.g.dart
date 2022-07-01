// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: RoleDto.fromJson(json['role'] as Map<String, dynamic>),
      customerCode: json['customerCode'] as String,
      userSalesOrganisations: (json['userSalesOrganisationList']
              as List<dynamic>)
          .map((e) => SalesOrganisationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailNotifications: json['emailNotifications'] as bool,
      mobileNotifications: json['mobileNotifications'] as bool,
      languagePreference: json['languagePreference'] as String,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'customerCode': instance.customerCode,
      'userSalesOrganisationList': instance.userSalesOrganisations,
      'emailNotifications': instance.emailNotifications,
      'mobileNotifications': instance.mobileNotifications,
      'languagePreference': instance.languagePreference,
    };
