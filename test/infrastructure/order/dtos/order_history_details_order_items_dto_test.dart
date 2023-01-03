import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test Order History Details order item details Dto ', () {
    setUp(() async {
      data = {
        'Type': 'fake-type',
        'MaterialCode': 'fake-code',
        'MaterialDescription': 'fake-desc',
        'Qty': 10,
        'UnitPrice': 10.0,
        'TotalPrice': 20.0,
        'Tax': 0,
        'SAPStatus': 'fake-status',
        'PlannedDeliveryDate': 'fake-date',
        'PickedQuantity': 0,
        'Batch': 'fake-batch',
        'ExpiryDate': 'fake-date',
        'LineReferenceNotes': '',
        'IsTenderContractMaterial': false,
        'Details': [],
        'TenderContractDetails': <String, dynamic>{},
      };
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsOrderItemDto.fromDomain(
          OrderHistoryDetailsOrderItemDto.fromJson(
        data,
      ).toDomain());

      expect(configs.batch, 'fake-batch');
    });

    test('Test tojson', () {
      final configs = OrderHistoryDetailsOrderItemDto.fromDomain(
          OrderHistoryDetailsOrderItemDto.fromJson(
        data,
      ).toDomain()).toJson();

      expect(configs['Batch'], 'fake-batch');
    });
  });
}
