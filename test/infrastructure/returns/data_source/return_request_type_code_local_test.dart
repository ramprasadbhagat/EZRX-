import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_type_code_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ReturnRequestTypeCodeLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ReturnRequestTypeCodeLocalDataSource();
    },
  );

  group(
    'Return Request Type Code',
    () {
      test(
        'Get Return Request Type Code List',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getReturnRequestTypeCode.json'),
          );

          final result = await localDataSource.getReturnRequestTypeCodeList();

          expect(
              result,
              List.from(res['data']['typeOfRequest'])
                  .map((e) =>
                      ReturnRequestTypeCodeDetailsDto.fromJson(e).toDomain())
                  .toList());
        },
      );
    },
  );
}
