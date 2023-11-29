// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentDetailsDto _$$_PaymentDetailsDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentDetailsDto(
      vaNumber: json['vaNumber'] as String? ?? '',
      vaName: json['vaName'] as String? ?? '',
      expiresAt: expiresAtDate(json, 'expiresAt') as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentDetailsDtoToJson(
        _$_PaymentDetailsDto instance) =>
    <String, dynamic>{
      'vaNumber': instance.vaNumber,
      'vaName': instance.vaName,
      'expiresAt': instance.expiresAt,
    };
