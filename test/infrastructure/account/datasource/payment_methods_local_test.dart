import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PaymentMethodsLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PaymentMethodsLocalDataSource();
    },
  );

  group(
    'Payment Method Local Datasource Test',
    () {
      test(
        '=> getAvailablePaymentMethods',
        () async {
          final result = await localDataSource.getAvailablePaymentMethods();

          expect(
            result.length,
            10,
          );
        },
      );

      test(
        '=> updatePaymentMethods',
        () async {
          final result = await localDataSource.updatePaymentMethods();

          expect(
            result.success,
            true,
          );
        },
      );

      test(
        '=> deletePaymentMethods',
        () async {
          final result = await localDataSource.deletePaymentMethods();

          expect(
            result.success,
            true,
          );
        },
      );
    },
  );
}
