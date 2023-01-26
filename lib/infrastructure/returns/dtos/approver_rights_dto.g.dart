// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approver_rights_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddReturnApprovalLimitDto _$$_AddReturnApprovalLimitDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AddReturnApprovalLimitDto(
      usernames: (rawMetaDataOverride(json, 'rawMetaData') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      approverRights: (json['approverRights'] as List<dynamic>?)
              ?.map((e) =>
                  ApproverRightsDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_AddReturnApprovalLimitDtoToJson(
        _$_AddReturnApprovalLimitDto instance) =>
    <String, dynamic>{
      'rawMetaData': instance.usernames,
      'approverRights': instance.approverRights.map((e) => e.toJson()).toList(),
    };
