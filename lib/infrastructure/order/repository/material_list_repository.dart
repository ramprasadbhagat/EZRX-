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
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';

class MaterialListRepository implements IMaterialListRepository {
  final Config config;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  final CountlyService countlyService;

  MaterialListRepository({
    required this.config,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    required this.countlyService,
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
              pickAndPack: pickAndPack,
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
      if (selectedMaterialFilter != MaterialFilter.empty()) {
        await callCountly(selectedMaterialFilter);
      }

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
        final materialListData = user.role.type.isSalesRep
            ? await materialListLocalDataSource.searchMaterialListSalesRep()
            : await materialListLocalDataSource.searchMaterialList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData = user.role.type.isSalesRep
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

  Future<void> callCountly(MaterialFilter selectedMaterialFilter) async {
    if (selectedMaterialFilter.uniquePrincipalName.isNotEmpty) {
      await countlyService.addCountlyEvent(
        'select_principal',
        segmentation: {
          'principalName': selectedMaterialFilter.uniquePrincipalName.join(','),
          'numSelected': selectedMaterialFilter.uniquePrincipalName.length,
        },
      );
      await countlyService.addCountlyEvent(
        'Use filter',
        segmentation: {
          'principal_name':
              selectedMaterialFilter.uniquePrincipalName.join(','),
        },
      );
    }
    if (selectedMaterialFilter.uniqueTherapeuticClass.isNotEmpty) {
      await countlyService.addCountlyEvent(
        'select_thera_class',
        segmentation: {
          'theraClassName':
              selectedMaterialFilter.uniqueTherapeuticClass.join(','),
          'numSelected': selectedMaterialFilter.uniqueTherapeuticClass.length,
        },
      );
      await countlyService.addCountlyEvent(
        'Use filter',
        segmentation: {
          'therapeutic_class':
              selectedMaterialFilter.uniqueTherapeuticClass.join(','),
        },
      );
    }
    if (selectedMaterialFilter.uniqueItemBrand.isNotEmpty) {
      await countlyService.addCountlyEvent(
        'Use filter',
        segmentation: {
          'item_brand': selectedMaterialFilter.uniqueItemBrand.join(','),
        },
      );
    }
  }
}
