import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test OrderHistoryDetailsDto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/getOrderDetailsResponse.json'),
      );
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsDto.fromDomain(
        OrderHistoryDetailsDto.fromJson(
          data['data']['orderDetails'],
        ).toDomain(),
      );

      expect(configs.orderHistoryDetailsOrderHeader.type, 'ZPOR');
    });

    test('Test tojson', () {
      final configs = OrderHistoryDetailsDto.fromDomain(
        OrderHistoryDetailsDto.fromJson(
          data['data']['orderDetails'],
        ).toDomain(),
      ).toJson();

      expect(configs['OrderHeader']['EZRXNumber'], 'EZRX-dc70b03');
    });
  });
}
