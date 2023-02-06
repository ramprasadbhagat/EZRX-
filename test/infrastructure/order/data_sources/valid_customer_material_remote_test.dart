import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_materials_query.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialNumberMock extends Mock implements MaterialNumber {}

void main() {
  late ValidCustomerMaterialRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

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
      remoteDataSource = ValidCustomerMaterialRemoteDataSource(
        httpService: service,
        config: Config(),
        validCustomMaterialQuery: ValidCustomMaterialQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Valid Customer material',
    () {
      test(
        'Get Valid Material List',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/validCustomerMaterialsResponse.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.validCustomMaterialQuery
                  .getValidCustomerMaterial(),
              'variables': {
                'request': {
                  'customerShipToCode': 'fake-shipto',
                  'customerSoldToCode': 'fake-customercode',
                  'salesOrganisation': 'fake-salesorg',
                  'materialNumberList': [],
                  'focMaterialNumberList': [],
                  'pickAndPack': '',
                },
              },
            }),
          );

          final result = await remoteDataSource.getValidMaterialList(
              customerCode: 'fake-customercode',
              focMaterialList: [],
              materialList: [],
              pickAndPackValue: '',
              salesOrganisation: 'fake-salesorg',
              shipToCode: 'fake-shipto',
              userName: 'fake-username');

          final finalData = res['data']['validCustomerMaterials']['materials'];
          expect(
            result,
            List.from(finalData).map((e) => MaterialNumber(e)).toList(),
          );
        },
      );

      test(
        'statuscode not equal to 200',
        () async {

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              205,
              {
                'data': {
                  'validCustomerMaterials': {'materials': []}
                }
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.validCustomMaterialQuery
                  .getValidCustomerMaterial(),
              'variables': {
                'request': {
                  'customerShipToCode': 'fake-shipto',
                  'customerSoldToCode': 'fake-customercode',
                  'salesOrganisation': 'fake-salesorg',
                  'materialNumberList': [],
                  'focMaterialNumberList': [],
                  'pickAndPack': '',
                },
              },
            }),
          );

          await remoteDataSource
              .getValidMaterialList(
                  customerCode: 'fake-customercode',
                  focMaterialList: [],
                  materialList: [],
                  pickAndPackValue: '',
                  salesOrganisation: 'fake-salesorg',
                  shipToCode: 'fake-shipto',
                  userName: 'fake-username')
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MaterialNumberMock>[]);
          });
        },
      );

      test(
        'response with error',
        () async {
          
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.validCustomMaterialQuery
                  .getValidCustomerMaterial(),
              'variables': {
                'request': {
                  'customerShipToCode': 'fake-shipto',
                  'customerSoldToCode': 'fake-customercode',
                  'salesOrganisation': 'fake-salesorg',
                  'materialNumberList': [],
                  'focMaterialNumberList': [],
                  'pickAndPack': '',
                },
              },
            }),
          );

          await remoteDataSource
              .getValidMaterialList(
                  customerCode: 'fake-customercode',
                  focMaterialList: [],
                  materialList: [],
                  pickAndPackValue: '',
                  salesOrganisation: 'fake-salesorg',
                  shipToCode: 'fake-shipto',
                  userName: 'fake-username')
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MaterialNumberMock>[]);
          });
        },
      );
    },
  );
}
