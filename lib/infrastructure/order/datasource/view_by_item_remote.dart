import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_meta_data_dto.dart';

class OrderHistoryRemoteDataSource {
  HttpService httpService;
  ViewByItemQueryMutation viewByItemQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  OrderHistoryRemoteDataSource({
    required this.httpService,
    required this.viewByItemQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<OrderHistory> getOrderHistory({
    required String soldTo,
    required String shipTo,
    required int pageSize,
    required int offset,
    required String language,
    required String searchKey,
    required Map<String, dynamic> filterQuery,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByItemQueryMutation.getViewByItemForCustomer();

      final variables = {
        'soldTo': soldTo,
        'shipTo': [shipTo],
        'first': pageSize,
        'after': offset,
        'language': language,
        'query': searchKey,
        ...filterQuery,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'orderHistoryV2',
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
    required String soldTo,
    required String shipTo,
    required int pageSize,
    required int offset,
    required String userName,
    required String language,
    required Map<String, dynamic> filterQuery,
    required String query,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByItemQueryMutation.getViewByItemForSalesRep();
      final variables = {
        'soldTo': soldTo,
        'shipTo': [shipTo],
        'first': pageSize,
        'after': offset,
        'userName': userName,
        'language': language,
        'query': query,
        ...filterQuery,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'orderHistoryForSalesRepV2',
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

  Future<ProductMetaData> getItemProductDetails({
    required List<String> materialIDs,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': viewByItemQueryMutation.getProduct(),
          'variables': {
            'request': {
              'materialID': materialIDs,
            },
          },
        },
      ),
    );
    _orderHistoryExceptionChecker(res: res);
    final data = res.data['data']['getProduct'];

    return ProductMetaDataDto.fromJson(data).toDomain;
  }

  void _orderHistoryExceptionChecker({required Response<dynamic> res}) {
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
