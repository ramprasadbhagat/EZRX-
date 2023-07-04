import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';

class ViewByItemDetailsRemoteDataSource {
  HttpService httpService;
  ViewByItemQueryMutation viewByItemDetailsQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  ViewByItemDetailsRemoteDataSource({
    required this.httpService,
    required this.viewByItemDetailsQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<OrderHistory> getViewByItemDetails({
    required String soldTo,
    required String language,
    required String orderNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByItemDetailsQueryMutation.getViewByItemDetails();

      final variables = {
        'soldTo': soldTo,
        'language': language,
        'orderNumber': orderNumber,
        'materialSearch': '',
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'itemOrderHistoryV2',
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
