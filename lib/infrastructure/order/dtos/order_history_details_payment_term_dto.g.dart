// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_payment_term_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsPaymentTermDtoImpl
    _$$OrderHistoryDetailsPaymentTermDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$OrderHistoryDetailsPaymentTermDtoImpl(
          paymentTermCode: json['PaymentTermCode'] as String? ?? '',
          paymentTermDescription:
              json['PaymentTermDescription'] as String? ?? '',
        );

Map<String, dynamic> _$$OrderHistoryDetailsPaymentTermDtoImplToJson(
        _$OrderHistoryDetailsPaymentTermDtoImpl instance) =>
    <String, dynamic>{
      'PaymentTermCode': instance.paymentTermCode,
      'PaymentTermDescription': instance.paymentTermDescription,
    };
