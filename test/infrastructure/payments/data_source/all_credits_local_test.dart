import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AllCreditsAndInvoicesLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AllCreditsAndInvoicesLocalDataSource();
    },
  );

  group(
    'All Credits Local Datasource Test',
    () {
      test(
        '=> getAllCredits',
        () async {
          final result = await localDataSource.getCustomerDocumentHeader();
          expect(
            result.invoices.length,
            3,
          );
        },
      );
    },
  );
}
