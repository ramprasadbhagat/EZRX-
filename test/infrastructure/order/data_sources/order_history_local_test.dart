import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late OrderHistoryLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = OrderHistoryLocalDataSource();
    },
  );

  group(
    'Order History',
    () {
      test(
        'Get Order History',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getOrderHistoryV2Response.json'),
          );

          final result = await localDataSource.getOrderHistory();

          final finalData = res['data']['orderHistoryV2']['OrderHistory'][0];

          expect(
            result,
            OrderHistoryDto.fromJson(finalData).toDomain(),
          );
        },
      );

      /*test(
        'Ge order history for sales rep',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getorderHistoryForSalesRepV2Response.json'),
          );

          final result =
              await localDataSource.getOrderHistoryForSalesRep();
          final finalData = res['data']['orderHistoryForSalesRepV2']['OrderHistory'][0];
          expect(
            result,
            OrderHistoryDto.fromJson(finalData).toDomain(),
          );
        },
      );*/
    },
  );
}
