// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDto _$$_OrderHistoryDtoFromJson(Map<String, dynamic> json) =>
    _$_OrderHistoryDto(
      orderBasicInformation: OrderHistoryBasicInfoDto.fromJson(
          json['OrderBasicInformation'] as Map<String, dynamic>),
      orderItems: (json['OrderItems'] as List<dynamic>)
          .map((e) => OrderHistoryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderHistoryDtoToJson(_$_OrderHistoryDto instance) =>
    <String, dynamic>{
      'OrderBasicInformation': instance.orderBasicInformation.toJson(),
      'OrderItems': instance.orderItems.map((e) => e.toJson()).toList(),
    };
