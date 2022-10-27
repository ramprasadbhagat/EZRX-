// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerDto _$$_BannerDtoFromJson(Map<String, dynamic> json) => _$_BannerDto(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      buttonLabel: json['buttonLabel'] as String,
      urlLink: json['urlLink'] as String,
      isPreSalesOrg: json['isPreSalesOrg'] as bool,
      salesOrg: json['salesOrg'] as String,
      serial: json['serial'] as int,
      isCustomer: json['isCustomer'] as bool,
      isKeyword: json['isKeyword'] as bool? ?? false,
      keyword: json['keyword'] as String? ?? '',
    );

Map<String, dynamic> _$$_BannerDtoToJson(_$_BannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'buttonLabel': instance.buttonLabel,
      'urlLink': instance.urlLink,
      'isPreSalesOrg': instance.isPreSalesOrg,
      'salesOrg': instance.salesOrg,
      'serial': instance.serial,
      'isCustomer': instance.isCustomer,
      'isKeyword': instance.isKeyword,
      'keyword': instance.keyword,
    };
