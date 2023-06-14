// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_limit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditLimitDto _$$_CreditLimitDtoFromJson(Map<String, dynamic> json) =>
    _$_CreditLimitDto(
      customerCode: json['partner'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      creditLimit: json['creditLimit'] as String? ?? '',
      creditExposure: json['creditExposure'] as String? ?? '',
      creditBalance: json['creditBalance'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreditLimitDtoToJson(_$_CreditLimitDto instance) =>
    <String, dynamic>{
      'partner': instance.customerCode,
      'currency': instance.currency,
      'creditLimit': instance.creditLimit,
      'creditExposure': instance.creditExposure,
      'creditBalance': instance.creditBalance,
    };
