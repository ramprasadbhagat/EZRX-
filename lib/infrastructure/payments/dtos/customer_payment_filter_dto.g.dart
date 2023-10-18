// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payment_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerPaymentFilterDto _$$_CustomerPaymentFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerPaymentFilterDto(
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      createdDateToday: json['createdDateToday'] as String? ?? '',
      createdDateYesterday: json['createdDateYesterday'] as String? ?? '',
    );

Map<String, dynamic> _$$_CustomerPaymentFilterDtoToJson(
        _$_CustomerPaymentFilterDto instance) =>
    <String, dynamic>{
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'createdDateToday': instance.createdDateToday,
      'createdDateYesterday': instance.createdDateYesterday,
    };
