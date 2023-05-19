// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_benificiary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankBeneficiaryDto _$$_BankBeneficiaryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BankBeneficiaryDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      bankAccount: json['bankAccount'] as String? ?? '',
      bankAddress: json['bankAddress'] as String? ?? '',
      bankCode: json['bankCode'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      beneficiaryName: json['beneficiaryName'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      emailId: json['emailId'] as String? ?? '',
      hdbcSwiftCode: json['hdbcSwiftCode'] as String? ?? '',
      payNowWhen: json['payNowWhen'] as String? ?? '',
      salesDistrict: json['salesDistrict'] as String? ?? '',
    );

Map<String, dynamic> _$$_BankBeneficiaryDtoToJson(
        _$_BankBeneficiaryDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'bankAccount': instance.bankAccount,
      'bankAddress': instance.bankAddress,
      'bankCode': instance.bankCode,
      'bankName': instance.bankName,
      'beneficiaryName': instance.beneficiaryName,
      'branch': instance.branch,
      'emailId': instance.emailId,
      'hdbcSwiftCode': instance.hdbcSwiftCode,
      'payNowWhen': instance.payNowWhen,
      'salesDistrict': instance.salesDistrict,
    };
