import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class BannerRemoteDataSource {
  HttpService httpService;
  BannerQueryMutation bannerQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  BannerRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.bannerQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<List<EZReachBanner>> getEZReachBanners({
    required String salesOrg,
    required String country,
    required String role,
    required String bannerType,
    required String branchCode,
    required String targetCustomerType,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final liveCampaignInput = {
        'country': country,
        'Salesorg': salesOrg,
        'role': role,
        'targetProduct': config.targetProduct,
        'bannerPlacement': bannerType,
        'sortField': 'banner_slot',
        'sort': 'asc',
        if (branchCode.isNotEmpty) 'branchCode': branchCode,
        if (targetCustomerType.isNotEmpty)
          'targetCustomerType': targetCustomerType,
      };
      final res = await httpService.request(
        method: 'POST',
        url: config.getEZReachUrlConstant,
        data: jsonEncode({
          'query': bannerQueryMutation.getEZReachBannerQuery(),
          'variables': {
            'getLiveCampaignInput': liveCampaignInput,
          },
        }),
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
