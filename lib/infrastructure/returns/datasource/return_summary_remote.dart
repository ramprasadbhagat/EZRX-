import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/requests_by_user_return_summary_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_dto.dart';

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

  Future<List<ReturnSummaryRequestByUser>> getReturnSummaryRequestByUser({
    required String soldTo,
    required String shipTo,
    required String username,
    required int pageSize,
    required int offSet,
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
              'after': offSet,
            },
          },
        }),
      );

      _returnSummaryRequestInformationExceptionChecker(res: res);

      return List.from(res.data['data']['requestsByUserV2'])
          .map((e) => ReturnSummaryRequestByUserDto.fromJson(e).toDomain())
          .toList();
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

  Future<ReturnSummaryRequestInformation> getReturnSummaryInformation({
    required String requestID,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': returnSummaryQueryMutation.getrequestInformationV2Query(),
          'variables': {
            'request': {
              'requestID': requestID,
            },
          },
        }),
      );

      _returnSummaryRequestInformationExceptionChecker(res: res);

      return ReturnSummaryRequestInformationDto.fromJson(
              res.data['data']['requestInformationV2'],)
          .toDomain();
    },);
  }
}
