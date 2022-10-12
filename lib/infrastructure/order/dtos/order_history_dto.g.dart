// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryItemDto _$$_OrderHistoryItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryItemDto(
      orderBasicInformation: OrderHistoryBasicInfoDto.fromJson(
          json['OrderBasicInformation'] as Map<String, dynamic>),
      orderItems: (json['OrderItems'] as List<dynamic>)
          .map((e) => OrderHistoryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderHistoryItemDtoToJson(
        _$_OrderHistoryItemDto instance) =>
    <String, dynamic>{
      'OrderBasicInformation': instance.orderBasicInformation,
      'OrderItems': instance.orderItems,
    };
