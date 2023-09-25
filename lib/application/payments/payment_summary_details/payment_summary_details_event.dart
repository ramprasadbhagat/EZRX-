part of 'payment_summary_details_bloc.dart';

@freezed
class PaymentSummaryDetailsEvent with _$PaymentSummaryDetailsEvent {
  const factory PaymentSummaryDetailsEvent.initialized() = _Initialized;
  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryDetails paymentSummaryDetails,
  }) = _FetchPaymentSummaryDetailsEvent;

  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryDetails paymentSummaryDetails,
  }) = _FetchPaymentSummaryListEvent;
}
