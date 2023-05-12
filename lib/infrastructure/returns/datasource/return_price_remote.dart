import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_price_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/return_price.dart';

class ReturnPriceRemoteDataSource {
  HttpService httpService;
  ReturnPriceQuery queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnPriceRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<ReturnPrice> getReturnPrice({
    required Map<String, dynamic> materials,
    required String salesOrg,
    required String invoiceNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getReturnPrice();
      final variables = {
        'invoiceNumber': invoiceNumber,
        'salesOrg': salesOrg,
        'materials': materials,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'invoiceDetails': variables,
            },
          },
        ),
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return ReturnPriceDto.fromJson(res.data['data']['getReturnPrice'][0])
          .toDomain();
    });
  }

  void _returnRequestTypeCodeExceptionChecker({
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
