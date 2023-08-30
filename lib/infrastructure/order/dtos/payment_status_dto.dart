import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/decryption.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_dto.freezed.dart';
part 'payment_status_dto.g.dart';

enum TxnStatusEnum { success, failed, pending }

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
      txnStatus: _statusCodeBasedOnMarket(
        paymentStatus.market,
        Decryption().decrypt(
          paymentStatus.txnStatusEncrypt,
        ),
      ),
      transactionRef: Decryption().decrypt(paymentStatus.transactionRefEncrypt),
    );
  }

  factory PaymentStatusDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusDtoFromJson(json);

  static String _statusCodeBasedOnMarket(String marketCode, String input) {
    switch (marketCode) {
      case 'vn':
        return input;
      case 'my':
      default:
        return _statusCode(_statusCodeForHSBC(input));
    }
  }

  static String _statusCode(TxnStatusEnum input) {
    switch (input) {
      case TxnStatusEnum.success:
        return '1';
      case TxnStatusEnum.failed:
        return '0';
      case TxnStatusEnum.pending:
      default:
        return '2';
    }
  }

  static TxnStatusEnum _statusCodeForHSBC(String input) {
    switch (input) {
      case '0':
        return TxnStatusEnum.success;
      case '1':
        return TxnStatusEnum.failed;
      case '2':
      default:
        return TxnStatusEnum.pending;
    }
  }
}
