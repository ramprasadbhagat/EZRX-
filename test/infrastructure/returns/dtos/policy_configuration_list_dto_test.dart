import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/policy_configuration_list_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test Policy Configuration List dto ', () {
    setUp(() async {
      data = json.decode(await rootBundle
          .loadString('assets/json/getPolicyConfigurationResponse.json'));
    });
    test('=> Policy Configuration  fromDomain', () {
      final policyConfigurationListItem = PolicyConfigurationListDto.fromDomain(
          PolicyConfigurationListDto.fromJson(data['data']['policies'][0])
              .toDomain());
      expect(policyConfigurationListItem.salesOrg, '2601');
    });

    test('=> Policy Configuration tojson', () {
      final policyConfigurationListItem = PolicyConfigurationListDto.fromDomain(
              PolicyConfigurationListDto.fromJson(data['data']['policies'][0])
                  .toDomain())
          .toJson();
      expect(policyConfigurationListItem['salesOrg'], '2601');
    });
  });
}
