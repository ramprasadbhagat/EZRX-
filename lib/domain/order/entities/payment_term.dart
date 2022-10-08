import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_term.freezed.dart';

@freezed
class PaymentTerm with _$PaymentTerm {
  const PaymentTerm._();

  const factory PaymentTerm({
    required String paymentTermCode,
    required int paymentTermRanking,
    required String paymentTermDescription,
    required int paymentTermSubranking,
  }) = _PaymentTerm;

  factory PaymentTerm.empty() => const PaymentTerm(
        paymentTermCode: '',
        paymentTermRanking: 0,
        paymentTermDescription: '',
        paymentTermSubranking: 0,
      );
}
