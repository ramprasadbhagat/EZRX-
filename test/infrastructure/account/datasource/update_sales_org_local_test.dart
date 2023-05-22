import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UpdateSalesOrgLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = UpdateSalesOrgLocalDataSource();
    },
  );

  group(
    'Update Sales remote',
    () {
      test(
        'update sales org local data source test',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/updateSalesOrgConfigSGResponse.json'),
          );

          final result = await localDataSource.updateSalesOrgConfig(salesOrg: SalesOrg('2601').country);

          final finalData = res['data']['updateSalesOrgConfig']['salesOrgConfig'];

          expect(
            result,
            UpdateSalesOrganisationConfigsDto.fromJson(finalData).toDomain(),
          );
        },
      );
    },
  );
}
