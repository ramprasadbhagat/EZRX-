// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesOrganisationDto _$$_SalesOrganisationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesOrganisationDto(
      salesOrg: json['SalesOrg'] as String,
      customerCode: json['CustomerCode'] as String,
      shipToCodes: (json['ShipToCode'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_SalesOrganisationDtoToJson(
        _$_SalesOrganisationDto instance) =>
    <String, dynamic>{
      'SalesOrg': instance.salesOrg,
      'CustomerCode': instance.customerCode,
      'ShipToCode': instance.shipToCodes,
    };
