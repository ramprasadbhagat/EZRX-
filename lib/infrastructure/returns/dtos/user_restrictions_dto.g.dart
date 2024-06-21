// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_restrictions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRestrictionsDtoImpl _$$UserRestrictionsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRestrictionsDtoImpl(
      approverRights: ApproverRightsDto.fromJson(
          json['approverRights'] as Map<String, dynamic>),
      approverLimits: (json['returnApprovalLimit'] as List<dynamic>?)
              ?.map(
                  (e) => ApprovalLimitsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$UserRestrictionsDtoImplToJson(
        _$UserRestrictionsDtoImpl instance) =>
    <String, dynamic>{
      'approverRights': instance.approverRights.toJson(),
      'returnApprovalLimit':
          instance.approverLimits.map((e) => e.toJson()).toList(),
    };
