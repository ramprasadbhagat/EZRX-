// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approver_rights_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddReturnApprovalLimitDtoImpl _$$AddReturnApprovalLimitDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AddReturnApprovalLimitDtoImpl(
      usernames:
          (JsonReadValueHelper.readRawMetaDataOverride(json, 'rawMetaData')
                      as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      approverRights: (json['approverRights'] as List<dynamic>?)
              ?.map((e) =>
                  ApproverRightsDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$AddReturnApprovalLimitDtoImplToJson(
        _$AddReturnApprovalLimitDtoImpl instance) =>
    <String, dynamic>{
      'rawMetaData': instance.usernames,
      'approverRights': instance.approverRights.map((e) => e.toJson()).toList(),
    };
