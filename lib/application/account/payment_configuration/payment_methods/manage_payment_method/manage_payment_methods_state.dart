part of 'manage_payment_methods_bloc.dart';

@freezed
class ManagePaymentMethodsState with _$ManagePaymentMethodsState {
  const ManagePaymentMethodsState._();

  const factory ManagePaymentMethodsState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required PaymentMethod paymentMethod,
    required int deleteIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ManagePaymentMethodsState;

  factory ManagePaymentMethodsState.initial() => ManagePaymentMethodsState(
        isSubmitting: false,
        showErrorMessages: false,
        paymentMethod: PaymentMethod(''),
        deleteIndex: -1,
        failureOrSuccessOption: none(),
      );
}
