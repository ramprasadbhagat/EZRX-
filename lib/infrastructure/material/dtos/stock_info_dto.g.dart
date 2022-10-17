// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockInfoDto _$$_StockInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_StockInfoDto(
      materialNumber: json['MaterialNumber'] as String,
      expiryDate: json['ExpiryDate'] as String,
      batch: json['Batch'] as String,
      inStock: json['InStock'] as String,
      salesDistrict: json['SalesDistrict'] as String?,
    );

Map<String, dynamic> _$$_StockInfoDtoToJson(_$_StockInfoDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'ExpiryDate': instance.expiryDate,
      'Batch': instance.batch,
      'InStock': instance.inStock,
      'SalesDistrict': instance.salesDistrict,
    };
