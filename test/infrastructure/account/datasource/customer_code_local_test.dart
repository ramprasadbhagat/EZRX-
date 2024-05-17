import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_config_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CustomerCodeLocalDataSource localDataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = CustomerCodeLocalDataSource();
  });

  group('Customer Code Local DataSource Test', () {
    test(
      '=> getCustomerCodeConfig',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/customerCodeConfig.json',
          ),
        );
        final result = await localDataSource.getCustomerCodeConfig();

        expect(
          result,
          CustomerCodeConfigDto.fromJson(res['data']['customerConfig'])
              .toDomain,
        );
      },
    );
  });
}
