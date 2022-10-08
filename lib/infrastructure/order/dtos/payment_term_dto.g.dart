// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_term_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentTermDto _$$_PaymentTermDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentTermDto(
      paymentTermCode: json['paymentTermCode'] as String,
      paymentTermRanking: json['paymentTermRanking'] as int,
      paymentTermDescription: json['paymentTermDescription'] as String,
      paymentTermSubranking: json['paymentTermSubranking'] as int,
    );

Map<String, dynamic> _$$_PaymentTermDtoToJson(_$_PaymentTermDto instance) =>
    <String, dynamic>{
      'paymentTermCode': instance.paymentTermCode,
      'paymentTermRanking': instance.paymentTermRanking,
      'paymentTermDescription': instance.paymentTermDescription,
      'paymentTermSubranking': instance.paymentTermSubranking,
    };
