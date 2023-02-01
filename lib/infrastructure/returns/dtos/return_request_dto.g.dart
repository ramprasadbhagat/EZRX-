// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnRequestDto _$$_ReturnRequestDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnRequestDto(
      isSearchComplete: json['isSearchComplete'] as bool? ?? false,
      basicInformations: (json['materialBasicInformation'] as List<dynamic>?)
              ?.map((e) => MaterialBasicInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      items: json['materials'] == null
          ? []
          : _unmarshallMaterialItem(json['materials']),
    );

Map<String, dynamic> _$$_ReturnRequestDtoToJson(_$_ReturnRequestDto instance) =>
    <String, dynamic>{
      'isSearchComplete': instance.isSearchComplete,
      'materialBasicInformation':
          instance.basicInformations.map((e) => e.toJson()).toList(),
      'materials': instance.items.map((e) => e.toJson()).toList(),
    };
