import 'package:ezrxmobile/domain/payments/entities/payment_summary_details_response.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_details_response_dto.freezed.dart';
part 'payment_summary_details_response_dto.g.dart';

@freezed
class PaymentSummaryDetailsResponseDto with _$PaymentSummaryDetailsResponseDto {
  const PaymentSummaryDetailsResponseDto._();
  factory PaymentSummaryDetailsResponseDto({
    @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
        required double totalPaymentInProgress,
    @JsonKey(
      name: 'customerPaymentResponse',
      defaultValue: <PaymentSummaryDetailsDto>[],
    )
        required List<PaymentSummaryDetailsDto> paymentSummaryList,
  }) = _PaymentSummaryDetailsResponseDto;

  factory PaymentSummaryDetailsResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentSummaryDetailsResponseDtoFromJson(json);

  PaymentSummaryDetailsResponse toDomain() => PaymentSummaryDetailsResponse(
        paymentSummaryList:
            paymentSummaryList.map((e) => e.toDomain()).toList(),
        totalPaymentInProgress: Amount(totalPaymentInProgress),
      );
}
