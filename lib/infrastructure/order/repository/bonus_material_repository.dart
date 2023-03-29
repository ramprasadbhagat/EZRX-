import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_additional_bonus_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_remote.dart';

class BonusMaterialRepository implements IBonusMaterialRepository {
  final Config config;
  final BonusMaterialLocalDataSource localDataSource;
  final BonusMaterialRemoteDataSource remoteDataSource;

  BonusMaterialRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialBonus({
    required User user,
    required SalesOrganisationConfigs configs,
    required String searchKey,
    required CustomerCodeInfo customerInfo,
    required ShipToInfo shipInfo,
    required SalesOrganisation salesOrganisation,
    required String pickAndPack,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final List<MaterialInfo> bonusMaterial;
        bonusMaterial = user.role.type.isSalesRepRole
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
      bonusMaterial = user.role.type.isSalesRepRole
          ? await remoteDataSource.customerMaterialsForSalesRep(
              gimmickMaterial: configs.enableGimmickMaterial,
              pickandpack: pickAndPack,
              salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
              searchKey: searchKey,
              username: user.username.getValue(),
              shipTo: shipInfo.shipToCustomerCode,
              soldTo: customerInfo.customerCodeSoldTo,
            )
          : await remoteDataSource.getadditionalBonus(
              customerCodeSoldTo: customerInfo.customerCodeSoldTo,
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
