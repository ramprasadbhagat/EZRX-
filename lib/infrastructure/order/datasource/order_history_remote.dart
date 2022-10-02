import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';

class OrderHistoryRemoteDataSource {
  HttpService httpService;
  OrderHistoryQueryMutation orderHistoryQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  OrderHistoryRemoteDataSource({
    required this.httpService,
    required this.orderHistoryQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
  });
  // TODO: Jyoti
  // NO BLOC INJECTION ALLOW ON DATASOURCE LAYER
  // Create two datasource functions, separate getOrderHistory & getOrderHistorySalesRep
  Future<List<OrderHistory>> getOrderHistory({
    required String loginUserType,
    required String soldTo,
    required String shipTo,
    required String fromDate,
    required String toDate,
    required int pageSize,
    required int offset,
    String orderBy = 'orderDate',
    String sort = 'desc',
    String userName = '',
    String language = 'E',
    String companyName = '',
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = loginUserType == 'client'
          ? orderHistoryQueryMutation.getOrderHistoryRep()
          : orderHistoryQueryMutation.getOrderHistoryForSalesRep();
      final variables = {
        'soldTo': soldTo,
        'shipTo': [shipTo],
        'first': pageSize,
        'after': offset,
        'orderBy': orderBy,
        'fromDate': fromDate,
        'toDate': toDate,
        'sort': sort,
      };
      if (loginUserType == 'client') {
        variables.addEntries({MapEntry('companyName', companyName)});
      } else {
        variables.addEntries({
          MapEntry('userName', userName),
          MapEntry('language', language),
        });
      }

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      _orderHistoryExceptionChecker(res: res);
      List orderHistory = List.from(loginUserType == 'client'
              ? res.data['data']['orderHistoryV2']['OrderHistory'][0]
                  ['OrderItems']
              : res.data['data']['orderHistoryForSalesRepV2']['OrderHistory'][0]
                  ['OrderItems'])
          .map((e) => OrderHistoryDto.fromJson(e).toDomain())
          .toList();

      return orderHistory;
    });
  }

  void _orderHistoryExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
