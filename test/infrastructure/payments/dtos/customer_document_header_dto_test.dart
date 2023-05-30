import 'dart:convert';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';
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

    test('=> CustomerDocumentHeaderDto fromJson and toDomain', () {
      final customerDocumentHeaderDto = CustomerDocumentHeaderDto.fromJson(
        data['data']['customerDocumentHeader'],
      ).toDomain();

      expect(customerDocumentHeaderDto.invoices.length, 11);
      
    });
  });
}
