// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryRequestInformationDto
    _$$_ReturnSummaryRequestInformationDtoFromJson(Map<String, dynamic> json) =>
        _$_ReturnSummaryRequestInformationDto(
          requestHeaderDto: RequestHeaderDto.fromJson(
              requestHeaderOverride(json, 'requestHeader')
                  as Map<String, dynamic>),
          requestInfo: (json['requestInformationV2'] as List<dynamic>?)
                  ?.map(
                      (e) => RequestInfoDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$$_ReturnSummaryRequestInformationDtoToJson(
        _$_ReturnSummaryRequestInformationDto instance) =>
    <String, dynamic>{
      'requestHeader': instance.requestHeaderDto.toJson(),
      'requestInformationV2':
          instance.requestInfo.map((e) => e.toJson()).toList(),
    };
