// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavouriteDto _$$_FavouriteDtoFromJson(Map<String, dynamic> json) =>
    _$_FavouriteDto(
      id: json['id'] as String? ?? '',
      isTenderContract: json['isTenderContract'] as bool? ?? false,
      materialDescription: json['materialDescription'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      isFOC: json['isFOC'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FavouriteDtoToJson(_$_FavouriteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isTenderContract': instance.isTenderContract,
      'materialDescription': instance.materialDescription,
      'materialNumber': instance.materialNumber,
      'isFOC': instance.isFOC,
    };
