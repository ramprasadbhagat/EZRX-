// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialFilterDto _$$_MaterialFilterDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialFilterDto(
      uniquePrincipalName: (json['uniquePrincipalName'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      uniqueTherapeuticClass: (json['uniqueTherapeuticClass'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      uniqueItemBrand: (json['uniqueItemBrand'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialFilterDtoToJson(
        _$_MaterialFilterDto instance) =>
    <String, dynamic>{
      'uniquePrincipalName': instance.uniquePrincipalName,
      'uniqueTherapeuticClass': instance.uniqueTherapeuticClass,
      'uniqueItemBrand': instance.uniqueItemBrand,
    };
