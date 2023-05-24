import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnPriceLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ReturnPriceLocalDataSource();
    },
  );

  group(
    'Return Price Local DataSource => ',
    () {
      test(
        'getReturnPrice',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/getReturnPrice.json'),
          );

          final result = await localDataSource.fetchReturnPrice();

          expect(
              result,
              ReturnPriceDto.fromJson(res['data']['getReturnPrice'][0])
                  .toDomain());
        },
      );
    },
  );
}
