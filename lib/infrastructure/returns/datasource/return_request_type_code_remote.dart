import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_query.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_type_code_details_dto.dart';

class ReturnRequestTypeCodeRemoteDataSource {
  HttpService httpService;
  ReturnRequestTypeCodeQuery queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnRequestTypeCodeRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ReturnRequestTypeCodeDetails>> getReturnRequestTypeCodeList({
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getReturnRequestTypeCode();
      final variables = {
        'request': {
          'salesOrg': salesOrg,
        },
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return List.from(res.data['data']['typeOfRequest'])
          .map((e) => ReturnRequestTypeCodeDetailsDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _returnRequestTypeCodeExceptionChecker({
    required Response<dynamic> res,
  }) {
    if (dataSourceExceptionHandler.isServerResponseError(res: res)) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
