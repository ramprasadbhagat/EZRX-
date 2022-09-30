import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/app_method.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/material_dto.dart';

class MaterialListRemoteDataSource {
  HttpService httpService;
  AppMethods appMethods;
  MaterialsWithMetaQuery materialListQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  MaterialListRemoteDataSource({
    required this.httpService,
    required this.appMethods,
    required this.materialListQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });
  Future<List<MaterialInfo>> getMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int first,
    required int pageIndex,
    required String orderBy,
    required String searchKey,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = user.role.type.loginUserType == 'client'
          ? materialListQuery.getCustomerMaterialList()
          : materialListQuery.getSalesRepMaterialList();

      final variables = {
        'salesOrganisation': salesOrganisation.salesOrg.getOrCrash(),
        'excludePrincipal': salesOrgConfig.getExcludePrincipal,
        'plants': [],
        'first': first,
        'after': pageIndex,
        'cached': true,
        'orderBy': orderBy,
        'language': salesOrgConfig.getConfigLangauge,
      };

      if (user.role.type.loginUserType != 'client') {
        variables.addEntries([
          MapEntry('username', user.username.getOrCrash()),
          MapEntry('customerSoldToCode', customerCodeInfo.customerCodeSoldTo),
          MapEntry('customerShipToCode', shipToInfo.shipToCustomerCode),
          MapEntry('gimmickMaterial', salesOrgConfig.enableGimmickMaterial),
          MapEntry(
            'pickAndPack',
            appMethods.getPickAndPackValue(false),
          ),
        ]);
      } else {
        variables.addEntries([
          MapEntry('customerCode', customerCodeInfo.customerCodeSoldTo),
          MapEntry('shipToCustomer', shipToInfo.shipToCustomerCode),
        ]);
      }
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _materialListExceptionChecker(res: res);
      var finalData = user.role.type.loginUserType == 'client'
          ? res.data['data']['materialsWithMeta']['materials']
          : res.data['data']['customerMaterialsForSalesRep']['materials'];

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
