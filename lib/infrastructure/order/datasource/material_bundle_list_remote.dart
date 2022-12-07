import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

class MaterialBundleListRemoteDataSource {
  HttpService httpService;
  MaterialBundleQuery materialBundleQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  static const _url = '/api/pricing';
  static const _method = 'POST';

  MaterialBundleListRemoteDataSource({
    required this.httpService,
    required this.materialBundleQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<MaterialInfo>> getMaterialBundleList({
    required String customerCode,
    required String shipToCode,
    required String salesOrganisation,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: _url,
        data: jsonEncode({
          'query': materialBundleQuery.getCustomerMaterialBundleList(),
          'variables': {
            'customer': customerCode,
            'shipToCode': shipToCode,
            'salesOrganisation': salesOrganisation,
          },
        }),
        apiEndpoint: 'GetBundles',
      );
      _materialBundleListExceptionChecker(res: res);

      return List.from(makeResponseCamelCase(
        jsonEncode(res.data['data']['GetBundles']),
      )).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
    });
  }

  Future<List<MaterialInfo>> getMaterialBundleListForSalesRep({
    required String userName,
    required String customerCode,
    required String shipToCode,
    required String salesOrganisation,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: _url,
        data: jsonEncode({
          'query': materialBundleQuery.getSalesRepMaterialBundleList(),
          'variables': {
            'userName': userName,
            'customer': customerCode,
            'shipToCode': shipToCode,
            'salesOrganisation': salesOrganisation,
          },
        }),
        apiEndpoint: 'GetBundlesForSalesRep',
      );
      _materialBundleListExceptionChecker(res: res);

      return List.from(makeResponseCamelCase(
        jsonEncode(res.data['data']['GetBundlesForSalesRep']),
      )).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
    });
  }

  void _materialBundleListExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }

  dynamic makeResponseCamelCase(String resp) {
    final camelCaseJsonKeys = resp.replaceAllMapped(
      RegExp(
        '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
      ),
      (Match m) {
        return m.group(0)![0].toLowerCase() + m.group(0)!.substring(1);
      },
    );

    return jsonDecode(camelCaseJsonKeys);
  }
}
