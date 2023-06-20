import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';


import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/product_search_remote.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/product_search_local.dart';

class ProductSearchRepository implements IProductSearchRepository {
  final Config config;
  final ProductSearchLocalDataSource localDataSource;
  final ProductSearchRemoteDataSource remoteDataSource;

  ProductSearchRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, MaterialResponse>> searchProductList({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SearchKey searchKey,
    required int pageSize,
    required int offset,
  }) async {
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    final salesOrg = salesOrganization.salesOrg.getOrCrash();
    final shipToCode = shipToInfo.shipToCustomerCode;
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await localDataSource.getSearchedProductList();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialList = await remoteDataSource.getSearchedMaterialList(
        customerCode: customerCode,
        salesOrgCode: salesOrg,
        gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
        language: salesOrgConfig.getConfigLanguage,
        shipToCode: shipToCode,
        searchKey: searchKey.getOrCrash(),
        offset: offset,
        pageSize: pageSize,
      );

      return Right(materialList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
