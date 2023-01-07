import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PolicyConfigurationLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = PolicyConfigurationLocalDataSource();
    },
  );
  group(
    'Policy Configuration List Local Datasource Test',
    () {
      test(
        '=> getPolicyConfigurationList',
        () async {
          final result = await localDataSource.getPolicyConfigurationList();

          expect(
            result.length,
            32,
          );
        },
      );
    },
  );
}
