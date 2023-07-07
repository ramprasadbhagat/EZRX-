// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_addition_info_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartAdditionInfoProductDto _$$_CartAdditionInfoProductDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CartAdditionInfoProductDto(
      productImages: (json['orderCloudProduct'] as List<dynamic>)
          .map((e) => ProductImagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CartAdditionInfoProductDtoToJson(
        _$_CartAdditionInfoProductDto instance) =>
    <String, dynamic>{
      'orderCloudProduct':
          instance.productImages.map((e) => e.toJson()).toList(),
    };
