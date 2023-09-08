// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialStockInfoDto _$$_MaterialStockInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialStockInfoDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      stockInformation: (json['StockInformation'] as List<dynamic>?)
              ?.map((e) => StockInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialStockInfoDtoToJson(
        _$_MaterialStockInfoDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'StockInformation':
          instance.stockInformation.map((e) => e.toJson()).toList(),
    };

_$_StockInfoDto _$$_StockInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_StockInfoDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      expiryDate: json['ExpiryDate'] as String? ?? '',
      batch: json['Batch'] as String? ?? '',
      inStock: json['InStock'] as String? ?? '',
      salesDistrict: json['SalesDistrict'] as String? ?? '',
    );

Map<String, dynamic> _$$_StockInfoDtoToJson(_$_StockInfoDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'ExpiryDate': instance.expiryDate,
      'Batch': instance.batch,
      'InStock': instance.inStock,
      'SalesDistrict': instance.salesDistrict,
    };
