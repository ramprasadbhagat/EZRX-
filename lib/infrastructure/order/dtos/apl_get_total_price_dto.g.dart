// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_get_total_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AplGetTotalPriceDto _$$_AplGetTotalPriceDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AplGetTotalPriceDto(
      grandTotal: json['TotalPrice'] as int? ?? 0,
      tax: json['Tax'] as int? ?? 0,
      deliveryFee: json['DeliveryFee'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AplGetTotalPriceDtoToJson(
        _$_AplGetTotalPriceDto instance) =>
    <String, dynamic>{
      'TotalPrice': instance.grandTotal,
      'Tax': instance.tax,
      'DeliveryFee': instance.deliveryFee,
    };
