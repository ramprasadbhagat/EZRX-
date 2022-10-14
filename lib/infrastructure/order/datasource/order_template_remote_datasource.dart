import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_dto.dart';

class OrderTemplateRemoteDataSource {
  HttpService httpService;
  OrderTemplateQueries orderTemplateQueries;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  OrderTemplateRemoteDataSource({
    required this.httpService,
    required this.orderTemplateQueries,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<OrderTemplate>> getOrderTemplates({
    required String userId,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = orderTemplateQueries.getOrderTemplates();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}strapiEngine',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'userId': userId,
          },
        }),
      );
      _orderTemplateExceptionChecker(res: res);

      return List.from(res.data['data']['orderTemplates'])
          .map((e) => OrderTemplateDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<OrderTemplate> deleteOrderTemplate({
    required String templateId,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = orderTemplateQueries.deleteOrderTemplateQuery();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}strapiEngine',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'input': templateId,
          },
        }),
      );
      _orderTemplateExceptionChecker(res: res);

      return OrderTemplateDto.fromJson(
        res.data['data']['deleteOrderTemplate']['orderTemplate'],
      ).toDomain();
    });
  }

  void _orderTemplateExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
