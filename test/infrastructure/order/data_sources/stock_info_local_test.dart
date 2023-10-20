import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late StockInfoLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = StockInfoLocalDataSource();
    },
  );

  group(
    'Stock Info',
    () {
      test(
        'get stock info',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/stockInformationResponse.json'),
          );

          final result = await localDataSource.getStockInfo();

          expect(
            result,
            StockInfoDto.fromJson(res['data']['stockInformation']).toDomain(),
          );
        },
      );

      test(
        'get Stock info list',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/stockInformationListResponse.json'),
          );

          final result = await localDataSource.getStockInfoList();

          expect(
            result,
            List.from(res['data']['stockInformationList'])
                .map((e) => StockInfoDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
