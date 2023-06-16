// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryFilterDto _$$_ReturnSummaryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnSummaryFilterDto(
      orderStatus: (json['orderStatus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnSummaryFilterDtoToJson(
        _$_ReturnSummaryFilterDto instance) =>
    <String, dynamic>{
      'orderStatus': instance.orderStatus,
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
    };
