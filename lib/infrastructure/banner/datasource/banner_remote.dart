import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
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

  Future<List<BannerItem>> getBanners({
    required bool isPreSalesOrg,
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': bannerQueryMutation.getBannerQuery(),
          'variables': {
            'input': {
              'isPreSalesOrg': isPreSalesOrg,
              'salesOrg': salesOrg,
            },
          },
        }),
      );

      _bannerExceptionChecker(res: res);

      return List.from(res.data['data']['getBanners'])
          .map((e) => BannerDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _bannerExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
