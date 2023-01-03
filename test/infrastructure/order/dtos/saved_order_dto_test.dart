import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test saved order dto ', () {
    setUp(() async {
      data = json.decode(await rootBundle
          .loadString('assets/json/getSavedOrdersResponse.json'));
    });
    test('Test fromDomain', () {
      final configs =
          SavedOrderDto.fromDomain(SavedOrderDto.fromJson(data['data']['draftOrders'][0]).toDomain());
      expect(configs.id, '2077372');
    });

    test('Test tojson', () {
      final configs =
          SavedOrderDto.fromDomain(SavedOrderDto.fromJson(data['data']['draftOrders'][0]).toDomain()).toJson();
      expect(configs['id'], '2077372');
    });
  });
}
