import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  const fakePurchaseOrderType = 'fake-purchase-order-type';
  group('Test submitorderdto ', () {
    setUp(() async {
      data = {
        'username': 'test-name',
        'companyName': 'test-name',
        'PurchaseOrderType': fakePurchaseOrderType,
        'customer': <String, dynamic>{},
      };
    });
    test('Test toDomain', () {
      final configs = SubmitOrderDto.fromJson(data).toDomain();

      expect(configs.companyName.getOrCrash(), 'test-name');
      expect(configs.purchaseOrderType, fakePurchaseOrderType);
    });

    test('Test fromDomain', () {
      final configsDto = SubmitOrderDto.fromDomain(
        SubmitOrderDto.fromJson(data).toDomain(),
      );
      expect(configsDto.companyName, 'test-name');
      expect(configsDto.purchaseOrderType, fakePurchaseOrderType);
    });

    test('Test toJson', () {
      final configsDto = SubmitOrderDto.fromDomain(
        SubmitOrderDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configsDto['companyName'], 'test-name');
      expect(configsDto['PurchaseOrderType'], fakePurchaseOrderType);
    });
  });
}
