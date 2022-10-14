import 'dart:async';
import 'package:ezrxmobile/config.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_additional_bonus_repository.dart';
import 'package:ezrxmobile/infrastructure/core/common/app_method.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_remote.dart';

class BonusMaterialRepository implements IBonusMaterialRepository {
  final Config config;
  final BonusMaterialLocalDataSource localDataSource;
  final BonusMaterialRemoteDataSource remoteDataSource;
  AppMethods appMethods;

  BonusMaterialRepository({
    required this.config,
    required this.localDataSource,
    required this.appMethods,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialBonus({
    required User user,
    required SalesOrganisationConfigs configs,
    required String searchKey,
    required SalesOrgCustomerInfo customerInfo,
    required SalesOrgShipToInfo shipInfo,
    required SalesOrganisation salesOrganisation,
    required bool pickandpack,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final List<MaterialInfo> bonusMaterial;
        bonusMaterial = user.role.type.isSalesRep
            ? await localDataSource.customerMaterialsForSalesRep()
            : await localDataSource.getadditionalBonus();

        return Right(bonusMaterial);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }

    try {
      final List<MaterialInfo> bonusMaterial;
      bonusMaterial = user.role.type.isSalesRep
          ? await remoteDataSource.customerMaterialsForSalesRep(
              gimmickMaterial:
                  configs.enableGimmickMaterial, // gimmickMaterial,
              pickandpack: appMethods.getPickAndPackValue(pickandpack),
              salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
              searchKey: searchKey,
              username: user.username.getValue(),
              shipTo: shipInfo.shipToCustomerCode,
              soldTo: customerInfo.customerCodeSoldTo.getOrCrash(),
            )
          : await remoteDataSource.getadditionalBonus(
              customerCodeSoldTo: customerInfo.customerCodeSoldTo.getOrCrash(),
              salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
              searchKey: searchKey,
              shipToCode: shipInfo.shipToCustomerCode,
              // salesOrganisation: '2601',
              // searchKey: 'uk',
              // customerCodeSoldTo: '0000002610',
              // shipToCode: '0000002610',
            );

      return Right(bonusMaterial);
    } catch (e) {
      // print(e);
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
