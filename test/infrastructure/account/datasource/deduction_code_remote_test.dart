import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/add_deduction_code_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class DeductionCodeMock extends Mock implements DeductionCode {}

class AddDeductionCodeMock extends Mock implements AddDeductionCode {}

void main() {
  late DeductionCodeRemoteDataSource remoteDataSource;
  late String salesOrg;
  late String salesDistrict;
  late String deductionCode;
  late String amountType;
  late String deductionDescription;

  late Map<String, Object> getDeductionCodeVariables,
      addDeductionCodeVariables,
      deleteDeductionCodeVariables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = DeductionCodeRemoteDataSource(
        deductionCodeQueryMutation: DeductionCodeQueryMutation(),
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      salesOrg = '2601';
      salesDistrict = 'HNO';
      deductionCode = 'R4';
      amountType = 'Return';
      deductionDescription = 'Test';
      getDeductionCodeVariables = {'request': {}};
      addDeductionCodeVariables = {
        'input': {
          'salesOrg': salesOrg,
          'salesDistrict': salesDistrict,
          'deductionCode': deductionCode,
          'amountType': amountType,
          'deductionDescription': deductionDescription,
        },
      };
      deleteDeductionCodeVariables = {
        'request': {
          'salesOrg': salesOrg,
          'salesDistrict': salesDistrict,
          'deductionCode': deductionCode,
        },
      };
    },
  );

  group(
    'DeductionCode Remote for getDeductionCodes',
    () {
      test(
        '=> Success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getDeductionCodesResponse.json'),
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.deductionCodeQueryMutation
                  .getDeductionCodesQuery(),
              'variables': getDeductionCodeVariables,
            }),
          );

          final result = await remoteDataSource.getDeductionCodes();
          expect(
            result.length,
            List.from(res['data']['deductionCodes'])
                .map((e) => DeductionCodeDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );

      test(
        '=> Failure',
        () async {
          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.deductionCodeQueryMutation
                  .getDeductionCodesQuery(),
              'variables': getDeductionCodeVariables,
            }),
          );

          await remoteDataSource.getDeductionCodes().onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<DeductionCodeMock>[]);
          });
        },
      );
    },
  );

  group(
    'DeductionCode Remote for addDeductionCode',
    () {
      test(
        '=> Success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/addDeductionCodeResponse.json'),
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.deductionCodeQueryMutation
                  .addDeductionCodesMutation(),
              'variables': addDeductionCodeVariables,
            }),
          );

          final result = await remoteDataSource.addDeductionCode(
            salesOrg: salesOrg,
            amountType: amountType,
            deductionCode: deductionCode,
            deductionDescription: deductionDescription,
            salesDistrict: salesDistrict,
          );
          expect(
            result.success,
            AddDeductionCodeDto.fromJson(
              res['data']['addDeductionCode'],
            ).toDomain().success,
          );
        },
      );

      test(
        '=> Failure',
        () async {
          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.deductionCodeQueryMutation
                  .addDeductionCodesMutation(),
              'variables': addDeductionCodeVariables,
            }),
          );

          await remoteDataSource
              .addDeductionCode(
            salesOrg: salesOrg,
            amountType: amountType,
            deductionCode: deductionCode,
            deductionDescription: deductionDescription,
            salesDistrict: salesDistrict,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(AddDeductionCodeMock());
          });
        },
      );
    },
  );

  group(
    'DeductionCode Remote for deleteDeductionCode',
    () {
      test(
        '=> Success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/deleteDeductionCodeResponse.json'),
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.deductionCodeQueryMutation
                  .deleteDeductionCodesMutation(),
              'variables': deleteDeductionCodeVariables,
            }),
          );

          final result = await remoteDataSource.deleteDeductionCode(
            deductionCode: deductionCode,
            salesDistrict: salesDistrict,
            salesOrg: salesOrg,
          );
          expect(
            result.success,
            AddDeductionCodeDto.fromJson(
              res['data']['deleteDeductionCode'],
            ).toDomain().success,
          );
        },
      );

      test(
        '=> Failure',
        () async {
          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.deductionCodeQueryMutation
                  .deleteDeductionCodesMutation(),
              'variables': deleteDeductionCodeVariables,
            }),
          );

          await remoteDataSource
              .deleteDeductionCode(
            salesOrg: salesOrg,
            deductionCode: deductionCode,
            salesDistrict: salesDistrict,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(AddDeductionCodeMock());
          });
        },
      );
    },
  );
}
