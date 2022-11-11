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

  Future<OrderHistory> getOrderHistory({
    required String loginUserType,
    required String soldTo,
    required String shipTo,
    required String fromDate,
    required String toDate,
    required int pageSize,
    required int offset,
    required String orderBy, // = 'orderDate',
    required String sort, // = 'desc',
    required String companyName,
    required String orderId,
    required String poNumber,
    required String materialSearch,
    required String principalSearch,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = orderHistoryQueryMutation.getOrderHistoryRep();

      final variables = {
        'soldTo': soldTo,
        'shipTo': [shipTo],
        'first': pageSize,
        'after': offset,
        'orderBy': orderBy,
        'fromDate': fromDate ,   //'20220906',
        'toDate':  toDate,   //'20221008',
        'sort': sort,
        'orderNumber': orderId,
        'poReference': poNumber,
        'materialSearch': materialSearch,
        'principalSearch': principalSearch,
        'companyName': companyName,
      };

     

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
     
      _orderHistoryExceptionChecker(res: res);

      if (res.data['data']['orderHistoryV2']['OrderHistory'].isEmpty) {
        return OrderHistory.empty();
      }

      return OrderHistoryDto.fromJson(
        res.data['data']['orderHistoryV2']['OrderHistory'][0],
      ).toDomain();
    });
  }

  Future<OrderHistory> getOrderHistorySalesRep({
    required String loginUserType,
    required String soldTo,
    required String shipTo,
    required String fromDate,
    required String toDate,
    required int pageSize,
    required int offset,
    required String orderBy, // = 'orderDate',
    required String sort, // = 'desc',
    required String userName, // = '',
    required String language, // = 'E',
    required String orderId,
    required String poNumber,
    required String materialSearch,
    required String principalSearch,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = orderHistoryQueryMutation.getOrderHistoryForSalesRep();
      final variables = {
        'soldTo': soldTo,
        'shipTo': [shipTo],
        'first': pageSize,
        'after': offset,
        'orderBy': orderBy,
        'fromDate': fromDate,
        'toDate': toDate,
        'sort': sort,
        'orderNumber': orderId,
        'poReference': poNumber,
        'materialSearch': materialSearch,
        'principalSearch': principalSearch,
        'userName': userName,
        'language': language,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      _orderHistoryExceptionChecker(res: res);

      if (res
          .data['data']['orderHistoryForSalesRepV2']['OrderHistory'].isEmpty) {
        return OrderHistory.empty();
      }

      return OrderHistoryDto.fromJson(
        res.data['data']['orderHistoryForSalesRepV2']['OrderHistory'][0],
      ).toDomain();
    });
  }

  void _orderHistoryExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
