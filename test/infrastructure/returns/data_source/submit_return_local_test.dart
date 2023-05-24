import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/submit_return_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SubmitReturnRequestLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = SubmitReturnRequestLocalDataSource();
    },
  );

  group(
    'Submit Return Local DataSource => ',
    () {
      test(
        'submit return',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSubmitReturnRequestResponse.json'),
          );

          final result = await localDataSource.submitReturnRequest();

          expect(
              result,
              SubmitReturnResponseDto.fromJson(
                res['data']['addRequestV2'],
              ).toDomain());
        },
      );
    },
  );
}
