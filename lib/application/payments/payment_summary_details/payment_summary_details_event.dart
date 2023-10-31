part of 'payment_summary_details_bloc.dart';

@freezed
class PaymentSummaryDetailsEvent with _$PaymentSummaryDetailsEvent {
  const factory PaymentSummaryDetailsEvent.initialized({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required ShipToInfo shipToInfo,
  }) = _Initialized;
  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo({
    required PaymentSummaryDetails paymentSummaryDetails,
  }) = _FetchPaymentSummaryDetailsEvent;

  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryList({
    required PaymentSummaryDetails paymentSummaryDetails,
  }) = _FetchPaymentSummaryListEvent;
  const factory PaymentSummaryDetailsEvent.fetchAdvice() = _FetchAdvice;
  const factory PaymentSummaryDetailsEvent.saveAdvice() = _SaveAdvice;
}
