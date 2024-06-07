import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_representative_info_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class SalesRepRemoteDataSource {
  HttpService httpService;
  SalesRepQueryMutation salesRepQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  SalesRepRemoteDataSource({
    required this.httpService,
    required this.salesRepQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<SalesRepresentativeInfo> getSalesRepInfo({
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final data = {'userName': userName};
      final res = await httpService.request(
        method: 'POST',
        url: '/api/license',
        data: jsonEncode({
          'query': salesRepQueryMutation.getSalesRepInfo(),
          'variables': data,
        }),
      );
      _salesRepExceptionChecker(res: res);

      return SalesRepresentativeInfoDto.fromJson(
        res.data['data']['salesRepresentativeInfo']['rawMetaData'],
      ).toDomain();
    });
  }

  void _salesRepExceptionChecker({required Response<dynamic> res}) {
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
