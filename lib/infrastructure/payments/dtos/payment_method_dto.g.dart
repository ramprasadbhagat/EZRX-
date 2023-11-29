// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentMethodDto _$$_PaymentMethodDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentMethodDto(
      paymentMethods: json['paymentMethods'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentMethodOptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PaymentMethodDtoToJson(_$_PaymentMethodDto instance) =>
    <String, dynamic>{
      'paymentMethods': instance.paymentMethods,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };
