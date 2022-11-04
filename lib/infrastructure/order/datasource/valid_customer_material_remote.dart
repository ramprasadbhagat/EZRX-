import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_materials_query.dart';

class ValidCustomerMaterialRemoteDataSource {
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final HttpService httpService;
  final ValidCustomMaterialQuery validCustomMaterialQuery;
  final Config config;
  ValidCustomerMaterialRemoteDataSource({
    required this.dataSourceExceptionHandler,
    required this.httpService,
    required this.validCustomMaterialQuery,
    required this.config,
  });

  Future<List<MaterialNumber>> getValidMaterialList({
    required String userName,
    required String salesOrganisation,
    required String customerCode,
    required String shipToCode,
    required String pickAndPackValue,
    required List<String> materialList,
    required List<String> focMaterialList,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = validCustomMaterialQuery.getValidCustomerMaterial();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'input': {
              'customerShipToCode': customerCode,
              'customerSoldToCode': shipToCode,
              'salesOrganisation': salesOrganisation,
              'materialNumberList': materialList,
              'focMaterialNumberList': focMaterialList,
              'pickAndPack': pickAndPackValue,
            },
          },
        }),
      );
      _validCustomerMaterialExceptionChecker(res: res);
      final finalData = res.data['data']['validCustomerMaterials']['materials'];

      return List.from(finalData).map((e) => MaterialNumber(e)).toList();
    });
  }

  void _validCustomerMaterialExceptionChecker({
    required Response<dynamic> res,
  }) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.data['data']['validCustomerMaterials'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.data['data']['validCustomerMaterials']['materials'] ==
        null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
