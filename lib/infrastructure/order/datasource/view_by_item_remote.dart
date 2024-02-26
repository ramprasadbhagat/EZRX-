import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_data_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';

class ViewByItemRemoteDataSource {
  HttpService httpService;
  ViewByItemQueryMutation viewByItemQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  RemoteConfigService remoteConfigService;

  ViewByItemRemoteDataSource({
    required this.httpService,
    required this.viewByItemQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<OrderHistory> getOrderHistory({
    required Map<String, dynamic> variables,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = viewByItemQueryMutation.getViewByItem(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'orderHistoryFetchByItems',
      );
      _orderHistoryExceptionChecker(res: res);

      if (res
          .data['data']['orderHistoryFetchByItems']['OrderHistory'].isEmpty) {
        return OrderHistory.empty();
      }

      return OrderHistoryDto.fromJson(
        res.data['data']['orderHistoryFetchByItems']['OrderHistory'][0],
      ).toDomain();
    });
  }

  Future<List<InvoiceData>> getInvoiceDataForOrders({
    required List<String> orderNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}order',
          data: jsonEncode(
            {
              'query': viewByItemQueryMutation.getInvoiceIdForOrders(),
              'variables': {
                'orderNumbers': orderNumbers,
              },
            },
          ),
        );
        _orderHistoryExceptionChecker(res: res);

        final finalData = res.data['data']['getInvoiceIdForOrders'];

        return List.from(finalData)
            .map((e) => InvoiceDataDto.fromJson(e).toDomain())
            .toList();
      },
    );
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
