import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_header_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test Order History Details Dto order header ', () {
    setUp(() async {
      data = {
        'TotalTax': 10.0,
        'RequestedDeliveryDate': 'fake-date',
        'POReference': 'fake-poref',
        'Type': 'fake-type',
        'TelephoneNumber': '908979',
        'OrderValue': 5.0,
        'CreatedDate': 'fake-date',
        'EZRXNumber': 'fake-no',
        'OrderBy': '',
      };
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsOrderHeadersDto.fromDomain(
        OrderHistoryDetailsOrderHeadersDto.fromJson(
          data,
        ).toDomain(),
      );

      expect(configs.totalTax, 10.0);
    });

    test('Test toDomain', () {
      final configs = OrderHistoryDetailsOrderHeadersDto.fromJson(
        data,
      ).toDomain();

      expect(configs.totalTax, 10.0);
    });

    test('Test toJson', () {
      final configs = OrderHistoryDetailsOrderHeadersDto.fromDomain(
        OrderHistoryDetailsOrderHeadersDto.fromJson(
          data,
        ).toDomain(),
      ).toJson();

      expect(configs['TotalTax'], 10.0);
    });
  });
}
