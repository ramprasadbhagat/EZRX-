// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryFilterDto _$$_OrderHistoryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryFilterDto(
      orderStatus: (json['orderStatus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderHistoryFilterDtoToJson(
        _$_OrderHistoryFilterDto instance) =>
    <String, dynamic>{
      'orderStatus': instance.orderStatus,
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
    };
