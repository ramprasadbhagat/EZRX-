// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_material_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnMaterialListDto _$$_ReturnMaterialListDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnMaterialListDto(
      basicInformations: (json['materialBasicInformation'] as List<dynamic>?)
              ?.map((e) => MaterialBasicInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      items: json['materials'] == null
          ? []
          : _mappingReturnMaterial(json['materials']),
    );

Map<String, dynamic> _$$_ReturnMaterialListDtoToJson(
        _$_ReturnMaterialListDto instance) =>
    <String, dynamic>{
      'materialBasicInformation':
          instance.basicInformations.map((e) => e.toJson()).toList(),
      'materials': instance.items.map((e) => e.toJson()).toList(),
    };
