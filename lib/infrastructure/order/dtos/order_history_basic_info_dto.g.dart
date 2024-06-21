// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_basic_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryBasicInfoDtoImpl _$$OrderHistoryBasicInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryBasicInfoDtoImpl(
      soldTo: json['SoldTo'] as String,
      shipTo: json['ShipTo'] as String,
      companyName: json['CompanyName'] as String,
      paymentTerm:
          PaymentTermDto.fromJson(json['PaymentTerm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderHistoryBasicInfoDtoImplToJson(
        _$OrderHistoryBasicInfoDtoImpl instance) =>
    <String, dynamic>{
      'SoldTo': instance.soldTo,
      'ShipTo': instance.shipTo,
      'CompanyName': instance.companyName,
      'PaymentTerm': instance.paymentTerm.toJson(),
    };

_$PaymentTermDtoImpl _$$PaymentTermDtoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentTermDtoImpl(
      paymentTermCode: json['PaymentTermCode'] as String,
      paymentTermDescription: json['PaymentTermDescription'] as String,
    );

Map<String, dynamic> _$$PaymentTermDtoImplToJson(
        _$PaymentTermDtoImpl instance) =>
    <String, dynamic>{
      'PaymentTermCode': instance.paymentTermCode,
      'PaymentTermDescription': instance.paymentTermDescription,
    };
