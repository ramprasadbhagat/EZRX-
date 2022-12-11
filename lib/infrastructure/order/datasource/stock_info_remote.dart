import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';

class StockInfoRemoteDataSource {
  HttpService httpService;
  StockInfoQueryMutation stockInfoQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  StockInfoRemoteDataSource({
    required this.httpService,
    required this.stockInfoQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<StockInfo> getStockInfo({
    required String materialNumber,
    required String salesOrg,
    required String selectedCustomerCode,
    required String plant,
    required String principalCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}/order',
        data: jsonEncode(
          {
            'query': stockInfoQueryMutation.getStockInfo(),
            'variables': {
              'materialNumber': materialNumber,
              'plant': plant,
              'customerCode': selectedCustomerCode,
              'salesOrganisation': salesOrg,
              'principalCode': principalCode,
            },
          },
        ),
        apiEndpoint: 'stockInformation',
      );

      _exceptionChecker(res: res);

      return StockInfoDto.fromJson(res.data['data']['stockInformation'])
          .toDomain();
    });
  }

  Future<List<StockInfo>> getStockInfoList({
    required String materialNumber,
    required String salesOrg,
    required String selectedCustomerCode,
    required String plant,
    required String principalCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}/order',
        data: jsonEncode(
          {
            'query': stockInfoQueryMutation.getStockInfoList(),
            'variables': {
              'materialNumber': materialNumber,
              'plant': plant,
              'customerCode': selectedCustomerCode,
              'salesOrganisation': salesOrg,
              'principalCode': principalCode,
            },
          },
        ),
        apiEndpoint: 'stockInformationList',
      );

      _exceptionChecker(res: res);

      return List.from(res.data['data']['stockInformationList'])
          .map((e) => StockInfoDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _exceptionChecker({required Response<dynamic> res}) {
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
