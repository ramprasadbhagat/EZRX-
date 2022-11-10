import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_payment_term.freezed.dart';

@freezed
class OrderHistoryDetailsPaymentTerm with _$OrderHistoryDetailsPaymentTerm {
  const OrderHistoryDetailsPaymentTerm._();
  factory OrderHistoryDetailsPaymentTerm({
    required String paymentTermCode,
    required String paymentTermDescription,
  }) = _OrderHistoryDetailsPaymentTerm;
  factory OrderHistoryDetailsPaymentTerm.empty() => OrderHistoryDetailsPaymentTerm(
       paymentTermCode: '',
       paymentTermDescription: '',
      );
}