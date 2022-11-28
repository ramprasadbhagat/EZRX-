import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_detail_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_remote.dart';

class MaterialPriceDetailRepository implements IMaterialPriceDetailRepository {
  final Config config;
  final MaterialPriceDetailLocalDataSource localDataSource;
  final MaterialPriceDetailRemoteDataSource remoteDataSource;

  MaterialPriceDetailRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, Map<MaterialQueryInfo, MaterialPriceDetail>>>
      getMaterialDetail({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToCodeInfo,
    required List<MaterialQueryInfo> materialQueryList,
  }) async {
    var materialDetailData = <MaterialPriceDetail>[];
    final materialDetails = <MaterialQueryInfo, MaterialPriceDetail>{};
    if (config.appFlavor == Flavor.mock) {
      try {
        materialDetailData = await localDataSource.getMaterialDetailList();
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    } else {
      try {
        final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
        final customerCode = customerCodeInfo.customerCodeSoldTo;
        final shipToCode = shipToCodeInfo.shipToCustomerCode;
        final language = salesOrganisationConfigs.getConfigLangauge;
        final queryMaterialNumbers = materialQueryList
            .map(
              (e) => e.value.getOrCrash(),
            )
            .toList();
        materialDetailData = await remoteDataSource.getMaterialDetail(
          salesOrgCode: salesOrgCode,
          customerCode: customerCode,
          shipToCode: shipToCode,
          language: language,
          materialNumbers: queryMaterialNumbers,
        );
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }

      materialDetails.addAll(
        {
          for (final materialDetail in materialDetailData)
            materialQueryList.firstWhere(
              (element) => element.value == materialDetail.price.materialNumber,
            ): materialDetail,
        },
      );
    }
    await _getMaterialDetailsWithZDP5(
      materialDetailData,
      salesOrganisationConfigs,
      materialQueryList,
      salesOrganisation,
      customerCodeInfo,
      shipToCodeInfo,
      materialDetails,
    );

    return Right(materialDetails);
  }

  Future<void> _getMaterialDetailsWithZDP5(
    List<MaterialPriceDetail> materialDetailData,
    SalesOrganisationConfigs salesOrganisationConfigs,
    List<MaterialQueryInfo> materialQueryList,
    SalesOrganisation salesOrganisation,
    CustomerCodeInfo customerCodeInfo,
    ShipToInfo shipToCodeInfo,
    Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
  ) async {
    final materialDetailWithZDP5Data = materialDetailData
        .where(
          (element) =>
              element.price.zdp5MaxQuota.isNotEmpty ||
              element.price.zdp5RemainingQuota.isNotEmpty,
        )
        .toList();
    if (salesOrganisationConfigs.enableZDP5 &&
        materialDetailWithZDP5Data.isNotEmpty) {
      final materialZDP5EnabledQueryList = {
        for (final data in materialDetailWithZDP5Data)
          materialQueryList.firstWhere(
            (element) => element.value == data.price.materialNumber,
          ): data,
      };

      final materialDetailZDP5EnabledMap = await getMaterialDetailZDP5Enabled(
        salesOrganisation: salesOrganisation,
        salesOrganisationConfigs: salesOrganisationConfigs,
        customerCodeInfo: customerCodeInfo,
        shipToCodeInfo: shipToCodeInfo,
        materialQueryList: materialZDP5EnabledQueryList,
      );

      await materialDetailZDP5EnabledMap.fold(
        (failure) async {},
        (materialDetailZDP5Enabled) async {
          materialDetails.addAll(
            {
              for (final materialDetail in materialDetailZDP5Enabled)
                materialQueryList.firstWhere(
                  (element) =>
                      element.value == materialDetail.price.materialNumber,
                ): materialDetail,
            },
          );
        },
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<MaterialPriceDetail>>>
      getMaterialDetailZDP5Enabled({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToCodeInfo,
    required Map<MaterialQueryInfo, MaterialPriceDetail> materialQueryList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialDetailData =
            await localDataSource.getMaterialDetailList();

        return Right(
          materialDetailData,
        );
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }

    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final shipToCode = shipToCodeInfo.shipToCustomerCode;
      final language = salesOrganisationConfigs.getConfigLangauge;
      final queryMaterialNumbers = materialQueryList.map(
        (materialQueryInfo, materialDetail) => MapEntry(
          materialQueryInfo.value.getOrCrash(),
          materialQueryInfo.qty.conformZDP5Rule(
                materialDetail.price.zdp5RemainingQuota,
              ) ||
              materialQueryInfo.qty.conformZDP5Rule(
                materialDetail.price.zdp5MaxQuota,
              ),
        ),
      );

      final materialDetailData =
          await remoteDataSource.getMaterialDetailZDP5Enabled(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        shipToCode: shipToCode,
        language: language,
        materialNumbers: queryMaterialNumbers,
      );

      return Right(
        materialDetailData,
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
