import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';

class MaterialListRepository implements IMaterialListRepository {
  final Config config;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  

  MaterialListRepository({
    required this.config,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    
  });

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required MaterialFilter selectedMaterialFilter,
    required String pickAndPack,
    bool isForFoc = false,
    required OrderDocumentType orderDocumentType,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData = user.role.type.isSalesRepRole
            ? await materialListLocalDataSource.getMaterialListSalesRep()
            : await materialListLocalDataSource.getMaterialList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData = user.role.type.isSalesRepRole
          ? await materialListRemoteDataSource.getMaterialListSalesRep(
              userName: user.username.getOrCrash(),
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              excludePrincipal: salesOrgConfig.getExcludePrincipal,
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              orderBy: orderBy,
              searchKey: searchKey,
              language: salesOrgConfig.getConfigLanguage,
              gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
              itemBrandList: selectedMaterialFilter.uniqueItemBrand,
              therapeuticClassList:
                  selectedMaterialFilter.uniqueTherapeuticClass,
              principalNameList: selectedMaterialFilter.uniquePrincipalName,
              pickAndPack: pickAndPack,
              isSample: orderDocumentType.documentType.isZPFB,
              isForFOC: orderDocumentType.documentType.isZPFC,
            )
          : await materialListRemoteDataSource.getMaterialList(
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              excludePrincipal: salesOrgConfig.getExcludePrincipal,
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              orderBy: orderBy,
              searchKey: searchKey,
              language: salesOrgConfig.getConfigLanguage,
              principalNameList: selectedMaterialFilter.uniquePrincipalName,
              itemBrandList: selectedMaterialFilter.uniqueItemBrand,
              therapeuticClassList:
                  selectedMaterialFilter.uniqueTherapeuticClass,
              isForFOC: isForFoc,
            );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> searchMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required MaterialFilter selectedMaterialFilter,
    required String pickAndPack,
    bool isForFoc = false,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData = user.role.type.isSalesRepRole
            ? await materialListLocalDataSource.searchMaterialListSalesRep()
            : await materialListLocalDataSource.searchMaterialList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData = user.role.type.isSalesRepRole
          ? await materialListRemoteDataSource.searchMaterialListSalesRep(
              userName: user.username.getOrCrash(),
              pickAndPack: pickAndPack,
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              excludePrincipal: salesOrgConfig.getExcludePrincipal,
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              orderBy: orderBy,
              searchKey: searchKey,
              language: salesOrgConfig.getConfigLanguage,
              gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
              isForFOC: isForFoc,
              selectedMaterialFilter: selectedMaterialFilter,
            )
          : await materialListRemoteDataSource.searchMaterialList(
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              excludePrincipal: salesOrgConfig.getExcludePrincipal,
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              orderBy: orderBy,
              searchKey: searchKey,
              language: salesOrgConfig.getConfigLanguage,
              principalNameList: selectedMaterialFilter.uniquePrincipalName,
              itemBrandList: selectedMaterialFilter.uniqueItemBrand,
              therapeuticClassList:
                  selectedMaterialFilter.uniqueTherapeuticClass,
              isForFOC: isForFoc,
              selectedMaterialFilter: selectedMaterialFilter,
            );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getComboDealMaterials({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required List<String> principles,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData = user.role.type.isSalesRepRole
            ? await materialListLocalDataSource.getMaterialListSalesRep()
            : await materialListLocalDataSource.getMaterialList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    // Because principle code from response is something like 140132
    // We need to transform it to valid one (0000140132)
    final validPrinciples = principles.map((e) => e.padLeft(10, '0')).toList();

    try {
      final materialListData = user.role.type.isSalesRepRole
          ? await materialListRemoteDataSource.getComboDealMaterialsForSaleRep(
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              principalNameList: validPrinciples,
            )
          : await materialListRemoteDataSource.getComboDealMaterials(
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              principalNameList: validPrinciples,
            );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

@override
  Future<Either<ApiFailure, MaterialInfo>> getScanMaterial({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Ean ean,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData = user.role.type.isSalesRepRole
            ? await materialListLocalDataSource.searchMaterialListSalesRep()
            : await materialListLocalDataSource.searchMaterialList();

        return Right(materialListData.first);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData = user.role.type.isSalesRepRole
          ? await materialListRemoteDataSource.getScanMaterialSalesRep(
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              ean: ean.getOrCrash(),
              userName: user.username.getOrCrash(),
            )
          : await materialListRemoteDataSource.getScanMaterial(
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              ean: ean.getOrCrash(),
            );
      if (materialListData.isEmpty) {
        return const Left(
          ApiFailure.other('Unable to fetch Material'),
        );
      }

      return Right(materialListData.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
  
}
