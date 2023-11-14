import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/invoice_order_item_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AllCreditsAndInvoicesLocalDataSource localDataSource;
  late List<InvoiceOrderItem> invoiceOrderItems;

  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AllCreditsAndInvoicesLocalDataSource();
      final jsonData = json.decode(
        await rootBundle.loadString(
          'assets/json/getOrdersForInvoiceIdResponse.json',
        ),
      );

      invoiceOrderItems = List.from(jsonData['data']['getOrdersForInvoiceId'])
          .map((e) => InvoiceOrderItemDto.fromJson(e).toDomain)
          .toList();
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

  group(
    'All InvoiceOrderItem Local Datasource Test',
    () {
      test(
        '=> InvoiceOrderItem',
        () async {
          final result = await localDataSource.getOrderForInvoice();
          expect(
            result,
            invoiceOrderItems,
          );
        },
      );
    },
  );
}
