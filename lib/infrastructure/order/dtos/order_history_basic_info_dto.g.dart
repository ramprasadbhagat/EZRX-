// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_basic_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryBasicInfoDto _$$_OrderHistoryBasicInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryBasicInfoDto(
      soldTo: json['SoldTo'] as String,
      shipTo: json['ShipTo'] as String,
      companyName: json['CompanyName'] as String,
      paymentTerm:
          PaymentTermDto.fromJson(json['PaymentTerm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderHistoryBasicInfoDtoToJson(
        _$_OrderHistoryBasicInfoDto instance) =>
    <String, dynamic>{
      'SoldTo': instance.soldTo,
      'ShipTo': instance.shipTo,
      'CompanyName': instance.companyName,
      'PaymentTerm': instance.paymentTerm.toJson(),
    };

_$_PaymentTermDto _$$_PaymentTermDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentTermDto(
      paymentTermCode: json['PaymentTermCode'] as String,
      paymentTermDescription: json['PaymentTermDescription'] as String,
    );

Map<String, dynamic> _$$_PaymentTermDtoToJson(_$_PaymentTermDto instance) =>
    <String, dynamic>{
      'PaymentTermCode': instance.paymentTermCode,
      'PaymentTermDescription': instance.paymentTermDescription,
    };
