part of 'payment_methods_bloc.dart';

@freezed
class PaymentMethodsState with _$PaymentMethodsState {
  const PaymentMethodsState._();

  const factory PaymentMethodsState({
    required List<AvailablePaymentMethod> paymentMethodList,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentMethodsState;

  factory PaymentMethodsState.initial() => PaymentMethodsState(
        paymentMethodList: [],
        isFetching: false,
        failureOrSuccessOption: none(),
      );
}
