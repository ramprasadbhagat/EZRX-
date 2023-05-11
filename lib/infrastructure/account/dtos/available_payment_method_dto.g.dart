// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AvailablePaymentMethodDto _$$_AvailablePaymentMethodDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AvailablePaymentMethodDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      paymentMethod: json['paymentMethods'] as String? ?? '',
    );

Map<String, dynamic> _$$_AvailablePaymentMethodDtoToJson(
        _$_AvailablePaymentMethodDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'paymentMethods': instance.paymentMethod,
    };
