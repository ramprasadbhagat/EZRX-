import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class BannerRemoteDataSource {
  HttpService httpService;
  HttpService eZReachHttpService;
  BannerQueryMutation bannerQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  BannerRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.eZReachHttpService,
    required this.bannerQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<List<BannerItem>> getEZReachBanners({
    required String salesOrg,
    required String country,
    required String role,
    required String bannerType,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await eZReachHttpService.request(
        method: 'POST',
        url: config.getEZReachUrl,
        data: jsonEncode({
          'query': bannerQueryMutation.getEZReachBannerQuery(),
          'variables': {
            'getLiveCampaignInput': {
              'country': country,
              'Salesorg': salesOrg,
              'role': role,
              'targetProduct': config.targetProduct,
              'bannerPlacement': bannerType,
              'sortField': 'banner_slot',
              'sort': 'asc',
            },
          },
        }),
        overrideBaseUrl: true,
      );

      _bannerExceptionChecker(res: res);

      return List.from(res.data['data']['getLiveCampaigns']['data'])
          .map((e) => EZReachBannerDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _bannerExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
