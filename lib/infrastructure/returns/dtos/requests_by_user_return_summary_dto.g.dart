// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_by_user_return_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryRequestByUserDto _$$_ReturnSummaryRequestByUserDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnSummaryRequestByUserDto(
      requestIds: (json['requestIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      requests: (json['requests'] as List<dynamic>?)
              ?.map((e) =>
                  ReturnSummaryRequestDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnSummaryRequestByUserDtoToJson(
        _$_ReturnSummaryRequestByUserDto instance) =>
    <String, dynamic>{
      'requestIds': instance.requestIds,
      'requests': instance.requests.map((e) => e.toJson()).toList(),
    };
