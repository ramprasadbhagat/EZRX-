import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late MaterialBundleListLocalDatasource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = MaterialBundleListLocalDatasource();
    },
  );

  group(
    'Material Bundle List',
    () {
      test(
        'Get material bundle list',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getMaterialBundleListResponse.json'),
          );

          final result = await localDataSource.getMaterialBundleList();

          expect(
            result,
            List.from(
              makeResponseCamelCase(
                jsonEncode(res['data']['GetBundles']),
              ),
            ).map((e) => MaterialDto.fromJson(e).toDomain()).toList(),
          );
        },
      );

      test(
        'Get material bundle list for sales rep',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/getMaterialBundleListForSalesRepResponse.json',
            ),
          );

          final result =
              await localDataSource.getMaterialBundleListForSalesRep();

          expect(
            result,
            List.from(
              makeResponseCamelCase(
                jsonEncode(res['data']['GetBundlesForSalesRep']),
              ),
            ).map((e) => MaterialDto.fromJson(e).toDomain()).toList(),
          );
        },
      );
    },
  );
}
