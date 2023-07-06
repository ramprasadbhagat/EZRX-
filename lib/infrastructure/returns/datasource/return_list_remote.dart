import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';

class ReturnListRemoteDataSource {
  HttpService httpService;
  ReturnQuery queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnListRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ReturnItem>> fetchReturnByItems({
    required String custCode,
    required String salesOrg,
    required String shipToInfo,
    required String userName,
    required int first,
    required int after,
    required Map<String, dynamic> filterQuery,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByItems();
      final variables = {
        'salesOrg': salesOrg,
        'soldTo': custCode,
        'shipTo': shipToInfo,
        'username': userName,
        'first': first,
        'after': after,
        ...filterQuery,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'request': variables,
            },
          },
        ),
        apiEndpoint: 'requestsByItems',
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return List<Map<String, dynamic>>.from(
        res.data['data']['requestsByItems']['returnRequestsByItems'],
      )
          .map((returnRequestsByItem) => List<Map<String, dynamic>>.from(
                returnRequestsByItem['requestByItems'],
              )
                  .map((requestByItem) =>
                      ReturnItemDto.fromJson(requestByItem).toDomain())
                  .toList())
          .toList()
          .expand((element) => element)
          .toList();
    });
  }

  Future<List<ReturnItem>> fetchReturnByRequest({
    required String custCode,
    required String salesOrg,
    required String shipToInfo,
    required String userName,
    required int first,
    required int after,
    required Map<String, dynamic> filterQuery,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByRequest();
      final variables = {
        'salesOrg': salesOrg,
        'soldTo': custCode,
        'shipTo': shipToInfo,
        'username': userName,
        'first': first,
        'after': after,
        ...filterQuery,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'requestsByUserRequest': variables,
            },
          },
        ),
        apiEndpoint: 'requestsByUserV3',
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return List<Map<String, dynamic>>.from(
        res.data['data']['requestsByUserV3']['returnRequests'],
      ).map((e) => ReturnItemDto.fromJson(e).toDomain()).toList();
    });
  }

  void _returnRequestTypeCodeExceptionChecker({
    required Response<dynamic> res,
  }) {
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
