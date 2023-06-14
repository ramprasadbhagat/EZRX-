import 'dart:convert';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> All Credits And Invoices dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/customerDocumentHeaderResponse.json'),
      );
    });

    test('=> CreditAndInvoiceItemDto fromJson and toDomain', () {
      final creditAndInvoiceItemDto = CreditAndInvoiceItemDto.fromJson(
        data['data']['customerDocumentHeader']['documentHeaderList'][0],
      ).toDomain();

      expect(creditAndInvoiceItemDto.accountingDocument, '0340000002');
      
    });
  });
}
