// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_materials_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnMaterialsParamsDto _$$_ReturnMaterialsParamsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnMaterialsParamsDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      shipTo: json['shipTo'] as String? ?? '',
      first: json['first'] as int? ?? 0,
      after: json['after'] as int? ?? 0,
      searchFilter: json['searchFilter'] as String? ?? '',
      filter:
          ReturnItemsFilterDto.fromJson(json['filter'] as Map<String, dynamic>),
      language: json['language'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnMaterialsParamsDtoToJson(
        _$_ReturnMaterialsParamsDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'soldTo': instance.soldTo,
      'shipTo': instance.shipTo,
      'first': instance.first,
      'after': instance.after,
      'searchFilter': instance.searchFilter,
      'language': instance.language,
    };
