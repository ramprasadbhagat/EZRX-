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
      materialNumber: json['ID'] as String? ?? '',
      xp: ProductItemXpDto.fromJson(json['XP'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductItemDtoToJson(_$_ProductItemDto instance) =>
    <String, dynamic>{
      'PromotionMaterial': instance.promotionMaterial,
      'ID': instance.materialNumber,
      'XP': instance.xp.toJson(),
    };

_$_ProductItemXpDto _$$_ProductItemXpDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductItemXpDto(
      dosage: json['Dosage'] as String? ?? '',
      howToUse: json['HowToUse'] as String? ?? '',
      composition: json['Composition'] as String? ?? '',
      deliveryInstructions: json['DeliveryInstructions'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductItemXpDtoToJson(_$_ProductItemXpDto instance) =>
    <String, dynamic>{
      'Dosage': instance.dosage,
      'HowToUse': instance.howToUse,
      'Composition': instance.composition,
      'DeliveryInstructions': instance.deliveryInstructions,
    };
