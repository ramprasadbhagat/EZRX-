import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_mutation.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/submit_return_response_dto.dart';

class SubmitReturnRequestRemoteDataSource {
  Config config;
  HttpService httpService;
  SubmitReturnRequestMutation returnRequestMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  SubmitReturnRequestRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.returnRequestMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<SubmitReturnResponse> submitReturnRequest({
    required Map<String, dynamic> returnInput,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = returnRequestMutation.getReturnRequestMutation();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'returnInput': returnInput,
          },
        }),
      );

      _returnsOverviewExceptionChecker(res: res);

      return SubmitReturnResponseDto.fromJson(
        res.data['data']['addRequestV2'],
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
