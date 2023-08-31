// GENERATED CODE - DO NOT MODIFY BY HAND

part of 're_order_permission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReOrderPermissionDto _$$_ReOrderPermissionDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReOrderPermissionDto(
      validMaterials: (json['materials'] as List<dynamic>?)
              ?.map((e) => ValidMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReOrderPermissionDtoToJson(
        _$_ReOrderPermissionDto instance) =>
    <String, dynamic>{
      'materials': instance.validMaterials.map((e) => e.toJson()).toList(),
    };

_$_ValidMaterialDto _$$_ValidMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_ValidMaterialDto(
      hidePrice: json['hidePrice'] as bool? ?? false,
      materialNumber: json['materialNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_ValidMaterialDtoToJson(_$_ValidMaterialDto instance) =>
    <String, dynamic>{
      'hidePrice': instance.hidePrice,
      'materialNumber': instance.materialNumber,
    };
