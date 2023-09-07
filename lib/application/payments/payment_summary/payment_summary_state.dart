part of 'payment_summary_bloc.dart';

@freezed
class PaymentSummaryState with _$PaymentSummaryState {
  const PaymentSummaryState._();
  const factory PaymentSummaryState({
    required final List<PaymentSummaryDetails> paymentSummaryList,
    required bool isFetching,
    required bool canLoadMorePaymentSummary,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentSummaryState;

  factory PaymentSummaryState.initial() => PaymentSummaryState(
        failureOrSuccessOption: none(),
        isFetching: false,
        canLoadMorePaymentSummary: true,
        paymentSummaryList: <PaymentSummaryDetails>[],
      );
}
