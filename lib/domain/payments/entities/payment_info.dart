import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info.freezed.dart';

@freezed
class PaymentInfo with _$PaymentInfo {
  const PaymentInfo._();

  const factory PaymentInfo({
    required String zzHtmcs,
  }) = _PaymentInfo;

  factory PaymentInfo.empty() => const PaymentInfo(
        zzHtmcs: '',
      );
}
