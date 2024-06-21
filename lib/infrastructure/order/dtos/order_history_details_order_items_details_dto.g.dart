// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsOrderItemDetailsDtoImpl
    _$$OrderHistoryDetailsOrderItemDetailsDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$OrderHistoryDetailsOrderItemDetailsDtoImpl(
          discountCode: json['DiscountCode'] as String? ?? '',
          discountDescription: json['DiscountDescription'] as String? ?? '',
          rate: json['Rate'] as String? ?? '',
        );

Map<String, dynamic> _$$OrderHistoryDetailsOrderItemDetailsDtoImplToJson(
        _$OrderHistoryDetailsOrderItemDetailsDtoImpl instance) =>
    <String, dynamic>{
      'DiscountCode': instance.discountCode,
      'DiscountDescription': instance.discountDescription,
      'Rate': instance.rate,
    };
