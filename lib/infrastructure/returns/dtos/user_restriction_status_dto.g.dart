// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_restriction_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRestrictionStatusDto _$$_UserRestrictionStatusDtoFromJson(
        Map<String, dynamic> json) =>
    _$_UserRestrictionStatusDto(
      userRestrictionStatus:
          _userRestrictionOverride(json, 'approverRightStatus') as String? ??
              '',
      userReturnApprovalLimit:
          _userReturnApprovalLimitOverride(json, 'approvalLimitStatus')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$_UserRestrictionStatusDtoToJson(
        _$_UserRestrictionStatusDto instance) =>
    <String, dynamic>{
      'approverRightStatus': instance.userRestrictionStatus,
      'approvalLimitStatus': instance.userReturnApprovalLimit,
    };
