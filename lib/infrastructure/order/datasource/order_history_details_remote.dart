import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';

class OrderHistoryDetailsRemoteDataSource {
  HttpService httpService;
  OrderHistoryDetailsQueryMutation orderHistoryDetailsQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  OrderHistoryDetailsRemoteDataSource({
    required this.httpService,
    required this.orderHistoryDetailsQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<OrderHistoryDetails> getOrderHistoryDetails({
    required String loginUserType,
    required String companyName,
    required String orderId,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData =
          orderHistoryDetailsQueryMutation.getOrderHistoryDetails();

      final variables = {
        'salesDocument': orderId,
        'companyName': companyName,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'orderDetails',
      );

      _orderHistoryDetailsExceptionChecker(res: res);

      if (res.data['data']['orderDetails'].isEmpty) {
        return OrderHistoryDetails.empty();
      }

      return OrderHistoryDetailsDto.fromJson(
        res.data['data']['orderDetails'],
      ).toDomain();
    });
  }

  Future<OrderHistoryDetails> getOrderHistoryDetailsForSalesRep({
    required String loginUserType,
    required String companyName,
    required String orderId,
    required String language,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData =
          orderHistoryDetailsQueryMutation.getOrderHistoryDetailsForSalesRep();

      final variables = {
        'salesDocument': orderId,
        'companyName': companyName,
        'language': language,
        'userName': userName,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'orderDetailsForSalesRep',
      );

      _orderHistoryDetailsExceptionChecker(res: res);

      if (res.data['data']['orderDetailsForSalesRep'].isEmpty) {
        return OrderHistoryDetails.empty();
      }

      return OrderHistoryDetailsDto.fromJson(
        res.data['data']['orderDetailsForSalesRep'],
      ).toDomain();
    });
  }

  void _orderHistoryDetailsExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
