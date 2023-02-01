// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_limits_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApprovalLimitsDto _$$_ApprovalLimitsDtoFromJson(Map<String, dynamic> json) =>
    _$_ApprovalLimitsDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      valueLowerLimit: json['valueLowerLimit'] as int? ?? 0,
      valueUpperLimit: json['valueUpperLimit'] as int? ?? 0,
      username: json['username'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
    );

Map<String, dynamic> _$$_ApprovalLimitsDtoToJson(
        _$_ApprovalLimitsDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'valueLowerLimit': instance.valueLowerLimit,
      'valueUpperLimit': instance.valueUpperLimit,
      'username': instance.username,
      'uuid': instance.uuid,
    };
