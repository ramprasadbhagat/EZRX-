import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/error/order_exception.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';

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
      _orderExceptionChecker(res: res);
      if (res.data['data']['draftOrders'] == null) {
        throw const OrderException.draftOrdersDataIsEmpty();
      }

      return List.from(res.data['data']['draftOrders'])
          .map((e) => SavedOrderDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<SavedOrder> createDraftOrder({
    required SavedOrderDto draftOrder,
  }) async {
    return await exceptionHandler.handle(() async {
      final variables = {
        'input': {
          'data': _removeUnnecessaryElement(draftOrder.toJson()),
        },
      };

      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngineMutation',
        data: jsonEncode({
          'query': queryMutation.createSavedOrder(),
          'variables': variables,
        }),
      );
      _orderExceptionChecker(res: res);
      if (res.data['data']['createDraftOrder'] == null ||
          res.data['data']['createDraftOrder']['draftorder'] == null) {
        throw const OrderException.draftOrdersInCreateDraftOrderDataIsEmpty();
      }

      return SavedOrderDto.fromJson(res.data['data']['createDraftOrder'])
          .toDomain();
    });
  }

  Future<SubmitOrderResponse> submitOrder({
    required SubmitOrderDto submitOrder,
  }) async {
    return await exceptionHandler.handle(() async {
      final variables = {
        'order': submitOrder.toJson(),
      };

      final res = await httpService.request(
        method: 'POST',
        url: '/api/orderMutation',
        data: jsonEncode({
          'query': queryMutation.submitOrder(),
          'variables': variables,
        }),
      );
      _orderExceptionChecker(res: res);
      if (res.data['data']['submitOrderTwo'] == null) {
        throw const OrderException.submitOrderDataIsEmpty();
      }
      final submitOrderResponse =
          SubmitOrderResponseDto.fromJson(res.data['data']['submitOrderTwo']);
      _submitOrderExceptionChecker(submitOrderResponse: submitOrderResponse);

      return submitOrderResponse.toDomain();
    });
  }

  Map<String, dynamic> _removeUnnecessaryElement(Map<String, dynamic> input) {
    input.remove('id');

    return input;
  }

  void _orderExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }

  void _submitOrderExceptionChecker({
    required SubmitOrderResponseDto submitOrderResponse,
  }) {
    if (submitOrderResponse.salesDocument.isEmpty) {
      final msg = submitOrderResponse.messages
          .map((e) => e.message)
          .toList()
          .join(', ');
      throw OtherException(message: msg);
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

      _orderExceptionChecker(res: res);

      return SavedOrderDto.fromJson(
        res.data['data']['deleteDraftOrder']['draftOrder'],
      ).toDomain();
    });
  }
}
