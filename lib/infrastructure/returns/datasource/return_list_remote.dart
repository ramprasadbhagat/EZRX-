import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_group.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_group_dto.dart';

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

  Future<List<ReturnItemGroup>> fetchReturnByItems({
    required CustomerCodeInfo custCode,
    required SalesOrg salesOrg,
    required ShipToInfo shipToInfo,
    required Username userName,
    required int first,
    required int after,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByItems();
      final variables = {
        'salesOrg': salesOrg.getOrCrash(),
        'soldTo': custCode.customerCodeSoldTo,
        'shipTo': shipToInfo.shipToCustomerCode,
        'username': userName.getOrCrash(),
        'first': first,
        'after': after,
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
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return List.from(
        res.data['data']['requestsByItems']['returnRequestsByItems'],
      ).map((e) => ReturnItemGroupDto.fromJson(e).toDomain()).toList();
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
