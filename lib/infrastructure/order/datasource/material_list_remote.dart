import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

class MaterialListRemoteDataSource {
  HttpService httpService;
  MaterialsWithMetaQuery materialListQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  MaterialListRemoteDataSource({
    required this.httpService,
    required this.materialListQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
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
    required bool? isCovidSelected,
    required String type,
    required bool isProductOffer,
    required String orderByName,
    required String orderByPrice,
    required List<String> manufactureList,
    required List<String> countryListCode,
    required String principalCode,
    required String searchKey,
    required List<String> salesDeal,
    required bool isComboOffers,
    required bool showSampleItem,
    required String market,
    required bool isMarketPlace,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getProductQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'request': {
          'After': offset,
          'Customer': customerCode,
          'First': pageSize,
          'Language': language,
          'SalesOrg': salesOrgCode,
          'ShipTo': shipToCode,
          'isGimmick': gimmickMaterial,
          'SearchKey': searchKey,
          'isFOCMaterial': isCovidSelected,
          if (isMarketPlace) 'IsMarketplace': isMarketPlace,
          if (showSampleItem) 'fromAddBonus': showSampleItem,
        },
      };
      if (orderByName.isNotEmpty) {
        variables['request']!['OrderByName'] = orderByName;
      }
      if (orderByPrice.isNotEmpty) {
        variables['request']!['OrderByPrice'] = orderByPrice;
      }
      if (isFavourite) variables['request']!['IsFavourite'] = isFavourite;

      if (type.isNotEmpty) variables['request']!['Type'] = type;
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

      if (isComboOffers) {
        variables['request']!['salesDeal'] =
            salesDeal.isNotEmpty ? salesDeal : '';
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

  Future<MaterialResponse> getComboDealMaterialsPrincipalCode({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required int pageSize,
    required int offset,
    required String language,
    required List<String> principalCodeList,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getProductQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'request': {
          'After': offset,
          'Customer': customerCode,
          'First': pageSize,
          'Language': language,
          'SalesOrg': salesOrgCode,
          'ShipTo': shipToCode,
          'principalCodeList': principalCodeList,
        },
      };

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

  Future<MaterialInfo> getProductDetails({
    required String code,
    required String customerCode,
    required String salesOrg,
    required String shipToCode,
    required String type,
    required String language,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getProductDetailsQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'request': {
          'Code': code,
          'Customer': customerCode,
          'SalesOrg': salesOrg,
          'ShipTo': shipToCode,
          'Type': type,
          'Language': language,
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
