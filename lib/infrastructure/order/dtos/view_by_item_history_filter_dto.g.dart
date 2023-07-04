// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_item_history_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByItemHistoryFilterDto _$$_ViewByItemHistoryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByItemHistoryFilterDto(
      orderStatus: (json['orderStatus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_ViewByItemHistoryFilterDtoToJson(
        _$_ViewByItemHistoryFilterDto instance) =>
    <String, dynamic>{
      'orderStatus': instance.orderStatus,
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
    };
