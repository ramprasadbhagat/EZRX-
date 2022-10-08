import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_customer_information.freezed.dart';

@freezed
class PaymentCustomerInformation with _$PaymentCustomerInformation {
  const PaymentCustomerInformation._();

  const factory PaymentCustomerInformation({
    required String paymentTerm,
  }) = _PaymentCustomerInformation;

  factory PaymentCustomerInformation.empty() => const PaymentCustomerInformation(
        paymentTerm: '',
      );
}
