// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approver_rights_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApproverRightsDetailsDto _$$_ApproverRightsDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ApproverRightsDetailsDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      principal: json['principal'] as String? ?? '',
      industryCode1: json['industryCode1'] as String? ?? '',
      industryCode2: json['industryCode2'] as String? ?? '',
      industryCode3: json['industryCode3'] as String? ?? '',
      industryCode4: json['industryCode4'] as String? ?? '',
      industryCode5: json['industryCode5'] as String? ?? '',
      plant: json['plant'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_ApproverRightsDetailsDtoToJson(
        _$_ApproverRightsDetailsDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'principal': instance.principal,
      'industryCode1': instance.industryCode1,
      'industryCode2': instance.industryCode2,
      'industryCode3': instance.industryCode3,
      'industryCode4': instance.industryCode4,
      'industryCode5': instance.industryCode5,
      'plant': instance.plant,
      'materialNumber': instance.materialNumber,
    };
