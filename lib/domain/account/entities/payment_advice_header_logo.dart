import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_header_logo.freezed.dart';

@freezed
class PaymentAdviceHeaderLogo with _$PaymentAdviceHeaderLogo {
  factory PaymentAdviceHeaderLogo({
    required String url,
    required String fileName,
  }) = _PaymentAdviceHeaderLogo;

  factory PaymentAdviceHeaderLogo.empty() => PaymentAdviceHeaderLogo(
        url: '',
        fileName: '',
      );
}
