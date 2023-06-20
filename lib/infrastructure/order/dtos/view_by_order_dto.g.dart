// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByOrderHistoryDto _$$_ViewByOrderHistoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByOrderHistoryDto(
      orderCount: json['orderCount'] as int? ?? 0,
      creatingOrderIds: (json['creatingOrderIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      orderHeaders: (json['orderHeaders'] as List<dynamic>?)
              ?.map((e) => OrderHistoryDetailsOrderHeadersDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ViewByOrderHistoryDtoToJson(
        _$_ViewByOrderHistoryDto instance) =>
    <String, dynamic>{
      'orderCount': instance.orderCount,
      'creatingOrderIds': instance.creatingOrderIds,
      'orderHeaders': instance.orderHeaders.map((e) => e.toJson()).toList(),
    };
