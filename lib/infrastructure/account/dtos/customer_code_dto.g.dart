// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerCodeDto _$$_CustomerCodeDtoFromJson(Map<String, dynamic> json) =>
    _$_CustomerCodeDto(
      customerCodeSoldTo: json['customerCodeSoldTo'] as String,
      name1: json['name1'] as String,
      name2: json['name2'] as String,
      name3: json['name3'] as String,
      name4: json['name4'] as String,
      status: json['status'] as String,
      street1: json['street1'] as String,
      street2: json['street2'] as String,
      street3: json['street3'] as String,
      street4: json['street4'] as String,
      street5: json['street5'] as String,
      postalCode: json['postalCode'] as String,
      customerClassification: json['customerClassification'] as String,
      customerLocalGroup: json['customerLocalGroup'] as String,
      paymentTermDescription: json['paymentTermDescription'] as String,
      shipToInfos: (json['shipTo'] as List<dynamic>)
          .map((e) => ShipToDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      billToInfos: (json['billTo'] as List<dynamic>)
          .map((e) => BillToDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerAttr7: json['customerAttr7'] as String,
      customerGrp4: json['customerGrp4'] as String,
      region: json['region'] as String,
      emailAddresses: (json['emailAddresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CustomerCodeDtoToJson(_$_CustomerCodeDto instance) =>
    <String, dynamic>{
      'customerCodeSoldTo': instance.customerCodeSoldTo,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'status': instance.status,
      'street1': instance.street1,
      'street2': instance.street2,
      'street3': instance.street3,
      'street4': instance.street4,
      'street5': instance.street5,
      'postalCode': instance.postalCode,
      'customerClassification': instance.customerClassification,
      'customerLocalGroup': instance.customerLocalGroup,
      'paymentTermDescription': instance.paymentTermDescription,
      'shipTo': instance.shipToInfos,
      'billTo': instance.billToInfos,
      'customerAttr7': instance.customerAttr7,
      'customerGrp4': instance.customerGrp4,
      'region': instance.region,
      'emailAddresses': instance.emailAddresses,
    };
