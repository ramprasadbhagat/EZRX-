// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitOrderCustomerDto _$$_SubmitOrderCustomerDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitOrderCustomerDto(
      customerNumber: json['customerNumber'] as String? ?? '',
      customerNumberShipTo: json['customerNumberShipTo'] as String? ?? '',
      salesOrganisation: json['salesOrganisation'] as String? ?? '',
      division: json['division'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubmitOrderCustomerDtoToJson(
        _$_SubmitOrderCustomerDto instance) =>
    <String, dynamic>{
      'customerNumber': instance.customerNumber,
      'customerNumberShipTo': instance.customerNumberShipTo,
      'salesOrganisation': instance.salesOrganisation,
      'division': instance.division,
    };
