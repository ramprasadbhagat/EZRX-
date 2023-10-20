import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BonusMaterialLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = BonusMaterialLocalDataSource();
    },
  );

  group(
    'Bonus Material',
    () {
      test(
        'Bonus material get additional bonus',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/additionalBonusMaterial.json'),
          );

          final result = await localDataSource.getadditionalBonus();

          expect(
            result,
            List.from(res['data']['additionalBonusMaterial']['materials'])
                .map((e) => MaterialDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );

      test(
        'customerMaterialsForSalesRep',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/customerMaterialsForSalesRep.json'),
          );

          final result = await localDataSource.customerMaterialsForSalesRep();

          expect(
            result,
            List.from(res['data']['customerMaterialsForSalesRep']['materials'])
                .map((e) => MaterialDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
