import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late BannerRemoteDataSource remoteDataSource;
  late String saleOrgName;
  late bool isPreSalesOrg;
  late Map<String, Object> variables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = BannerRemoteDataSource(
        config: Config(),
        httpService: service,
        eZReachHttpService: service,
        bannerQueryMutation: BannerQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler());

    saleOrgName = '2601';
    isPreSalesOrg = false;

    variables = {
      'input': {
        'isPreSalesOrg': isPreSalesOrg,
        'salesOrg': saleOrgName,
      },
    };
  });

  group('Banner Remote Test', () {
    test('Get Banners', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/getBannersResponse.json'),
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
          'query': remoteDataSource.bannerQueryMutation.getBannerQuery(),
          'variables': variables,
        }),
      );

      final result = await remoteDataSource.getBanners(
          isPreSalesOrg: false, salesOrg: saleOrgName);

      expect(result.length, List.from(res['data']['getBanners']).length);
    });

    test('Exception Checker with status code not equal to 200', () async {
      dioAdapter.onPost(
        '${remoteDataSource.config.urlConstants}license',
        (server) => server.reply(
          204,
          {
            'data': {'getBanners': []}
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.bannerQueryMutation.getBannerQuery(),
          'variables': {
            'input': {
              'isPreSalesOrg': isPreSalesOrg,
              'salesOrg': saleOrgName,
            },
          },
        }),
      );

      await remoteDataSource
          .getBanners(isPreSalesOrg: isPreSalesOrg, salesOrg: saleOrgName)
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(<BannerItem>[]);
      });
    });
    test('Exception Checker with status code equals to 200', () async {
      dioAdapter.onPost(
        '${remoteDataSource.config.urlConstants}license',
        (server) => server.reply(
          200,
          {
            'data': null,
            'errors': [
              {'message': 'fake error message'}
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.bannerQueryMutation.getBannerQuery(),
          'variables': {
            'input': {
              'isPreSalesOrg': isPreSalesOrg,
              'salesOrg': saleOrgName,
            },
          },
        }),
      );

      await remoteDataSource
          .getBanners(isPreSalesOrg: isPreSalesOrg, salesOrg: saleOrgName)
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(<BannerItem>[]);
      });
    });
  });
}
