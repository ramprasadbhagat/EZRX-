// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'returns_overview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnsOverviewDto _$$_ReturnsOverviewDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnsOverviewDto(
      requestSubmitted: json['requestSubmitted'] as int? ?? 0,
      requestPendingApproval: json['requestPendingApproval'] as int? ?? 0,
      requestRejected: json['requestRejected'] as int? ?? 0,
      requestForApproval: json['requestForApproval'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ReturnsOverviewDtoToJson(
        _$_ReturnsOverviewDto instance) =>
    <String, dynamic>{
      'requestSubmitted': instance.requestSubmitted,
      'requestPendingApproval': instance.requestPendingApproval,
      'requestRejected': instance.requestRejected,
      'requestForApproval': instance.requestForApproval,
    };
