part of 'payment_customer_information_bloc.dart';

@freezed
class PaymentCustomerInformationState with _$PaymentCustomerInformationState {
  const factory PaymentCustomerInformationState({
    required PaymentCustomerInformation paymentCustomerInformation,
    required Option<Either<ApiFailure, dynamic>>
        paymentCustomerInformationFailureOrSuccessOption,
  }) = _PaymentCustomerInformationState;

  factory PaymentCustomerInformationState.initial() =>
      PaymentCustomerInformationState(
        paymentCustomerInformation:
            const PaymentCustomerInformation(paymentTerm: ''),
        paymentCustomerInformationFailureOrSuccessOption: none(),
      );
}
