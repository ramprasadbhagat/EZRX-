import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/material_dto.dart';

class MaterialListRemoteDataSource {
  HttpService httpService;
  MaterialsWithMetaQuery materialListQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  MaterialListRemoteDataSource({
    required this.httpService,
    required this.materialListQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  // TODO: Wasim
  // No value_object / entities on this level, do on repository level
  // Create two datasource functions, separate getMaterialList & getMaterialListSalesRep
  Future<List<MaterialInfo>> getMaterialList({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required List excludePrincipal,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getCustomerMaterialList();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCustomer': shipToCode,
        'excludePrincipal': excludePrincipal,
        'plants': [],
        'first': pageSize,
        'after': offset,
        'cached': true,
        'orderBy': orderBy,
        'language': language,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _materialListExceptionChecker(res: res);
      var finalData = res.data['data']['materialsWithMeta']['materials'];

      return List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<List<MaterialInfo>> getMaterialListSalesRep({
    required String userName,
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required List excludePrincipal,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required String language,
    required bool gimmickMaterial,
    required String pickAndPack,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getSalesRepMaterialList();

      final variables = {
        'username': userName,
        'salesOrganisation': salesOrgCode,
        'customerSoldToCode': customerCode,
        'customerShipToCode': shipToCode,
        'excludePrincipal': excludePrincipal,
        'gimmickMaterial': gimmickMaterial,
        'pickAndPack': pickAndPack,
        'plants': [],
        'first': pageSize,
        'after': offset,
        'cached': true,
        'orderBy': orderBy,
        'language': language,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _materialListExceptionChecker(res: res);
      var finalData =
          res.data['data']['customerMaterialsForSalesRep']['materials'];

      return List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _materialListExceptionChecker({required Response<dynamic> res}) {
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
