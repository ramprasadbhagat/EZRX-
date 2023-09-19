import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../presentation/home/carousel_banner/carousel_banner_tile_test.dart';

void main() {
  late BannerRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final service = MockHTTPService();

  final variables = {
    'getLiveCampaignInput': {
      'country': 'mockCountry',
      'Salesorg': '2601',
      'role': 'client',
      'targetProduct': 'EZRX+',
      'bannerPlacement': 'banner_carousel',
      'sortField': 'banner_slot',
      'sort': 'asc',
    },
  };

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = BannerRemoteDataSource(
      config: Config()..appFlavor = Flavor.uat,
      httpService: service,
      eZReachHttpService: service,
      bannerQueryMutation: BannerQueryMutation(),
      dataSourceExceptionHandler: DataSourceExceptionHandler(),
    );
  });

  group('Banner Remote Test', () {
    test('Get Banners', () async {
      final res = json.decode(
        await rootBundle
            .loadString('assets/json/getEZReachBannerResponse.json'),
      );

      when(
        () => service.request(
          method: 'POST',
          url: 'https://campaignengine-stg.ezreach.io/query',
          data: jsonEncode({
            'query':
                remoteDataSource.bannerQueryMutation.getEZReachBannerQuery(),
            'variables': variables,
          }),
          overrideBaseUrl: true,
        ),
      ).thenAnswer(
        (invocation) async => Response(
          data: res,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: 'https://campaignengine-stg.ezreach.io/query',
          ),
        ),
      );

      final result = await remoteDataSource.getEZReachBanners(
        salesOrg: '2601',
        country: 'mockCountry',
        role: 'client',
        bannerType: 'banner_carousel',
      );

      expect(
        result.length,
        List.from(res['data']['getLiveCampaigns']['data']).length,
      );
    });

    test('Exception Checker with status code not equal to 200', () async {
      when(
        () => service.request(
          method: 'POST',
          url: 'https://campaignengine-stg.ezreach.io/query',
          data: jsonEncode({
            'query':
                remoteDataSource.bannerQueryMutation.getEZReachBannerQuery(),
            'variables': variables,
          }),
          overrideBaseUrl: true,
        ),
      ).thenAnswer(
        (invocation) async => Response(
          data: [],
          statusCode: 204,
          requestOptions: RequestOptions(
            path: 'https://campaignengine-stg.ezreach.io/query',
          ),
        ),
      );

      await remoteDataSource
          .getEZReachBanners(
        salesOrg: '2601',
        country: 'mockCountry',
        role: 'client',
        bannerType: 'banner_carousel',
      )
          .onError((error, stackTrace) {
        expect(
          error,
          isA<ServerException>(),
        );
        expect(
          (error as ServerException).code,
          204,
        );
        return Future.value(<EZReachBanner>[]);
      });
    });
  });
}
