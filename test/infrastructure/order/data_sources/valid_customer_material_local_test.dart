import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late ValidCustomerMaterialLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ValidCustomerMaterialLocalDataSource();
    },
  );

  group(
    'Valid Customer Material',
    () {
      test(
        'Get Valid Material List',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/validCustomerMaterialsResponse.json'),
          );

          final result = await localDataSource.getValidMaterialList(
            customerCode: '',
            focMaterialList: [],
            materialList: [],
            pickAndPackValue: '',
            salesOrganisation: '',
            shipToCode: '',
            userName: '',
          );

          final finalData = res['data']['validCustomerMaterials']['materials'];

          expect(
            result,
            List.from(finalData).map((e) => MaterialNumber(e)).toList(),
          );
        },
      );
    },
  );
}
