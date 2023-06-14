import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_balance.freezed.dart';

@freezed
class OutstandingBalance with _$OutstandingBalance {
  const OutstandingBalance._();

  const factory OutstandingBalance({
    required CustomerCode customerCode,
    required Currency currency,
    required String amount,
    required String overdue,
    required String checkDate,
  }) = _OutstandingBalance;

  factory OutstandingBalance.empty() => OutstandingBalance(
        customerCode: CustomerCode(''),
        currency: Currency(''),
        amount: '0',
        overdue: '0',
        checkDate: '',
      );
}
