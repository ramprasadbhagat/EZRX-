import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/bank_benificiary.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_benificiary_dto.freezed.dart';
part 'bank_benificiary_dto.g.dart';


@freezed
class BankBeneficiaryDto with _$BankBeneficiaryDto {
  const BankBeneficiaryDto._();

  const factory BankBeneficiaryDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'bankAccount', defaultValue: '') 
    required String bankAccount,
    @JsonKey(name: 'bankAddress', defaultValue: '') 
    required String bankAddress,
    @JsonKey(name: 'bankCode', defaultValue: '') required String bankCode,
    @JsonKey(name: 'bankName', defaultValue: '') required String bankName,
    @JsonKey(name: 'beneficiaryName', defaultValue: '') 
    required String beneficiaryName,
    @JsonKey(name: 'branch', defaultValue: '') required String branch,
    @JsonKey(name: 'emailId', defaultValue: '') required String emailId,
    @JsonKey(name: 'hdbcSwiftCode', defaultValue: '') 
    required String hdbcSwiftCode,
    @JsonKey(name: 'payNowWhen', defaultValue: '') required String payNowWhen,
    @JsonKey(name: 'salesDistrict', defaultValue: '') 
    required String salesDistrict,
  }) = _BankBeneficiaryDto;

  factory BankBeneficiaryDto.fromDomain(
    BankBeneficiary manageBenificiary,
  ) {
    return BankBeneficiaryDto(
      salesOrg: manageBenificiary.salesOrg.getOrCrash(),
      bankAccount: manageBenificiary.bankAccount.getOrCrash(),
      bankAddress: manageBenificiary.bankAddress,
      bankCode: manageBenificiary.bankCode,
      bankName: manageBenificiary.bankName.getOrCrash(),
      beneficiaryName: manageBenificiary.beneficiaryName.getOrCrash(),
      branch: manageBenificiary.branch,
      emailId: manageBenificiary.emailId.getOrCrash(),
      hdbcSwiftCode: manageBenificiary.hdbcSwiftCode,
      payNowWhen: manageBenificiary.payNowWhen,
      salesDistrict: manageBenificiary.salesDistrict,
    );
  }

  BankBeneficiary toDomain() {
    return BankBeneficiary(
      salesOrg: SalesOrg(salesOrg),
      bankAccount: StringValue(bankAccount),
      bankAddress: bankAddress,
      bankCode: bankCode,
      bankName: StringValue(bankName),
      beneficiaryName: StringValue(beneficiaryName),
      branch: branch,
      emailId: EmailAddress(emailId),
      hdbcSwiftCode: hdbcSwiftCode,
      payNowWhen: payNowWhen,
      salesDistrict: salesDistrict,
    );
  }

  factory BankBeneficiaryDto.fromJson(Map<String, dynamic> json) =>
      _$BankBeneficiaryDtoFromJson(json);
}
