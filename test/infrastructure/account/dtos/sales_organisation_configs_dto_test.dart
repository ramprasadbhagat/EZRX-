import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
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
            .loadString('assets/json/getSalesOrgConfigsResponse.json'),
      );
    });
    test('Test toDomain', () {
      final configs = SalesOrganisationConfigsDto.fromJson(
        data['data']['salesOrgConfigs'][0],
      ).toDomain();
      expect(configs.currency, Currency('myr'));
    });
    test('Test fromDomain', () {
      final configsDto = SalesOrganisationConfigsDto.fromDomain(
        SalesOrganisationConfigsDto.fromJson(
          data['data']['salesOrgConfigs'][0],
        ).toDomain(),
      );
      expect(configsDto.currency, 'myr');
    });
    test('Test toJson', () {
      final configsDtoMap = SalesOrganisationConfigsDto.fromDomain(
        SalesOrganisationConfigsDto.fromJson(
          data['data']['salesOrgConfigs'][0],
        ).toDomain(),
      ).toJson();
      expect(configsDtoMap['currency'], 'myr');
    });
  });
}
