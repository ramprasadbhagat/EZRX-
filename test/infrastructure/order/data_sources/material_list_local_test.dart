import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MaterialListLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = MaterialListLocalDataSource();
    },
  );

  group(
    'Material List',
    () {
      test(
        'Get material list',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getMaterialsWithMetaResponse.json'),
          );

          final result = await localDataSource.getMaterialList();

          final finalData = res['data']['materialsWithMeta']['materials'];

          expect(
            result,
            List.from(finalData)
                .map((e) => MaterialDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );

      test(
        'search material list',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getMaterialsWithMetaResponse.json'),
          );

          final result = await localDataSource.searchMaterialList();
          final finalData = res['data']['materialsWithMeta']['materials'];
          expect(
            result,
            List.from(finalData)
                .map((e) => MaterialDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
