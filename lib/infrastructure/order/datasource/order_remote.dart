import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';

class OrderRemoteDataSource {
  final HttpService httpService;
  final OrderQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  OrderRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<List<SavedOrder>> getSavedOrder({
    required String userId,
    required String saleOrgName,
    required String shipToCode,
    required String customerCode,
    required int pageSize,
    required int offset,
  }) async {
    return await exceptionHandler.handle(() async {
      final variables = {
        'whereQuery': {
          'draftorder': true,
          'processingStatusIn': ['Draft', 'Failed'],
          'user': userId,
          'SalesOrganization': saleOrgName,
          'ShipToParty': shipToCode,
          'SoldToParty': customerCode,
        },
        'first': pageSize,
        'after': offset,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngine',
        data: jsonEncode({
          'query': queryMutation.getSaveOrderHistory(),
          'variables': variables,
        }),
      );
      _savedOrderExceptionChecker(res: res);
      if (res.data['data']['draftOrders'] == null) {
        throw OtherException(message: '');
      }

      return List.from(res.data['data']['draftOrders'])
          .map((e) => SavedOrderDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _savedOrderExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }

  Future<SavedOrder> deleteSavedOrder({required String itemId}) async {
    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngine',
        data: jsonEncode(
          {
            'query': queryMutation.deleteSavedOrder(),
            'variables': {
              'input': {
                'where': {
                  'id': itemId,
                },
              },
            },
          },
        ),
      );

      _deleteOrderExceptionChecker(res: res);

      return SavedOrderDto.fromJson(
        res.data['data']['deleteDraftOrder']['draftOrder'],
      ).toDomain();
    });
  }

  void _deleteOrderExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
