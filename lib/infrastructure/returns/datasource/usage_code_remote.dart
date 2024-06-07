import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/usage_dto.dart';

class UsageCodeRemoteDataSource {
  HttpService httpService;
  UsageCodeQueryMutation usageCodeQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  UsageCodeRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.usageCodeQueryMutation,
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
          'query': usageCodeQueryMutation.getUsageQuery(),
          'variables': {
            'salesOrg': salesOrg,
          },
        }),
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
    } else if (dataSourceExceptionHandler.isServerResponseError(res: res)) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
