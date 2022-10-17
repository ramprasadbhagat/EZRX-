part of 'payment_customer_information_bloc.dart';

@freezed
class PaymentCustomerInformationState with _$PaymentCustomerInformationState {
  const PaymentCustomerInformationState._();

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

  bool get isPaymentCustomerInformationEmpty => paymentCustomerInformation == PaymentCustomerInformation.empty();        

}
