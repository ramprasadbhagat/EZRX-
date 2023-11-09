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
    required PaymentSummaryDetails details,
  }) = _FetchPaymentSummaryDetailsEvent;

  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryList() =
      _FetchPaymentSummaryListEvent;

  const factory PaymentSummaryDetailsEvent.fetchBankInstruction() =
      _FetchBankInstruction;

  const factory PaymentSummaryDetailsEvent.fetchAdvice() = _FetchAdvice;

  const factory PaymentSummaryDetailsEvent.saveAdvice() = _SaveAdvice;

  const factory PaymentSummaryDetailsEvent.deleteAdvice() = _DeleteAdvice;
}
