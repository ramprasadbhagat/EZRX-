// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_order_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByOrdersFilterDto _$$_ViewByOrdersFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByOrdersFilterDto(
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
      orderStatus: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ViewByOrdersFilterDtoToJson(
        _$_ViewByOrdersFilterDto instance) =>
    <String, dynamic>{
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
      'status': instance.orderStatus,
    };
