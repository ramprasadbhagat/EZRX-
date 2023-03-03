// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryFilterDto _$$_ReturnSummaryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnSummaryFilterDto(
      orderNumber: json['orderNumber'] as String? ?? '',
      poReference: json['poReference'] as String? ?? '',
      materialSearch: json['materialSearch'] as String? ?? '',
      principalSearch: json['principalSearch'] as String? ?? '',
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnSummaryFilterDtoToJson(
        _$_ReturnSummaryFilterDto instance) =>
    <String, dynamic>{
      'orderNumber': valueTojson(instance.orderNumber),
      'poReference': valueTojson(instance.poReference),
      'materialSearch': valueTojson(instance.materialSearch),
      'principalSearch': valueTojson(instance.principalSearch),
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
    };
