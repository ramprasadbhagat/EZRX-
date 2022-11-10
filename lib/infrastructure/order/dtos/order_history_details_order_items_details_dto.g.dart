// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsOrderItemDetailsDto
    _$$_OrderHistoryDetailsOrderItemDetailsDtoFromJson(
            Map<String, dynamic> json) =>
        _$_OrderHistoryDetailsOrderItemDetailsDto(
          discountCode: json['DiscountCode'] as String,
          discountDescription: json['DiscountDescription'] as String,
          rate: json['Rate'] as String,
        );

Map<String, dynamic> _$$_OrderHistoryDetailsOrderItemDetailsDtoToJson(
        _$_OrderHistoryDetailsOrderItemDetailsDto instance) =>
    <String, dynamic>{
      'DiscountCode': instance.discountCode,
      'DiscountDescription': instance.discountDescription,
      'Rate': instance.rate,
    };
