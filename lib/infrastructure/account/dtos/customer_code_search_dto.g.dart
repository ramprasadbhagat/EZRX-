// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerCodeSearchDto _$$_CustomerCodeSearchDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerCodeSearchDto(
      salesOrg: json['salesOrganisation'] as String? ?? '',
      first: json['first'] as int? ?? 24,
      filterBlockCustomer: json['filterBlockCustomer'] as bool? ?? false,
      after: json['after'] as int? ?? 0,
      searchKey: json['searchKey'] as String? ?? '',
    );

Map<String, dynamic> _$$_CustomerCodeSearchDtoToJson(
        _$_CustomerCodeSearchDto instance) =>
    <String, dynamic>{
      'salesOrganisation': instance.salesOrg,
      'first': instance.first,
      'filterBlockCustomer': instance.filterBlockCustomer,
      'after': instance.after,
      'searchKey': instance.searchKey,
    };
