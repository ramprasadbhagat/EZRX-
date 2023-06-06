part of 'manage_payment_advice_footer_bloc.dart';

@freezed
class ManagePaymentAdviceFooterState with _$ManagePaymentAdviceFooterState {
  const factory ManagePaymentAdviceFooterState({
    required PaymentAdviceFooterData paymentAdviceFooterData,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required AddPaymentAdviceFooterResponse response,
  }) = _ManagePaymentAdviceFooterState;

  factory ManagePaymentAdviceFooterState.initial() =>
      ManagePaymentAdviceFooterState(
        paymentAdviceFooterData: PaymentAdviceFooterData.empty(),
        isSubmitting: false,
        showErrorMessages: false,
        failureOrSuccessOption: none(),
        response: AddPaymentAdviceFooterResponse.empty(),
      );
}
