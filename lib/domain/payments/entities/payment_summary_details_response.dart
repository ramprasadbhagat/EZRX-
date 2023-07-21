import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_details_response.freezed.dart';

@freezed
class PaymentSummaryDetailsResponse with _$PaymentSummaryDetailsResponse {
  const PaymentSummaryDetailsResponse._();
  factory PaymentSummaryDetailsResponse({
    required final List<PaymentSummaryDetails> paymentSummaryList,
    required final Amount totalPaymentInProgress,
  }) = _PaymentSummaryDetailsResponse;

  factory PaymentSummaryDetailsResponse.empty() =>
      PaymentSummaryDetailsResponse(
        totalPaymentInProgress: Amount(0),
        paymentSummaryList: <PaymentSummaryDetails>[],
      );
}
