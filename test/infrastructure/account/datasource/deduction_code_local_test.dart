import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DeductionCodeLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = DeductionCodeLocalDataSource();
    },
  );

  group(
    'DeductionCode Local Datasource Test',
    () {
      test(
        '=> getDeductionCodes',
        () async {
          final result = await localDataSource.getDeductionCodes();

          expect(
            result.length,
            10,
          );
        },
      );

      test(
        '=> addDeductionCode',
        () async {
          final result = await localDataSource.addDeductionCode();

          expect(
            result.success,
            true,
          );
        },
      );

      test(
        '=> deleteDeductionCode',
        () async {
          final result = await localDataSource.deleteDeductionCode();

          expect(
            result.success,
            true,
          );
        },
      );
    },
  );
}
