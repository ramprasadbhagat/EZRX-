// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_list_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnListRequestDto _$$_ReturnListRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnListRequestDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      shipTo: json['shipTo'] as String? ?? '',
      username: json['username'] as String? ?? '',
      first: json['first'] as int? ?? 0,
      after: json['after'] as int? ?? 0,
      filterQuery:
          ReturnFilterDto.fromJson(json['filterQuery'] as Map<String, dynamic>),
      searchKey: json['searchFilter'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnListRequestDtoToJson(
        _$_ReturnListRequestDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'soldTo': instance.soldTo,
      'shipTo': instance.shipTo,
      'username': instance.username,
      'first': instance.first,
      'after': instance.after,
      'searchFilter': instance.searchKey,
    };
