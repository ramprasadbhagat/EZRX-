import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DownloadPaymentAttachmentLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = DownloadPaymentAttachmentLocalDataSource();
    },
  );

  group(
    'Download e-credit Local DataSource Test',
    () {
      test(
        'Get e credit url Local DataSource',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/eCreditResponse.json',
            ),
          );
          final data = ECreditInvoiceDto.fromJson(res['data'].first).toDomain();

          final result = await localDataSource.getECreditDownloadUrl();

          expect(
            result,
            data,
          );
        },
      );
    },
  );
}
