import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/recent_orders_query_mutation.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/recent_order_dto.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/recent_order_favourite_dto.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_favourite.dart';

class RecentOrdersRemoteDataSource {
  HttpService httpService;
  RecentOrdersQueryMutation recentOrdersQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RecentOrdersRemoteDataSource({
    required this.httpService,
    required this.recentOrdersQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<RecentOrderItem>> getRecentOrderedProducts({
    required String customerCode,
    required String shipToCode,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = recentOrdersQueryMutation.getRecentOrderedProducts();

      final variables = {
        'after': 0,
        'first': 24,
        'language': language,
        'soldTo': customerCode,
        'shipTo': shipToCode,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'recentOrders',
      );
      _recentOrdersExceptionChecker(res: res);
      final finalData = res.data['data']['recentOrders']['orderItems'];

      return List.from(finalData)
          .map((e) => RecentOrderDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<RecentOrderFavouriteStatus> fetchProductsFavouriteStatus({
    required String materialNumber,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = recentOrdersQueryMutation.fetchProductsFavouriteStatus();

      final variables = {
        'language': language,
        'materialNumber': materialNumber,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'materialDetails',
      );
      _recentOrdersExceptionChecker(res: res);
      final finalData = res.data['data']['materialDetails'];

      return RecentOrderFavouriteDto.fromJson(finalData).toDomain();
    });
  }

  void _recentOrdersExceptionChecker({required Response<dynamic> res}) {
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
