import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late ViewByOrderDetailsLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ViewByOrderDetailsLocalDataSource();
    },
  );

  group(
    'Order History Details',
    () {
      test(
        'Get Order History Details',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getOrderDetailsResponse.json'),
          );

          final result = await localDataSource.getOrderHistoryDetails();

          final finalData = res['data']['orderDetails'];

          expect(
            result,
            OrderHistoryDetailsDto.fromJson(finalData).toDomain(),
          );
        },
      );

      test(
        'Ge order history for sales rep',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getorderDetailsForSalesRep.json'),
          );

          final result =
              await localDataSource.getOrderHistoryDetailsForSalesRep();
          final finalData = res['data']['orderDetailsForSalesRep'];
          expect(
            result,
            OrderHistoryDetailsDto.fromJson(finalData).toDomain(),
          );
        },
      );
    },
  );
}
