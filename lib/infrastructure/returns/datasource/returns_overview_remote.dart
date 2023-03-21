import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/returns_overview.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/returns_overview_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/returns_overview_dto.dart';

class ReturnsOverviewRemoteDataSource {
  Config config;
  HttpService httpService;
  ReturnsOverviewMutation returnsOverviewMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  ReturnsOverviewRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.returnsOverviewMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<ReturnsOverview> fetch({
    required String soldTo,
    required String shipTo,
    required String salesOrg,
    required String username,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = returnsOverviewMutation.getReturnsOverview();

      final request = {
        'soldTo': soldTo,
        'shipTo': shipTo,
        'salesOrg': salesOrg,
        'username': username,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'request': request,
          },
        }),
      );

      _returnsOverviewExceptionChecker(res: res);

      return ReturnsOverviewDto.fromJson(
        res.data['data']['returnRequestsOverviewV2'],
      ).toDomain();
    });
  }

  void _returnsOverviewExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
