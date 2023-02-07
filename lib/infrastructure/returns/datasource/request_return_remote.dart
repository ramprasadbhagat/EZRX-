import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_list_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_dto.dart';

class RequestReturnRemoteDatasource {
  HttpService httpService;
  ReturnRequestListQuery query;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  RequestReturnRemoteDatasource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<ReturnRequest> searchReturnMaterials({
    required String batch,
    required String dateFrom,
    required String dateTo,
    required String invoiceNo,
    required String materialDescription,
    required String materialNumber,
    required String principalSearch,
    required String salesOrg,
    required String shipTo,
    required String soldTo,
    required int pageSize,
    required int offSet,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.getReturnRequestList();
      final variables = {
        'searchReturnMaterialsRequest': {
          'batch': batch,
          'dateFrom': dateFrom,
          'dateTo': dateTo,
          'invoiceNo': invoiceNo,
          'materialDescription': materialDescription,
          'materialNumber': materialNumber,
          'principalSearch': principalSearch,
          'salesOrg': salesOrg,
          'soldTo': soldTo,
          'shipTo': shipTo,
          'first': pageSize,
          'after': offSet,
        },
      };

      variables['searchReturnMaterialsRequest']!
          .removeWhere((key, value) => value.toString().isEmpty);

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _requestReturnListExceptionChecker(res: res);

      return ReturnRequestDto.fromJson(
        res.data['data']['searchReturnMaterials'],
      ).toDomain();
    });
  }

  void _requestReturnListExceptionChecker({
    required Response<dynamic> res,
  }) {
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
