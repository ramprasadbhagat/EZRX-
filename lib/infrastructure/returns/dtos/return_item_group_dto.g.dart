// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnItemGroupDto _$$_ReturnItemGroupDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnItemGroupDto(
      requestDate: json['requestDate'] as String? ?? '',
      items: (json['requestByItems'] as List<dynamic>?)
              ?.map((e) => ReturnItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnItemGroupDtoToJson(
        _$_ReturnItemGroupDto instance) =>
    <String, dynamic>{
      'requestDate': instance.requestDate,
      'requestByItems': instance.items.map((e) => e.toJson()).toList(),
    };
