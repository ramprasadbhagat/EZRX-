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

import 'package:ezrxmobile/infrastructure/core/local_storage/product_suggestion_history_storage.dart';

import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/product_suggestion_history_dto.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

class ProductSearchRepository implements IProductSearchRepository {
  final Config config;
  final ProductSearchLocalDataSource localDataSource;
  final ProductSearchRemoteDataSource remoteDataSource;
  final ProductSuggestionHistoryStorage productSuggestionHistoryStorage;

  ProductSearchRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.productSuggestionHistoryStorage,
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
      final getSearchKeyResponse = await getSearchKeys();
      final storedKeys = getSearchKeyResponse.fold(
        (failure) => ProductSuggestionHistory.empty(),
        (success) => success,
      );
      final searchKeyList = ProductSuggestionHistoryDto.fromDomain(storedKeys)
          .getModifiedList(searchKey);

      await _putSearchKeys(searchKeyList);

      final materialList = await remoteDataSource.getSearchedMaterialList(
        customerCode: customerCode,
        salesOrgCode: salesOrg,
        gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
        language: salesOrgConfig.getConfigLanguage,
        shipToCode: shipToCode,
        searchKey: searchKey.getOrCrash(),
        offset: offset,
        pageSize: pageSize,
        eanNumber: '',
      );

      return Right(materialList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<Either<ApiFailure, Unit>> _putSearchKeys(
    List<String> searchKeyList,
  ) async {
    try {
      final updatedObject = ProductSuggestionHistory(
        searchKeyList: searchKeyList.map((e) => SearchKey(e)).toList(),
      );
      await productSuggestionHistoryStorage.putSearchKey(
        searchKeyList: ProductSuggestionHistoryDto.fromDomain(updatedObject),
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ProductSuggestionHistory>> getSearchKeys() async {
    try {
      final response = productSuggestionHistoryStorage.getAllSearchKey();

      return Right(response.toDomain());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> clearSearchHistory() async {
    try {
      await productSuggestionHistoryStorage.clear();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getScanProduct({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Ean eanNumber,
    required SalesOrganisationConfigs salesOrgConfig,
    required User user,
  }) async {
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    final salesOrg = salesOrganization.salesOrg.getOrCrash();
    final shipToCode = shipToInfo.shipToCustomerCode;
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await localDataSource.getSearchedProductList();

        return Right(productList.products.first);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialList = await remoteDataSource.getSearchedMaterialList(
        customerCode: customerCode,
        salesOrgCode: salesOrg,
        gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
        language: user.settings.languagePreference.languageCode,
        shipToCode: shipToCode,
        searchKey: '',
        offset: 0,
        pageSize: 24,
        eanNumber: eanNumber.getOrCrash(),
      );

      if (materialList.products.isEmpty) {
        return Left(
          ApiFailure.scannedProductNotFound(eanNumber.getOrCrash()),
        );
      }

      return Right(materialList.products.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
