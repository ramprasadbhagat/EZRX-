import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_requests_id_dto.dart';


class ApproverReturnRequestsRemote {
  HttpService httpService;
  ApproverReturnRequestQuery approverReturnRequestQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  ApproverReturnRequestsRemote({
    required this.httpService,
    required this.approverReturnRequestQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ReturnRequestsId>> getReturns({
    required String username,
    required int offset,
    required int pageSize,
    required Map<String, dynamic> filterQuery,
  }) async {
    final response = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ereturn',
      data: jsonEncode(
        {
          'query': approverReturnRequestQuery.getReturnRequestQuery(),
          'variables': {
            'request': {
              'username': username,
              'first': pageSize,
              'after': offset,
              ...filterQuery,
            },
          },
        },
      ),
    );

    _approverReturnRequestExceptionChecker(res: response);
    
    return List.from(
      response.data['data']['requestsForApproverV2']['requestID'],
    )
        .map(
          (e) =>
              ReturnRequestsIdDto.fromJson({'requestId': e}).toDomain(),
        )
        .toList()
      ..retainWhere((element) => element.isValidRequestId);
  }

  void _approverReturnRequestExceptionChecker({
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
    } else if (data['data']['requestsForApproverV2'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    } else if (data['data']['requestsForApproverV2']['requestID'] is! List) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
