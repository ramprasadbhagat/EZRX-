import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/re_order_permission_dto.dart';

class ReOrderPermissionRemoteDataSource {
  final HttpService httpService;
  final ReOrderPermissionQuery reOrderPermissionQuery;
  final Config config;

  ReOrderPermissionRemoteDataSource({
    required this.httpService,
    required this.reOrderPermissionQuery,
    required this.config,
  });

  Future<ReOrderPermission> getPermission({
    required List<String> materialNumbers,
    required String customerCode,
    required String shipToCode,
    required String salesOrg,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}/license',
      data: jsonEncode(
        {
          'query': reOrderPermissionQuery.getReOrderPermission(),
          'variables': {
            'request': {
              'materialNumberList': materialNumbers,
              'customerSoldToCode': customerCode,
              'customerShipToCode': shipToCode,
              'salesOrganisation': salesOrg,
              'cached': false,
              'invalidateCache': false,
            },
          },
        },
      ),
    );

    _exceptionChecker(res: res);

    return ReOrderPermissionDto.fromJson(
      res.data['data']['validCustomerMaterials'],
    ).toDomain;
  }

  void _exceptionChecker({required Response<dynamic> res}) {
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
