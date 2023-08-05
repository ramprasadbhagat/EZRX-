import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_shipping_information_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details shipping info ', () {
    setUp(() async {
      data = {
        'Address': 'fake-address',
        'POReference': 'fake-ref',
        'InvoiceNumber': '87786',
        'InvoiceDate': 'fake-date',
        'PostalCode': '9877978',
        'Country': 'fake-country',
        'Phone': '1234',
        'Fax': '',
        'Invoices': []
      };
    });
    test('Test toDomain', () {
      final configs =
          OrderHistoryDetailsShippingInformationDto.fromJson(data).toDomain();

      expect(configs.address, 'fake-address');
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryDetailsShippingInformationDto.fromDomain(
        OrderHistoryDetailsShippingInformationDto.fromJson(data).toDomain(),
      );
      expect(configsDto.address, 'fake-address');
    });

    test('Test tojson', () {
      final configsDto = OrderHistoryDetailsShippingInformationDto.fromDomain(
        OrderHistoryDetailsShippingInformationDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configsDto['Address'], 'fake-address');
    });
  });
}
