// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentStatusDto _$$_PaymentStatusDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentStatusDto(
      paymentID: json['paymentID'] as String? ?? '',
      txnStatus: json['txnStatus'] as String? ?? '',
      transactionRef: json['transactionRef'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentStatusDtoToJson(_$_PaymentStatusDto instance) =>
    <String, dynamic>{
      'paymentID': instance.paymentID,
      'txnStatus': instance.txnStatus,
      'transactionRef': instance.transactionRef,
    };
