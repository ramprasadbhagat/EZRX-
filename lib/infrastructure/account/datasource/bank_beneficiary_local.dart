import 'dart:convert';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_response_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_dto.dart';
import 'package:flutter/services.dart';

class BankBeneficiaryLocalDataSource {
  BankBeneficiaryLocalDataSource();

  Future<List<BankBeneficiary>> getBankBeneficiaries() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getManageBankBenificiary.json'),
    );

    return List.from(data['data']['bankBeneficiary'])
        .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<SalesDistrict>> getSalesDistrict() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getSalesDistrictResponse.json'),
    );

    return List.from(data['data']['salesDistrict'])
        .map((e) => SalesDistrictDto.fromJson(e).toDomain())
        .toList();
  }

  Future<BankBeneficiaryResponse> addOrUpdateBeneficiary() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/addOrUpdateBeneficiaryResponse.json'),
    );

    return BankBeneficiaryResponseDto.fromJson(
      data['data']['addBankBeneficiary'],
    ).toDomain();
  }

  Future<BankBeneficiaryResponse> deleteBeneficiary() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/deleteBeneficiaryResponse.json'),
    );

    return BankBeneficiaryResponseDto.fromJson(
      data['data']['deleteBankBeneficiary'],
    ).toDomain();
  }
  
}
