import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BankBeneficiaryLocalDataSource localDataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = BankBeneficiaryLocalDataSource();
  });

  group('Bank Beneficiary Local DataSource Test', () {
    test(
      '=> getBankBeneficiaries',
      () async {
        final result = await localDataSource.getBankBeneficiaries();

        expect(
          result.length,
          18,
        );
      },
    );

    test(
      '=> addOrUpdateBeneficiary',
      () async {
        final result = await localDataSource.addOrUpdateBeneficiary();

        expect(
          result.info,
          'Data Inserted Successfully',
        );
      },
    );

    test(
      '=> fetchSalesDistrict',
      () async {
        final result = await localDataSource.getSalesDistrict();

        expect(
          result.length,
          1,
        );
      },
    );

    test(
      '=> DeleteBeneficiary',
      () async {
        final result = await localDataSource.deleteBeneficiary();

        expect(
          result.info,
          '1 data deleted Successfully',
        );
      },
    );
  });
}
