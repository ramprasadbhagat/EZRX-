import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_request_dto.dart';

class ApproverReturnRequestInformationRemote {
  HttpService httpService;
  ApproverReturnRequestInformationQuery approverReturnRequestInformationQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  ApproverReturnRequestInformationRemote({
    required this.httpService,
    required this.approverReturnRequestInformationQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<ApproverReturnRequest> getApproverReturnRequestInfomration(
      {
    required String returnRequestId,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ereturn',
      data: jsonEncode(
        {
          'query':
              approverReturnRequestInformationQuery.getReturnInformationQuery(),
          'variables': {
            'request': {
              'requestID': returnRequestId,
            },
          },
        },
      ),
    );
    _approverReturnRequestInformationExceptionChecker(res: res);
    final data = res.data['data']['requestInformationV2'];

    return ApproverReturnRequestDto.fromJson(data).toDomain();
  }

  void _approverReturnRequestInformationExceptionChecker({
    required Response<dynamic> res,
  }) {
    final data = res.data;
    if (data['errors'] != null && data['errors'].isNotEmpty) {
      throw ServerException(message: data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (data['data'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    } else if (data['data']['requestInformationV2'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
