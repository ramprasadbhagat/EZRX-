// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerPaymentDto _$$_CustomerPaymentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerPaymentDto(
      total: json['total'] as int? ?? 0,
      showing: json['showing'] as int? ?? 0,
      totalPaymentInProgress: json['totalPaymentInProgress'] as int? ?? 0,
      resultPaymentInProgress: json['resultPaymentInProgress'] as int? ?? 0,
      customerPaymentResponse: (json['customerPaymentResponse']
                  as List<dynamic>?)
              ?.map((e) =>
                  CustomerPaymentItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CustomerPaymentDtoToJson(
        _$_CustomerPaymentDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'showing': instance.showing,
      'totalPaymentInProgress': instance.totalPaymentInProgress,
      'resultPaymentInProgress': instance.resultPaymentInProgress,
      'customerPaymentResponse':
          instance.customerPaymentResponse.map((e) => e.toJson()).toList(),
    };
