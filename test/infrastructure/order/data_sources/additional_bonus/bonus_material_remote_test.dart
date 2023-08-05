import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialInfoMock extends Mock implements MaterialInfo {}

void main() {
  late BonusMaterialRemoteDataSource remoteDataSource;
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
      remoteDataSource = BonusMaterialRemoteDataSource(
        httpService: service,
        config: Config(),
        bonusQueryMutation: BonusMaterialQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Bonus material',
    () {
      test('Get additional Bonus', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/additionalBonusMaterial.json'),
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
            'query': remoteDataSource.bonusQueryMutation.getBonusItem(),
            'variables': {
              'customerCode': 'fake-customercode',
              'shipToCode': 'fake-shipto',
              'salesOrganisation': 'fake-salesorg',
              'searchKey': '',
            },
          }),
        );

        final result = await remoteDataSource.getadditionalBonus(
          customerCodeSoldTo: 'fake-customercode',
          salesOrganisation: 'fake-salesorg',
          searchKey: '',
          shipToCode: 'fake-shipto',
        );

        expect(
          result,
          List.from(
            res['data']['additionalBonusMaterial']['materials'],
          )
              .map(
                (e) => MaterialDto.fromJson(e).toDomain(),
              )
              .toList(),
        );
      });

      test('Customer Materials For SalesRep', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/customerMaterialsForSalesRep.json'),
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
            'query':
                remoteDataSource.bonusQueryMutation.getBonusItemforSalesRep(),
            'variables': {
              'username': 'fake-username',
              'customerSoldToCode': 'fake-customercode',
              'customerShipToCode': 'fake-shipto',
              'salesOrganisation': 'fake-salesorg',
              'gimmickMaterial': false,
              'searchKey': '',
              'pickAndPack': '',
            },
          }),
        );

        final result = await remoteDataSource.customerMaterialsForSalesRep(
          salesOrganisation: 'fake-salesorg',
          searchKey: '',
          gimmickMaterial: false,
          pickandpack: '',
          shipTo: 'fake-shipto',
          soldTo: 'fake-customercode',
          username: 'fake-username',
        );

        expect(
          result,
          List.from(
            res['data']['customerMaterialsForSalesRep']['materials'],
          )
              .map(
                (e) => MaterialDto.fromJson(e).toDomain(),
              )
              .toList(),
        );
      });

      test(
        '=> bonusMaterial Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.bonusQueryMutation.getBonusItem(),
              'variables': {
                'customerCode': 'fake-customercode',
                'shipToCode': 'fake-shipto',
                'salesOrganisation': 'fake-salesorg',
                'searchKey': '',
              },
            }),
          );

          await remoteDataSource
              .getadditionalBonus(
            customerCodeSoldTo: 'fake-customercode',
            salesOrganisation: 'fake-salesorg',
            searchKey: '',
            shipToCode: 'fake-shipto',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MaterialInfoMock>[]);
          });
        },
      );

      test(
        'Response with error',
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
              'query': remoteDataSource.bonusQueryMutation.getBonusItem(),
              'variables': {
                'customerCode': 'fake-customercode',
                'shipToCode': 'fake-shipto',
                'salesOrganisation': 'fake-salesorg',
                'searchKey': '',
              },
            }),
          );

          await remoteDataSource
              .getadditionalBonus(
            customerCodeSoldTo: 'fake-customercode',
            salesOrganisation: 'fake-salesorg',
            searchKey: '',
            shipToCode: 'fake-shipto',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<MaterialInfoMock>[]);
          });
        },
      );
    },
  );
}
