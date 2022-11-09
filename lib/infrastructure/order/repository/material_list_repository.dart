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
import 'package:ezrxmobile/infrastructure/core/common/app_method.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';

class MaterialListRepository implements IMaterialListRepository {
  final Config config;
  AppMethods appMethods;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;

  MaterialListRepository({
    required this.config,
    required this.appMethods,
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
    bool ispickandpackenabled = false,
    bool isForFoc = false,
    required OrderDocumentType orderDocumentType,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData = user.role.type.isSalesRep
            ? await materialListLocalDataSource.getMaterialListSalesRep()
            : await materialListLocalDataSource.getMaterialList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData = user.role.type.isSalesRep
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
              language: salesOrgConfig.getConfigLangauge,
              gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
              itemBrandList: selectedMaterialFilter.uniqueItemBrand,
              therapeuticClassList:
                  selectedMaterialFilter.uniqueTherapeuticClass,
              principalNameList: selectedMaterialFilter.uniquePrincipalName,
              pickAndPack: appMethods.getPickAndPackValue(ispickandpackenabled),
              isSample: orderDocumentType.isZPFB,
              isForFOC: orderDocumentType.isZPFC,
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
              language: salesOrgConfig.getConfigLangauge,
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
    bool ispickandpackenabled = false,
    bool isForFoc = false,
  }) async {
    // if (config.appFlavor == Flavor.mock) {
    //   try {
    // final materialListData = user.role.type.isSalesRep
    //     ? await materialListLocalDataSource.getMaterialListSalesRep()
    //     : await materialListLocalDataSource.getMaterialList();

    //     return Right(materialListData);
    //   } catch (e) {
    //     return Left(FailureHandler.handleFailure(e));
    //   }
    // }

    try {
      final materialListData = user.role.type.isSalesRep
          ? await materialListRemoteDataSource.searchMaterialListSalesRep(
              userName: user.username.getOrCrash(),
              pickAndPack: appMethods.getPickAndPackValue(ispickandpackenabled),
              salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
              excludePrincipal: salesOrgConfig.getExcludePrincipal,
              customerCode: customerCodeInfo.customerCodeSoldTo,
              shipToCode: shipToInfo.shipToCustomerCode,
              pageSize: pageSize,
              offset: offset,
              orderBy: orderBy,
              searchKey: searchKey,
              language: salesOrgConfig.getConfigLangauge,
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
              language: salesOrgConfig.getConfigLangauge,
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
}
