// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryFilterDto _$$_ReturnSummaryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnSummaryFilterDto(
      requestId: json['requestId'] as String? ?? '',
      refundTotalTo: json['refundTotalTo'] as String? ?? '',
      refundTotalFrom: json['refundTotalFrom'] as String? ?? '',
      dateTo: json['dateTo'] as String? ?? '',
      dateFrom: json['dateFrom'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnSummaryFilterDtoToJson(
        _$_ReturnSummaryFilterDto instance) =>
    <String, dynamic>{
      'requestId': valueTojson(instance.requestId),
      'refundTotalTo': valueTojson(instance.refundTotalTo),
      'refundTotalFrom': valueTojson(instance.refundTotalFrom),
      'dateTo': instance.dateTo,
      'dateFrom': instance.dateFrom,
      'status': instance.status,
    };
