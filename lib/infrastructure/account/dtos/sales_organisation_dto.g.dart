// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesOrganisationDto _$$_SalesOrganisationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesOrganisationDto(
      salesOrg: json['salesOrg'] as String,
      customerCode: json['customerCode'] as String,
      shipToCodes: (json['shipToCode'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_SalesOrganisationDtoToJson(
        _$_SalesOrganisationDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'customerCode': instance.customerCode,
      'shipToCode': instance.shipToCodes,
    };
