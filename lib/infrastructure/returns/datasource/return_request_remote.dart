import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';

class ReturnRequestRemoteDataSource {
  HttpService httpService;
  ReturnRequestQuery query;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnRequestRemoteDataSource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<ReturnMaterialList> searchReturnMaterials({
    required String salesOrg,
    required String shipTo,
    required String soldTo,
    required int pageSize,
    required int offset,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterials();
      final variables = {
        'searchReturnMaterialsRequestV2': {
          'soldTo': soldTo,
          'shipTo': shipTo,
          'salesOrg': salesOrg,
          'first': pageSize,
          'after': offset,
          //TODO: cover dateFrom & dateTo in filter ticket
          'dateFrom': '20230125',
          'dateTo': '20230725',
        },
      };
      variables['searchReturnMaterialsRequestV2']!
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

      return ReturnMaterialListDto.fromJson(
        res.data['data']['searchReturnMaterialsV2'],
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
