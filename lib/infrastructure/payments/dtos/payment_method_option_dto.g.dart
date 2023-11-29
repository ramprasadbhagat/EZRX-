// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentMethodOptionDto _$$_PaymentMethodOptionDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentMethodOptionDto(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentMethodOptionDtoToJson(
        _$_PaymentMethodOptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'provider': instance.provider,
      'displayName': instance.displayName,
    };
