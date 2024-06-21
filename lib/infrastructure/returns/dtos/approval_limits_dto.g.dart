// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_limits_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApprovalLimitsDtoImpl _$$ApprovalLimitsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ApprovalLimitsDtoImpl(
      salesOrg: json['salesOrg'] as String? ?? '',
      valueLowerLimit: (json['valueLowerLimit'] as num?)?.toInt() ?? 0,
      valueUpperLimit: (json['valueUpperLimit'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
    );

Map<String, dynamic> _$$ApprovalLimitsDtoImplToJson(
        _$ApprovalLimitsDtoImpl instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'valueLowerLimit': instance.valueLowerLimit,
      'valueUpperLimit': instance.valueUpperLimit,
      'username': instance.username,
      'uuid': instance.uuid,
    };
