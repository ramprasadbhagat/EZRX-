// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentInfoDto _$$_PaymentInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentInfoDto(
      paymentID: json['paymentID'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentInfoDtoToJson(_$_PaymentInfoDto instance) =>
    <String, dynamic>{
      'paymentID': instance.paymentID,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
    };
