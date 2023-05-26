import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_beneficiary_dto.freezed.dart';
part 'bank_beneficiary_dto.g.dart';


@freezed
class BankBeneficiaryDto with _$BankBeneficiaryDto {
  const BankBeneficiaryDto._();

  const factory BankBeneficiaryDto({
    @JsonKey(name: 'salesOrg', defaultValue: '',) required String salesOrg,
    @JsonKey(name: 'bankAccount', defaultValue: '',toJson: valueTojson) 
    required String bankAccount,
    @JsonKey(name: 'bankAddress', defaultValue: '',toJson: valueTojson) 
    required String bankAddress,
    @JsonKey(name: 'bankCode', defaultValue: '',toJson: valueTojson) required String bankCode,
    @JsonKey(name: 'bankName', defaultValue: '',toJson: valueTojson) required String bankName,
    @JsonKey(name: 'beneficiaryName', defaultValue: '',toJson: valueTojson) 
    required String beneficiaryName,
    @JsonKey(name: 'branch', defaultValue: '',toJson: valueTojson) required String branch,
    @JsonKey(name: 'emailId', defaultValue: '',toJson: valueTojson) required String emailId,
    @JsonKey(name: 'hdbcSwiftCode', defaultValue: '',toJson: valueTojson) 
    required String hdbcSwiftCode,
    @JsonKey(name: 'payNowUen', defaultValue: '',toJson: valueTojson) required String payNowUen,
    @JsonKey(name: 'salesDistrict', defaultValue: '',toJson: valueTojson) 
    required String salesDistrict,
  }) = _BankBeneficiaryDto;

  factory BankBeneficiaryDto.fromDomain(
    BankBeneficiary manageBenificiary,
  ) {
    return BankBeneficiaryDto(
      salesOrg: manageBenificiary.salesOrg.getOrCrash(),
      bankAccount: manageBenificiary.bankAccount.getValue(),
      bankAddress: manageBenificiary.bankAddress,
      bankCode: manageBenificiary.bankCode,
      bankName: manageBenificiary.bankName.getValue(),
      beneficiaryName: manageBenificiary.beneficiaryName.getValue(),
      branch: manageBenificiary.branch,
      emailId: manageBenificiary.emailId.getValue(),
      hdbcSwiftCode: manageBenificiary.hdbcSwiftCode,
      payNowUen: manageBenificiary.payNowUen,
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
      payNowUen: payNowUen,
      salesDistrict: salesDistrict,
    );
  }

  factory BankBeneficiaryDto.fromJson(Map<String, dynamic> json) =>
      _$BankBeneficiaryDtoFromJson(json);
}

dynamic valueTojson(String value) => value.isNotEmpty ? value : '';