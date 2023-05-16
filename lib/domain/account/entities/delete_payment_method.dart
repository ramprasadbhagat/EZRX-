import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_payment_method.freezed.dart';

@freezed
class DeletePaymentMethod with _$DeletePaymentMethod {
  const DeletePaymentMethod._();

  const factory DeletePaymentMethod({
    required bool success,
  }) = _DeletePaymentMethod;

  factory DeletePaymentMethod.empty() => const DeletePaymentMethod(
        success: false,
      );
}
