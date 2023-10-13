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
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';

class MaterialListRepository implements IMaterialListRepository {
  final Config config;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;

  MaterialListRepository({
    required this.config,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, MaterialResponse>> getMaterialList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required MaterialFilter selectedMaterialFilter,
    required Locale locale,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData =
            await materialListLocalDataSource.getProductList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData =
          await materialListRemoteDataSource.getProductList(
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        pageSize: pageSize,
        language: salesOrgConfig.getConfigLanguage,
        gimmickMaterial: salesOrgConfig.enableGimmickMaterial,
        isFavourite: selectedMaterialFilter.isFavourite,
        isFOCMaterial: selectedMaterialFilter.isFOCMaterial,
        bundleOffers: selectedMaterialFilter.bundleOffers,
        isProductOffer: selectedMaterialFilter.isProductOffer,
        principalCode: '',
        offset: offset,
        orderByName: selectedMaterialFilter.sortBy.valueRequest,
        manufactureList: selectedMaterialFilter.manufactureListSelected,
        countryListCode: selectedMaterialFilter.countryListSelected
            .map((e) => e.code)
            .toList(),
        searchKey: '',
        salesDeal: selectedMaterialFilter.comboOffers
            ? customerCodeInfo.salesDeals
                .map((e) => e.getOrDefaultValue(''))
                .toList()
            : [],
      );

      final stockInfoList = await getStockInfoList(
        materials: materialListData.products,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      final bundleData = await getBundleData(
        customerCodeInfo: customerCodeInfo,
        materials: materialListData.products,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
        locale: locale,
      );

      return Right(
        materialListData.copyWith(
          products: _mapMaterialListDataWithStock(
            materialListData,
            stockInfoList,
            bundleData,
          ),
        ),
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  List<MaterialInfo> _mapMaterialListDataWithStock(
    MaterialResponse materialListData,
    Either<ApiFailure, List<MaterialStockInfo>> stockInfoList,
    Either<ApiFailure, Map<MaterialNumber, MaterialInfo>> bundleData,
  ) {
    
    return materialListData.products.map(
      (MaterialInfo materialInfo) {
        final materialStockInfo = getMaterialStockInfo(
          stockInfoList: stockInfoList,
          materialInfo: materialInfo,
        );
        final upDatedMaterialInfo = bundleData.getOrElse(() => {}).putIfAbsent(
              materialInfo.materialNumber,
              () => materialInfo,
            );

        return upDatedMaterialInfo.copyWithStock(
          stockInfos: materialStockInfo.stockInfos,
        );
      },
    ).toList();
  }

  MaterialStockInfo getMaterialStockInfo({
    required Either<ApiFailure, List<MaterialStockInfo>> stockInfoList,
    required MaterialInfo materialInfo,
  }) {
    return stockInfoList.getOrElse(() => []).firstWhere(
          (MaterialStockInfo materialStockInfo) =>
              materialStockInfo.materialNumber == materialInfo.materialNumber,
          orElse: () => MaterialStockInfo.empty(),
        );
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
  Future<Either<ApiFailure, List<MaterialStockInfo>>> getStockInfoList({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList =
            await stockInfoLocalDataSource.getMaterialStockInfoList();

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final stockInfoList =
            await stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers:
              materials.map((e) => e.materialNumber.getOrCrash()).toList(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
        );

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, MaterialInfo>>> getBundleData({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) async {
    try {
      final materialInfoMap = <MaterialNumber, MaterialInfo>{};
      final bundles =
          materials.where((e) => e.listingDataNotAvailable).toList();

      for (final bundle in bundles) {
        final materialInfo = await getMaterialData(
          customerCodeInfo: customerCodeInfo,
          material: bundle,
          salesOrganisation: salesOrganisation,
          shipToInfo: shipToInfo,
          type: 'bundle',
          locale: locale,
        );
        materialInfoMap.addAll(
          {bundle.materialNumber: materialInfo.getOrElse(() => bundle)},
        );
      }

      return right(materialInfoMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getMaterialData({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required String type,
    required Locale locale,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialInfo =
            await materialListLocalDataSource.getProductDetails();

        return Right(materialInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final materialData =
            await materialListRemoteDataSource.getProductDetails(
          code: material.materialNumber.getOrCrash(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          customerCode: customerCodeInfo.customerCodeSoldTo,
          shipToCode: shipToInfo.shipToCustomerCode,
          type: type,
          language: locale.languageCode,
        );

        return Right(materialData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, MaterialResponse>> getMaterialBonusList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required PrincipalData principalData,
    required bool enableGimmickMaterial,
    required User user,
    required SearchKey searchKey,
  }) async {
    final preferredLanguage = user.settings.languagePreference.languageCode;
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData =
            await materialListLocalDataSource.getProductList();

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData =
          await materialListRemoteDataSource.getProductList(
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        pageSize: pageSize,
        language: preferredLanguage,
        gimmickMaterial: enableGimmickMaterial,
        bundleOffers: false,
        countryListCode: [],
        isFavourite: false,
        isFOCMaterial: false,
        isProductOffer: false,
        manufactureList: [principalData.principalName.getOrCrash()],
        offset: offset,
        orderByName: 'asc',
        principalCode: principalData.principalCode.getOrCrash(),
        searchKey: searchKey.getOrCrash(),
        salesDeal: [],
      );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
