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
      orderType: json['orderType'] as int?,
    );

Map<String, dynamic> _$$_ViewByOrdersFilterDtoToJson(
    _$_ViewByOrdersFilterDto instance) {
  final val = <String, dynamic>{
    'toDate': instance.dateTo,
    'fromDate': instance.dateFrom,
    'status': instance.orderStatus,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderType', instance.orderType);
  return val;
}
