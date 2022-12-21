// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_customer_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentCustomerInformationDto _$$_PaymentCustomerInformationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentCustomerInformationDto(
      paymentTerm: json['paymentTerm'] as String,
      shipToDtoList: (json['shipTo'] as List<dynamic>)
          .map((e) => ShipToDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaymentCustomerInformationDtoToJson(
        _$_PaymentCustomerInformationDto instance) =>
    <String, dynamic>{
      'paymentTerm': instance.paymentTerm,
      'shipTo': instance.shipToDtoList.map((e) => e.toJson()).toList(),
    };
