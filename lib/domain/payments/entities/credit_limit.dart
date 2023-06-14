import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_limit.freezed.dart';

@freezed
class CreditLimit with _$CreditLimit {
  const CreditLimit._();

  const factory CreditLimit({
    required CustomerCode customerCode,
    required Currency currency,
    required String creditLimit,
    required String creditExposure,
    required String creditBalance,
  }) = _CreditLimit;

  factory CreditLimit.empty() => CreditLimit(
        customerCode: CustomerCode(''),
        currency: Currency(''),
        creditLimit: '0',
        creditExposure: '0',
        creditBalance: '0',
      );
}
