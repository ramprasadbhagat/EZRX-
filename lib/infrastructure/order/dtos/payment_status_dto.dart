import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/decryption.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_dto.freezed.dart';
part 'payment_status_dto.g.dart';

@freezed
class PaymentStatusDto with _$PaymentStatusDto {
  const PaymentStatusDto._();

  const factory PaymentStatusDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'txnStatus', defaultValue: '') required String txnStatus,
    @JsonKey(name: 'transactionRef', defaultValue: '')
        required String transactionRef,
  }) = _PaymentStatusDto;

  factory PaymentStatusDto.fromDomain(PaymentStatus paymentStatus) {
    return PaymentStatusDto(
      paymentID: Decryption().decrypt(paymentStatus.paymentIdEncrypt),
      txnStatus: Decryption().decrypt(
        paymentStatus.txnStatusEncrypt,
      ),
      transactionRef: Decryption().decrypt(paymentStatus.transactionRefEncrypt),
    );
  }

  factory PaymentStatusDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusDtoFromJson(json);
}
