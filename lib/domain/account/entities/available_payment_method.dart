import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_payment_method.freezed.dart';

@freezed
class AvailablePaymentMethod with _$AvailablePaymentMethod {
  const AvailablePaymentMethod._();

  const factory AvailablePaymentMethod({
    required SalesOrg salesOrg,
    required String paymentMethod,
  }) = _AvailablePaymentMethod;

  factory AvailablePaymentMethod.empty() => AvailablePaymentMethod(
        salesOrg: SalesOrg(''),
        paymentMethod: '',
      );
}
