import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic addData;
  late dynamic deleteData;
  group(
    'Test Delete Payment Method DTO',
    () {
      setUp(
        () async {
          addData = json.decode(await rootBundle
              .loadString('assets/json/addOrUpdateBeneficiaryResponse.json'));
          deleteData = json.decode(await rootBundle
              .loadString('assets/json/deleteBeneficiaryResponse.json'));
        },
      );
      test(
        '=> data mapping for Add Or Update',
        () {
          final bankBeneficiaryResponse = BankBeneficiaryResponseDto.fromJson(
                  addData['data']['addBankBeneficiary'])
              .toDomain();
          expect(bankBeneficiaryResponse.info, 'Data Inserted Successfully');

          final bankBeneficiaryResponseDto =
              BankBeneficiaryResponseDto.fromDomain(bankBeneficiaryResponse);
          expect(bankBeneficiaryResponseDto.info, 'Data Inserted Successfully');

          final bankBeneficiaryResponseDtoMap =
              bankBeneficiaryResponseDto.toJson();
          expect(bankBeneficiaryResponseDtoMap['info'],
              'Data Inserted Successfully');
        },
      );

      test(
        '=> data mapping for Delete',
        () {
          final bankBeneficiaryResponse = BankBeneficiaryResponseDto.fromJson(
                  deleteData['data']['deleteBankBeneficiary'])
              .toDomain();
          expect(bankBeneficiaryResponse.info, '1 data deleted Successfully');

          final bankBeneficiaryResponseDto =
              BankBeneficiaryResponseDto.fromDomain(bankBeneficiaryResponse);
          expect(bankBeneficiaryResponseDto.info, '1 data deleted Successfully');

          final bankBeneficiaryResponseDtoMap =
              bankBeneficiaryResponseDto.toJson();
          expect(bankBeneficiaryResponseDtoMap['info'],
              '1 data deleted Successfully');
        },
      );
    },
  );
}
