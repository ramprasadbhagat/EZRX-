import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/usage_dto.dart';

class UsageRemoteDataSource {
  HttpService httpService;
  UsageQueryMutation usageQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  UsageRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.usageQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<List<Usage>> getUsages({
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': usageQueryMutation.getUsageQuery(),
          'variables': {
            'salesOrg': salesOrg,
          },
        }),
        apiEndpoint: 'getUsages',
      );

      _usageExceptionChecker(res: res);

      return List.from(res.data['data']['usage'])
          .map((e) => UsageDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _usageExceptionChecker({required Response<dynamic> res}) {
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
