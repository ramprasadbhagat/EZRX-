import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late OrderTemplateLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = OrderTemplateLocalDataSource();
    },
  );

  group(
    'Order Template',
    () {
      test(
        'Get order template ',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getOrderTemplatesResponse.json'),
          );

          final result = await localDataSource.getOrderTemplates();
          final finalData = res['data']['orderTemplates'];
          expect(
            result,
            List.from(finalData)
                .where((e) => json.decode(e['cartList']) != null)
                .map((e) => OrderTemplateDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );

      test(
        'save order template',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/saveOrderTemplatesResponse.json'),
          );

          final result = await localDataSource.saveOrderTemplate();

          expect(
            result,
            OrderTemplateDto.fromJson(
              res['data']['createOrderTemplate']['orderTemplate'],
            ).toDomain(),
          );
        },
      );
    },
  );
}
