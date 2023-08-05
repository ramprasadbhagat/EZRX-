import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test SalesOrganisationConfigsDto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/updateSalesOrgConfigSGResponse.json'),
      );
    });
    test('Test toDomain', () {
      final configs = UpdateSalesOrganisationConfigsDto.fromJson(
        data['data']['updateSalesOrgConfig']['salesOrgConfig'],
      ).toDomain();
      expect(configs.currency, Currency('sgd'));
    });
    test('Test fromDomain', () {
      final configsDto = UpdateSalesOrganisationConfigsDto.fromDomain(
        UpdateSalesOrganisationConfigsDto.fromJson(
          data['data']['updateSalesOrgConfig']['salesOrgConfig'],
        ).toDomain(),
      );
      expect(configsDto.currency, 'sgd');
    });
    test('Test toJson', () {
      final configsDtoMap = UpdateSalesOrganisationConfigsDto.fromDomain(
        UpdateSalesOrganisationConfigsDto.fromJson(
          data['data']['updateSalesOrgConfig']['salesOrgConfig'],
        ).toDomain(),
      ).toJson();
      expect(configsDtoMap['currency'], 'sgd');
    });
  });
}
