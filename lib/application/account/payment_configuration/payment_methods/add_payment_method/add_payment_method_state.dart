part of 'add_payment_method_bloc.dart';

@freezed
class AddPaymentMethodState with _$AddPaymentMethodState {
  const AddPaymentMethodState._();

  const factory AddPaymentMethodState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required PaymentMethod paymentMethod,
    required SalesOrg salesOrg,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AddPaymentMethodsState;

  factory AddPaymentMethodState.initial() => AddPaymentMethodState(
        isSubmitting: false,
        showErrorMessages: false,
        paymentMethod: PaymentMethod(''),
        salesOrg: SalesOrg(''),
        failureOrSuccessOption: none(),
      );
}
