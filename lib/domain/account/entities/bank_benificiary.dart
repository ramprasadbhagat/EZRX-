import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_benificiary.freezed.dart';

@freezed
class BankBeneficiary with _$BankBeneficiary {
  const BankBeneficiary._();

  const factory BankBeneficiary({
    required SalesOrg salesOrg,
    required StringValue bankAccount,
    required String bankAddress,
    required String bankCode,
    required StringValue bankName,
    required StringValue beneficiaryName,
    required String branch,
    required EmailAddress emailId,
    required String hdbcSwiftCode,
    required String payNowWhen,
    required String salesDistrict,
  }) = _BankBeneficiary;

  factory BankBeneficiary.empty() => BankBeneficiary(
        salesOrg: SalesOrg(''),
        bankAccount: StringValue(''),
        bankAddress: '',
        bankCode: '',
        bankName: StringValue(''),
        beneficiaryName: StringValue(''),
        branch: '',
        emailId: EmailAddress(''),
        hdbcSwiftCode: '',
        payNowWhen: '',
        salesDistrict: '',
      );
}
