part of 'manage_payment_advice_footer_bloc.dart';

@freezed
class ManagePaymentAdviceFooterState with _$ManagePaymentAdviceFooterState {
  const factory ManagePaymentAdviceFooterState({
    required List<PaymentAdviceFooter> paymentAdviceFooters,
    required PaymentAdviceFooter paymentAdviceFooterData,
    required bool isSubmitting,
    required bool showErrorMessages,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ManagePaymentAdviceFooterResponse response,
  }) = _ManagePaymentAdviceFooterState;

  factory ManagePaymentAdviceFooterState.initial() =>
      ManagePaymentAdviceFooterState(
        paymentAdviceFooters: <PaymentAdviceFooter>[],
        paymentAdviceFooterData: PaymentAdviceFooter.empty(),
        isSubmitting: false,
        showErrorMessages: false,
        isFetching: false,
        failureOrSuccessOption: none(),
        response: ManagePaymentAdviceFooterResponse.empty(),
      );
}
