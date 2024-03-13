import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AllCreditsAndInvoicesLocalDataSource localDataSource;


  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AllCreditsAndInvoicesLocalDataSource();
    },
  );

  group(
    'All Credits Local Datasource Test',
    () {
      test(
        '=> filterCredits',
        () async {
          final result = await localDataSource.getDocumentHeaderList();
          expect(
            result.length,
            10,
          );
        },
      );
    },
  );
}
