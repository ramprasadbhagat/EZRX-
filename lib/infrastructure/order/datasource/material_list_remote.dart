import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

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

  Future<MaterialResponse> getProductList({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required int pageSize,
    required int offset,
    required bool gimmickMaterial,
    required String language,
    required bool isFavourite,
    required bool isFOCMaterial,
    required bool bundleOffers,
    required bool isProductOffer,
    required String orderByName,
    required List<String> manufactureList,
    required List<String> countryListCode,
    required String principalCode,
    required String searchKey,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getProductQuery();

      final variables = {
        'request': {
          'After': offset,
          'Customer': customerCode,
          'First': pageSize,
          'Language': language,
          'OrderByName': orderByName,
          'SalesOrg': salesOrgCode,
          'ShipTo': shipToCode,
          'isGimmick': gimmickMaterial,
          'SearchKey': searchKey,
        },
      };

      if (isFavourite) variables['request']!['IsFavourite'] = isFavourite;
      if (isFOCMaterial) variables['request']!['isFOCMaterial'] = isFOCMaterial;
      if (bundleOffers) variables['request']!['Type'] = 'bundle';
      if (isProductOffer) variables['request']!['isOffer'] = isProductOffer;
      if (manufactureList.isNotEmpty) {
        variables['request']!['Manufactured'] = manufactureList;
      }
      if (countryListCode.isNotEmpty) {
        variables['request']!['CountryCode'] = countryListCode;
      }

      if (principalCode.isNotEmpty) {
        variables['request']!['principalCode'] = principalCode;
      }

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'GetAllProductsRequest',
      );
      _materialListExceptionChecker(res: res);
      final finalData =
          makeResponseCamelCase(jsonEncode(res.data['data']['GetAllProducts']));

      return MaterialResponseDto.fromJson(finalData).toDomain();
    });
  }

  Future<List<MaterialInfo>> getComboDealMaterials({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required int pageSize,
    required int offset,
    required List<String> principalNameList,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.comboDealMaterials;

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCustomer': shipToCode,
        'first': pageSize,
        'after': offset,
        'principalNameList': principalNameList,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'materialsWithMetaQuery',
      );
      _materialListExceptionChecker(res: res);
      final finalData = res.data['data']['materialsWithMeta']['materials'];

      return List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<List<MaterialInfo>> getComboDealMaterialsForSaleRep({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required int pageSize,
    required int offset,
    required List<String> principalNameList,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.comboDealMaterialsForSaleRep;

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerSoldToCode': customerCode,
        'customerShipToCode': shipToCode,
        'first': pageSize,
        'after': offset,
        'principalNameList': principalNameList,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'customerMaterialsForSalesRep',
      );
      _materialListExceptionChecker(res: res);
      final finalData =
          res.data['data']['customerMaterialsForSalesRep']['materials'];

      return List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<MaterialInfo> getProductDetails({
    required String code,
    required String customerCode,
    required String salesOrg,
    required String shipToCode,
    required String type,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getProductDetailsQuery();

      final variables = {
        'request': {
          'Code': code,
          'Customer': customerCode,
          'SalesOrg': salesOrg,
          'ShipTo': shipToCode,
          'Type': type,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'GetProductDetails',
      );
      _materialListExceptionChecker(res: res);
      final finalData = makeResponseCamelCase(
        jsonEncode(res.data['data']['GetProductDetails']),
      );

      return MaterialDto.fromJson(finalData).toDomain();
    });
  }

  void _materialListExceptionChecker({required Response<dynamic> res}) {
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
