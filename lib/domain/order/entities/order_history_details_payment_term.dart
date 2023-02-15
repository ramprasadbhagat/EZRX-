import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_payment_term.freezed.dart';

@freezed
class OrderHistoryDetailsPaymentTerm with _$OrderHistoryDetailsPaymentTerm {
  const OrderHistoryDetailsPaymentTerm._();
  factory OrderHistoryDetailsPaymentTerm({
    required PaymentTermCode paymentTermCode,
    required PaymentTermDescription paymentTermDescription,
  }) = _OrderHistoryDetailsPaymentTerm;
  factory OrderHistoryDetailsPaymentTerm.empty() =>
      OrderHistoryDetailsPaymentTerm(
        paymentTermCode: PaymentTermCode(''),
        paymentTermDescription: PaymentTermDescription(''),
      );
}
