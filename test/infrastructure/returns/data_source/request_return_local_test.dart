import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RequestReturnLocalDatasource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = RequestReturnLocalDatasource();
    },
  );

  group(
    'Request Return Local Datasource => ',
    () {
      test(
        'searchReturnMaterials',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getRequestReturnMaterials.json'),
          );

          final result = await localDataSource.searchReturnMaterials();

          expect(
              result,
              ReturnRequestDto.fromJson(res['data']['searchReturnMaterials'])
                  .toDomain());
        },
      );
    },
  );
}
