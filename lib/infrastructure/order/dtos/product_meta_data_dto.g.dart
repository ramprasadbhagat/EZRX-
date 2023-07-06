// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMetaDataDto _$$_ProductMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMetaDataDto(
      productImages: (json['orderCloudProduct'] as List<dynamic>?)
              ?.map((e) => ProductImagesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      items: (json['Items'] as List<dynamic>?)
              ?.map((e) => ProductItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ProductMetaDataDtoToJson(
        _$_ProductMetaDataDto instance) =>
    <String, dynamic>{
      'orderCloudProduct':
          instance.productImages.map((e) => e.toJson()).toList(),
      'Items': instance.items.map((e) => e.toJson()).toList(),
    };

_$_ProductItemDto _$$_ProductItemDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductItemDto(
      promotionMaterial: json['PromotionMaterial'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductItemDtoToJson(_$_ProductItemDto instance) =>
    <String, dynamic>{
      'PromotionMaterial': instance.promotionMaterial,
    };
