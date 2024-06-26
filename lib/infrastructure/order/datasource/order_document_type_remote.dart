import 'dart:convert';
import 'package:ezrxmobile/config.dart';
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

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final orderDocumentTypeData =
          res.data['data']['orderDocumentType']['documentTypes'];

      return List.from(orderDocumentTypeData)
          .map((e) => OrderDocumentTypeDto.fromJson(e).toDomain())
          .toList();
    });
  }
}
