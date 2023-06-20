// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_order_history_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByOrderHistoryFilterDto _$$_ViewByOrderHistoryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByOrderHistoryFilterDto(
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_ViewByOrderHistoryFilterDtoToJson(
        _$_ViewByOrderHistoryFilterDto instance) =>
    <String, dynamic>{
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
    };
