// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approver_return_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApproverReturnRequestDto _$$_ApproverReturnRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ApproverReturnRequestDto(
      requestHeader: ApproverReturnRequestInformationHeaderDto.fromJson(
          json['requestHeader'] as Map<String, dynamic>),
      requestInformation: (json['requestInformationV2'] as List<dynamic>?)
              ?.map((e) => ApproverReturnRequestInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ApproverReturnRequestDtoToJson(
        _$_ApproverReturnRequestDto instance) =>
    <String, dynamic>{
      'requestHeader': instance.requestHeader.toJson(),
      'requestInformationV2':
          instance.requestInformation.map((e) => e.toJson()).toList(),
    };
