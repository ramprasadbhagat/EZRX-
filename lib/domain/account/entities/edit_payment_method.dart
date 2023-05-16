import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_payment_method.freezed.dart';

@freezed
class EditPaymentMethod with _$EditPaymentMethod {
  const EditPaymentMethod._();

  const factory EditPaymentMethod({
    required bool success,
    required String action,
  }) = _EditPaymentMethod;

  factory EditPaymentMethod.empty() => const EditPaymentMethod(
        success: false,
        action: '',
      );
}
