// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_restriction_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRestrictionStatusDtoImpl _$$UserRestrictionStatusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRestrictionStatusDtoImpl(
      userRestrictionStatus:
          _userRestrictionOverride(json, 'approverRightStatus') as String? ??
              '',
      userReturnApprovalLimit:
          _userReturnApprovalLimitOverride(json, 'approvalLimitStatus')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$UserRestrictionStatusDtoImplToJson(
        _$UserRestrictionStatusDtoImpl instance) =>
    <String, dynamic>{
      'approverRightStatus': instance.userRestrictionStatus,
      'approvalLimitStatus': instance.userReturnApprovalLimit,
    };
