// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_item_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByItemFilterDto _$$_ViewByItemFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByItemFilterDto(
      orderStatus: (json['orderStatus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_ViewByItemFilterDtoToJson(
        _$_ViewByItemFilterDto instance) =>
    <String, dynamic>{
      'orderStatus': instance.orderStatus,
      'toDate': instance.dateTo,
      'fromDate': instance.dateFrom,
    };
