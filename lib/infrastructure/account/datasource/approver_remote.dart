import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/is_approver_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ApproverRemoteDataSource {
  Config config;
  HttpService httpService;
  ApproverQueryMutation approverQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  ApproverRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.approverQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<IsApproverDto> fetch({
    required String username,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = approverQueryMutation.getIsApprover();

      final request = {
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
      _approverExceptionChecker(res: res);

      return IsApproverDto.fromJson(res.data['data']['isApprover']);
    });
  }

  void _approverExceptionChecker({required Response<dynamic> res}) {
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
