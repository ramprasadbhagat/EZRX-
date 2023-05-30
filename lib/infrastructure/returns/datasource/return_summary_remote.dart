import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/requests_by_user_return_summary_dto.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_request_by_user_query_mutation.dart';

class ReturnSummaryRemoteDataSource {
  HttpService httpService;
  ReturnSummaryQueryMutation returnSummaryQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnSummaryRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.returnSummaryQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<ReturnSummaryRequestByUser> getReturnSummaryRequestByUser({
    required String soldTo,
    required String shipTo,
    required String username,
    required int pageSize,
    required int offset,
    required Map<String, dynamic> filterQuery,

  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': returnSummaryQueryMutation.getrequestsByUserV2Query(),
          'variables': {
            'request': {
              'soldTo': soldTo,
              'shipTo': shipTo,
              'username': username,
              'first': pageSize,
              'after': offset,
              ...filterQuery,
            },
          },
        }),
      );

      _returnSummaryRequestInformationExceptionChecker(res: res);

      return ReturnSummaryRequestByUserDto.fromJson(
        res.data['data']['requestsByUserV2'],
      ).toDomain();
    });
  }

  void _returnSummaryRequestInformationExceptionChecker({
    required Response<dynamic> res,
  }) {
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
