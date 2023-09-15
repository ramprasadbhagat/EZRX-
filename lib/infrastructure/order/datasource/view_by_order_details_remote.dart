import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';

class ViewByOrderDetailsRemoteDataSource {
  HttpService httpService;
  ViewByOrderDetailsQueryMutation viewByOrderDetailsQueryMutation;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  ViewByOrderDetailsRemoteDataSource({
    required this.httpService,
    required this.viewByOrderDetailsQueryMutation,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<OrderHistoryDetails> getOrderHistoryDetails({
    required String language,
    required String soldTo,
    required String searchKey,
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData =
          viewByOrderDetailsQueryMutation.getOrderHistoryDetails();

      final variables = {
        'searchKey': searchKey,
        'language': language,
        'soldTo': soldTo,
        'salesOrg': [salesOrg],
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

      if (res.data['data']['orderHistoryV3'].isEmpty) {
        return OrderHistoryDetails.empty();
      }

      return OrderHistoryDetailsDto.fromJson(
        res.data['data']['orderHistoryV3']['orderHeaders'][0],
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
