// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_images_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductImagesDto _$$_ProductImagesDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductImagesDto(
      materialNumber: json['materialID'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      thumbNail: json['thumbNail'] as String? ?? '',
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_ProductImagesDtoToJson(_$_ProductImagesDto instance) =>
    <String, dynamic>{
      'materialID': instance.materialNumber,
      'name': instance.name,
      'description': instance.description,
      'thumbNail': instance.thumbNail,
      'image': instance.image,
    };
