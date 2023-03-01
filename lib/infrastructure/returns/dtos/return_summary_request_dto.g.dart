// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryRequestDto _$$_ReturnSummaryRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnSummaryRequestDto(
      requestStatus: json['requestStatus'] as String? ?? '',
      submitDate: json['submitDate'] as String? ?? '',
      returnId: json['returnId'] as String? ?? '',
      refundTotal: json['refundTotal'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ReturnSummaryRequestItemsDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnSummaryRequestDtoToJson(
        _$_ReturnSummaryRequestDto instance) =>
    <String, dynamic>{
      'requestStatus': instance.requestStatus,
      'submitDate': instance.submitDate,
      'returnId': instance.returnId,
      'refundTotal': instance.refundTotal,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
