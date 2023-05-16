import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_exception.freezed.dart';

@freezed
class PaymentMethodException with _$PaymentMethodException {
  const factory PaymentMethodException.paymentMethodUpdateFailure() =
      _PaymentMethodUpdateFailure;
  const factory PaymentMethodException.paymentMethodDeleteFailure() =
      _PaymentMethodDeleteFailure;
}
