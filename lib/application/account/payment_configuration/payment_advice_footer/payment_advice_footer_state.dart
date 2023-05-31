part of 'payment_advice_footer_bloc.dart';

@freezed
class PaymentAdviceFooterState with _$PaymentAdviceFooterState {
  const factory PaymentAdviceFooterState({
    required List<PaymentAdviceFooter> paymentAdviceFooters,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentAdviceFooterState;

  factory PaymentAdviceFooterState.initial() => PaymentAdviceFooterState(
        paymentAdviceFooters: <PaymentAdviceFooter>[],
        isFetching: false,
        failureOrSuccessOption: none(),
      );
}
