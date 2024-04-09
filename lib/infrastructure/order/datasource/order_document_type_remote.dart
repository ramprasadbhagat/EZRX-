import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_document_type_aggregate_dto.dart';

class OrderDocumentTypeRemoteDataSource {
  HttpService httpService;
  OrderDocumentTypeQueryMutation queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  OrderDocumentTypeRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<OrderDocumentType>> getOrderDocumentTypList({
    required String salesOrgCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getOrderDocumentType();

      final variables = {'salesOrg': salesOrgCode};
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      _orderDocumentTypeChecker(res: res);
      final orderDocumentTypeData =
          res.data['data']['orderDocumentType']['documentTypes'];

      return List.from(orderDocumentTypeData)
          .map((e) => OrderDocumentTypeDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _orderDocumentTypeChecker({required Response<dynamic> res}) {
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
