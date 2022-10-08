import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/material/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/app_method.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_list_remote.dart';

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
              pickAndPack: appMethods.getPickAndPackValue(false),
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
            );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
