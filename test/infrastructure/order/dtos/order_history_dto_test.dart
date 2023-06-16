import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details shipping info ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/getOrderHistoryV2Response.json'),
      );
    });

    test('Test fromDomain', () {
      final configsDto = OrderHistoryDto.fromDomain(OrderHistoryDto.fromJson(
              data['data']['orderHistoryV2']['OrderHistory'][0])
          .toDomain());
      expect(configsDto.orderBasicInformation.shipTo, '0070042688');
    });

    test('Test toJson', () {
      final configsDto = OrderHistoryDto.fromDomain(OrderHistoryDto.fromJson(
                  data['data']['orderHistoryV2']['OrderHistory'][0])
              .toDomain())
          .toJson();

      expect(configsDto['OrderBasicInformation']['ShipTo'], '0070042688');
    });
  });
}
