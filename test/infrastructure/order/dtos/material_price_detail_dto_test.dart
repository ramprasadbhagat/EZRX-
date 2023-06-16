import 'dart:convert';

import 'package:ezrxmobile/infrastructure/order/dtos/material_price_detail_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/getCustomerMaterialPriceDetailResponse.json'),
      );
    });
    test('Test toDomain', () {
      
      final configs = MaterialDetailDto.fromJson(
        data['data']['customerMaterialPriceDetails'][0]
      ).toDomain();
      expect(configs.price.materialNumber.getOrCrash(), '000000000021038305');
    });
  });
}
