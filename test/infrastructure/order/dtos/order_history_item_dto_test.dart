
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_item_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details shipping info ', () {
    setUp(() async {
      data = {
        'Status': 'NA',
        'MaterialCode': 'fake-code',
        'MaterialDescription': 'fake-desc',
        'Qty': 10,
        'UnitPrice': 10.0,
        'TotalPrice': 20.0,
        'DeliveryDate': '',
        'DeliveryTime': 'fake-time',
        'LineNumber': '1',
        'Tax': 0,
        'OrderType': 'fake-type',
        'OrderNumber': 'fake-number',
        'EZRXNumber': '',
        'CreatedDate': '',
        'CreatedTime': 'fake-time',
        'OrderBy':'',
        'PurchaseOrderType': '',
      };
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryItemDto.fromDomain(OrderHistoryItemDto.fromJson(
              data)
          .toDomain());
      expect(configsDto.deliveryTime, 'fake-time');
    });

    test('Test toJson', () {
      final configsDto = OrderHistoryItemDto.fromDomain(OrderHistoryItemDto.fromJson(
                  data)
              .toDomain())
          .toJson();

      expect(configsDto['MaterialCode'], 'fake-code');
    });
  });
}
