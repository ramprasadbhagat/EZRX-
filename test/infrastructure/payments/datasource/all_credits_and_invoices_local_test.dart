import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_statuses_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AllCreditsAndInvoicesLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AllCreditsAndInvoicesLocalDataSource();
    },
  );

  group(
    'All credits and invoices Local Datasource Test',
    () {
      test(
        'get all available statuses',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/availableStatusesResponse.json',
            ),
          );

          final result = await localDataSource.getAvailableStatuses();

          expect(
            result,
            AvailableStatusesDto.fromJson(res['data']['availableStatuses'])
                .toDomain(),
          );
        },
      );
      test(
        'get all credits and invoices',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/customerDocumentHeaderResponse.json',
            ),
          );
          final result = await localDataSource.getCustomerDocumentHeader();

          expect(
            result,
            CustomerDocumentHeaderDto.fromJson(
                    res['data']['customerDocumentHeader'])
                .toDomain(),
          );
        },
      );
    },
  );
}
