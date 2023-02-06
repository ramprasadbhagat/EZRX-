import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late DiscountOverrideLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = DiscountOverrideLocalDataSource();
    },
  );

  group(
    'Discount Override',
    () {
      test(
        'Get Material Override Price List',
        () async {

          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getMaterialPriceResponse.json'),
          );

          final finalData = res['data']['price'];

          final result = await localDataSource.getPriceList();

          expect(
            result,
            List.from(finalData)
                .map((e) => PriceDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
