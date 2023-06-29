// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialFilterDto _$$_MaterialFilterDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialFilterDto(
      manufactureList: (json['ManufactureList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      countryList: (json['CountryList'] as List<dynamic>?)
              ?.map((e) =>
                  MaterialFilterCountryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      brandList: (json['BrandList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialFilterDtoToJson(
        _$_MaterialFilterDto instance) =>
    <String, dynamic>{
      'ManufactureList': instance.manufactureList,
      'CountryList': instance.countryList.map((e) => e.toJson()).toList(),
      'BrandList': instance.brandList,
    };

_$_MaterialFilterCountryDto _$$_MaterialFilterCountryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialFilterCountryDto(
      code: json['Code'] as String? ?? '',
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$_MaterialFilterCountryDtoToJson(
        _$_MaterialFilterCountryDto instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Name': instance.name,
    };
