import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_add_favourite.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_remove_favourite.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_add_favourite_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_remove_favourite_dto.dart';

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

  Future<List<MaterialInfo>> searchMaterialList({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required List excludePrincipal,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required String language,
    required List<String> principalNameList,
    required List<String> therapeuticClassList,
    required List<String> itemBrandList,
    required bool isForFOC,
    required MaterialFilter selectedMaterialFilter,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getCustomerMaterialList(
          // custCode: customerCode,
          // excludePrincipal: excludePrincipal,
          // languageActive: language,
          // orderBy: orderBy,
          // paginate: pageSize,
          // salesOrg: salesOrgCode,
          // searchKeyActive: searchKey,
          // searchKeyActiveFilter: selectedMaterialFilter,
          // shipToCode: shipToCode,
          // principalNameList: selectedMaterialFilter.uniquePrincipalName,
          // itemBrandList: selectedMaterialFilter.uniqueItemBrand,
          // therapeuticClassList: selectedMaterialFilter.uniqueTherapeuticClass,
          // offset: offset,
          );

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCustomer': shipToCode,
        'excludePrincipal': excludePrincipal,
        'plants': [],
        'first': pageSize,
        'after': offset,
        'cached': true,
        'searchKey': searchKey,
        'orderBy': orderBy,
        'language': language,
        'principalNameList': principalNameList,
        'therapeuticClassList': therapeuticClassList,
        'itemBrandList': itemBrandList,
        'isForFOC': isForFOC,
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

  Future<List<MaterialInfo>> searchMaterialListSalesRep({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required List excludePrincipal,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required String language,
    required bool isForFOC,
    required MaterialFilter selectedMaterialFilter,
    required bool gimmickMaterial,
    required String pickAndPack,
    required String userName,
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
        'searchKey': searchKey,
        'first': pageSize,
        'after': offset,
        'cached': true,
        'orderBy': orderBy,
        'language': language,
        'principalNameList': selectedMaterialFilter.uniquePrincipalName,
        'therapeuticClassList': selectedMaterialFilter.uniqueTherapeuticClass,
        'itemBrandList': selectedMaterialFilter.uniqueItemBrand,
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
    required List<String> principalNameList,
    required List<String> therapeuticClassList,
    required List<String> itemBrandList,
    required bool isForFOC,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getCustomerMaterialList();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCustomer': shipToCode,
        'searchKey': searchKey,
        'excludePrincipal': excludePrincipal,
        'plants': [],
        'first': pageSize,
        'after': offset,
        'cached': true,
        'orderBy': orderBy,
        'language': language,
        'principalNameList': principalNameList,
        'therapeuticClassList': therapeuticClassList,
        'itemBrandList': itemBrandList,
        'isForFOC': isForFOC,
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

  Future<MaterialResponse> getProductList({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required int pageSize,
    required int offset,
    required bool gimmickMaterial,
    required String language,
    required bool isFavourite,
    required String orderByName,
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
          // 'Type': 'bundle'
        },
      };

      if (isFavourite) variables['request']!['IsFavourite'] = isFavourite;

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
      final finalData = res.data['data']['GetAllProducts'];

      return MaterialResponseDto.fromJson(finalData).toDomain();
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
    required List<String> principalNameList,
    required List<String> therapeuticClassList,
    required List<String> itemBrandList,
    required bool isSample,
    required bool isForFOC,
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
        'searchKey': searchKey,
        'pickAndPack': pickAndPack,
        'plants': [],
        'first': pageSize,
        'after': offset,
        'cached': true,
        'orderBy': orderBy,
        'language': language,
        'principalNameList': principalNameList,
        'therapeuticClassList': therapeuticClassList,
        'itemBrandList': itemBrandList,
        'isSample': isSample,
        'isForFOC': isForFOC,
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

  Future<List<MaterialInfo>> getScanMaterial({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required String ean,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getCustomerMaterialList();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCustomer': shipToCode,
        'first': 1,
        'after': 0,
        'ean': ean,
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

  Future<List<MaterialInfo>> getScanMaterialSalesRep({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required String ean,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getSalesRepMaterialList();

      final variables = {
        'username': userName,
        'salesOrganisation': salesOrgCode,
        'customerSoldToCode': customerCode,
        'customerShipToCode': shipToCode,
        'first': 1,
        'after': 0,
        'ean': ean,
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
      final finalData = res.data['data']['GetProductDetails'];

      return MaterialDto.fromJson(finalData).toDomain();
    });
  }

  Future<MaterialAddFavourite> addFavouriteMaterial({
    required String materialNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.addFavouriteMutation();

      final variables = {'materialNumber': materialNumber};

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'addFavouriteMaterial',
      );
      _materialListExceptionChecker(res: res);
      final finalData = res.data['data'];

      return MaterialAddFavouriteDto.fromJson(finalData).toDomain();
    });
  }

  Future<MaterialRemoveFavourite> removeFavouriteMaterial({
    required String materialNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.removeFavouriteMutation();

      final variables = {'materialNumber': materialNumber};

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'removeFavouriteMaterial',
      );
      _materialListExceptionChecker(res: res);
      final finalData = res.data['data'];

      return MaterialRemoveFavouriteDto.fromJson(finalData).toDomain();
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
