part of 'payment_summary_bloc.dart';

@freezed
class PaymentSummaryEvent with _$PaymentSummaryEvent {
  const factory PaymentSummaryEvent.fetchPaymentSummaryList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
  }) = _FetchPaymentSummaryList;

  const factory PaymentSummaryEvent.loadMorePaymentSummary({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMorePaymentSummary;
}
