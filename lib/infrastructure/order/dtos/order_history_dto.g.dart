// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDtoImpl _$$OrderHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryDtoImpl(
      orderBasicInformation: OrderHistoryBasicInfoDto.fromJson(
          json['OrderBasicInformation'] as Map<String, dynamic>),
      orderItems: (json['OrderItems'] as List<dynamic>)
          .map((e) => OrderHistoryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderHistoryDtoImplToJson(
        _$OrderHistoryDtoImpl instance) =>
    <String, dynamic>{
      'OrderBasicInformation': instance.orderBasicInformation.toJson(),
      'OrderItems': instance.orderItems.map((e) => e.toJson()).toList(),
    };
