import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_dto.dart';

class ViewByOrderRemoteDataSource {
  HttpService httpService;
  ViewByOrderQuery viewByOrderQuery;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  ViewByOrderRemoteDataSource({
    required this.httpService,
    required this.viewByOrderQuery,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<ViewByOrder> getViewByOrders({
    required String soldTo,
    required String shipTo,
    required int pageSize,
    required int offset,
    required String language,
    required String orderBy,
    required String sort,
    required String salesOrg,
    required String searchKey,
    required Map<String, dynamic> filterQuery,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByOrderQuery.getOrderHistoryV3();

      final variables = {
        'soldTo': soldTo,
        'shipTo': [shipTo],
        'first': pageSize,
        'after': offset,
        'language': language,
        'orderBy': orderBy,
        'sort': sort,
        'salesOrg': [salesOrg],
        'searchKey': searchKey,
        ...filterQuery,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'orderHistoryV3',
      );

      _orderHistoryExceptionChecker(res: res);
      if (res.data['data']['orderHistoryV3'].isEmpty) {
        return ViewByOrder.empty();
      }

      return ViewByOrderDto.fromJson(
        res.data['data']['orderHistoryV3'],
      ).toDomain();
    });
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
