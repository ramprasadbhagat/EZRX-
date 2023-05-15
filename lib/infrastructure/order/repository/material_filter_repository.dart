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
import 'package:ezrxmobile/domain/order/repository/i_filter_material_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';

class MaterialFilterRepository implements IMaterialFilterRepository {
  final Config config;
  final MaterialFilterRemoteDataSource filterMaterialRemoteDataSource;
  final MaterialFilterLocalDataSource filterMaterialLocalDataSource;

  MaterialFilterRepository({
    required this.filterMaterialLocalDataSource,
    required this.config,
    required this.filterMaterialRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, MaterialFilter>> getMaterialFilterList({
    required SalesOrganisationConfigs salesOrgConfig,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String pickAndPack,
  }) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    final shipToCode = shipToInfo.shipToCustomerCode;
    final userName = user.username.getOrCrash();
    final gimmickMaterial = salesOrgConfig.enableGimmickMaterial;
    final language = salesOrgConfig.getConfigLanguage;

    if (config.appFlavor == Flavor.mock) {
      try {
        final filterMaterialData =
            await filterMaterialLocalDataSource.getFilters();

        return Right(filterMaterialData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final filterMaterialData = user.role.type.isSalesRepRole
          ? await filterMaterialRemoteDataSource.getFiltersSalesRep(
              salesOrganisation: salesOrg,
              soldToCustomerCode: customerCode,
              shipToCustomerCode: shipToCode,
              gimmickMaterial: gimmickMaterial,
              pickAndPack: pickAndPack,
              language: language,
              userName: userName,
            )
          : await filterMaterialRemoteDataSource.getFilters(
              salesOrganisation: salesOrg,
              shipToCustomerCode: shipToCode,
              soldToCustomerCode: customerCode,
              language: language,
            );

      return Right(filterMaterialData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  List<String> updateSelectedList({
    required List<String> selectedList,
    required String name,
  }) {
    if (selectedList.contains(name)) {
      return List<String>.from(selectedList)..remove(name);
    }

    return List<String>.from(selectedList)..add(name);
  }
}
