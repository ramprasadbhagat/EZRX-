part of 'payment_summary_details_bloc.dart';

@freezed
class PaymentSummaryDetailsState with _$PaymentSummaryDetailsState {
  const PaymentSummaryDetailsState._();
  const factory PaymentSummaryDetailsState({
    required PaymentSummaryDetails paymentSummaryDetails,
    required List<PaymentItem> paymentItemList,
    required bool isDetailFetching,
    required bool isListLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentSummaryDetailsState;
  factory PaymentSummaryDetailsState.initial() => PaymentSummaryDetailsState(
        paymentSummaryDetails: PaymentSummaryDetails.empty(),
        isDetailFetching: false,
        failureOrSuccessOption: none(),
        paymentItemList: <PaymentItem>[],
        isListLoading: false,
      );

  bool get isLoading => isDetailFetching || isListLoading;
}
