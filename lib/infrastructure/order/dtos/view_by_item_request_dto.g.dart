// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_item_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByItemRequestDto _$$_ViewByItemRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByItemRequestDto(
      salesOrg: (json['salesOrg'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      soldTo: json['soldTo'] as String? ?? '',
      shipTo: (json['shipTo'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      pageSize: json['first'] as int? ?? 0,
      offset: json['after'] as int? ?? 0,
      language: json['language'] as String? ?? '',
      searchKey: json['searchKey'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      orderStatus: (json['orderStatus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dateTo: json['toDate'] as String? ?? '',
      dateFrom: json['fromDate'] as String? ?? '',
      isOptimised: json['isOptimised'] as bool? ?? true,
      orderType: json['orderType'] as int?,
      isDetailsPage: json['isDetailsPage'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ViewByItemRequestDtoToJson(
    _$_ViewByItemRequestDto instance) {
  final val = <String, dynamic>{
    'salesOrg': instance.salesOrg,
    'soldTo': instance.soldTo,
    'shipTo': instance.shipTo,
    'first': instance.pageSize,
    'after': instance.offset,
    'language': instance.language,
    'searchKey': instance.searchKey,
    'orderNumber': instance.orderNumber,
    'orderStatus': instance.orderStatus,
    'toDate': instance.dateTo,
    'fromDate': instance.dateFrom,
    'isOptimised': instance.isOptimised,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderType', instance.orderType);
  val['isDetailsPage'] = instance.isDetailsPage;
  return val;
}
