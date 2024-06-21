// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_configuration_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PolicyConfigurationDtoImpl _$$PolicyConfigurationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PolicyConfigurationDtoImpl(
      salesOrg: json['salesOrg'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      monthsBeforeExpiry: json['monthsBeforeExpiry'] as String? ?? '',
      monthsAfterExpiry: json['monthsAfterExpiry'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      returnsAllowed: json['returnsAllowed'] as bool? ?? false,
      principalName: json['principalName'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$PolicyConfigurationDtoImplToJson(
        _$PolicyConfigurationDtoImpl instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'principalCode': instance.principalCode,
      'monthsBeforeExpiry': instance.monthsBeforeExpiry,
      'monthsAfterExpiry': instance.monthsAfterExpiry,
      'uuid': instance.uuid,
      'returnsAllowed': instance.returnsAllowed,
      'principalName': instance.principalName,
      'status': instance.status,
    };
