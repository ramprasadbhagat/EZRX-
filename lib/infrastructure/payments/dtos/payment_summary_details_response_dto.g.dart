// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentSummaryDetailsResponseDto
    _$$_PaymentSummaryDetailsResponseDtoFromJson(Map<String, dynamic> json) =>
        _$_PaymentSummaryDetailsResponseDto(
          totalPaymentInProgress:
              (json['totalPaymentInProgress'] as num?)?.toDouble() ?? 0,
          paymentSummaryList:
              (json['customerPaymentResponse'] as List<dynamic>?)
                      ?.map((e) => PaymentSummaryDetailsDto.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  [],
        );

Map<String, dynamic> _$$_PaymentSummaryDetailsResponseDtoToJson(
        _$_PaymentSummaryDetailsResponseDto instance) =>
    <String, dynamic>{
      'totalPaymentInProgress': instance.totalPaymentInProgress,
      'customerPaymentResponse':
          instance.paymentSummaryList.map((e) => e.toJson()).toList(),
    };
