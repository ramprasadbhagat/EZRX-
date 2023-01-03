import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_tender_contract_details_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details order items tender contract details ', () {
    setUp(() async {
      data = {
        'TenderContractNumber': '7615757',
        'TenderContractReference': 'fake-referencenumber',
        'TenderPackageDescription': 'fake-ref-desc',
      };
    });
    test('Test toDomain', () {
      final configs =
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(data)
              .toDomain();

      expect(configs.tenderContractNumber, '7615757');
    });

    test('Test fromDomain', () {
      final configsDto =
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(
              OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
                      data)
                  .toDomain());
      expect(configsDto.tenderContractNumber, '7615757');
    });

    test('Test tojson', () {
      final configsDto =
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(
              OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
                      data)
                  .toDomain()).toJson();
      expect(configsDto['TenderContractNumber'], '7615757');
    });
  });
}
