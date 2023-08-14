// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationDto _$$_PaginationDtoFromJson(Map<String, dynamic> json) =>
    _$_PaginationDto(
      totalItem: json['totalItem'] as int? ?? 0,
      totalPage: json['totalPage'] as int? ?? 0,
      totalUnread: json['totalUnread'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PaginationDtoToJson(_$_PaginationDto instance) =>
    <String, dynamic>{
      'totalItem': instance.totalItem,
      'totalPage': instance.totalPage,
      'totalUnread': instance.totalUnread,
    };
