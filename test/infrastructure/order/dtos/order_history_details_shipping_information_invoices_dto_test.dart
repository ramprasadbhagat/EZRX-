import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_shipping_information_invoices_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details shipping info ', () {
    setUp(() async {
      data = {
        'InvoiceNumber': '1234',
        'InvoiceDate': 'fake-date',
        'InvoicePrice': '100',
      };
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryDetailsInvoicesDto.fromDomain(
          OrderHistoryDetailsInvoicesDto.fromJson(data).toDomain());
      expect(configsDto.invoiceNumber, '1234');
    });
  });
}
