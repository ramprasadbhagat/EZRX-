import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/sales_org_id.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_variable_dto.dart';

class UpdateSalesOrgRepository {
  final Config config;
  final UpdateSalesOrgRemoteDataSource remoteDataSource;
  final UpdateSalesOrgLocalDataSource localDataSource;

  UpdateSalesOrgRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<Either<ApiFailure, UpdateSalesOrganisationConfigs>>
      getUpdateSalesOrganisationConfigs(
    SalesOrganisation salesOrganisation,
    SalesOrgId salesOrgId,
    UpdateSalesOrganisationConfigs updateSalesOrganisationConfigs,
  ) async {
    final salesOrg = salesOrganisation.salesOrg.country;
    if (config.appFlavor == Flavor.mock) {
      try {
        final updatedSalesOrgConfigs =
            await localDataSource.updateSalesOrgConfig(
          salesOrg: salesOrg,
        );

        return Right(updatedSalesOrgConfigs);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final variableData = UpdateSalesOrganisationConfigsVariableDto.fromDomain(
              salesOrgId, updateSalesOrganisationConfigs,)
          .toJson();
      final updatedSalesOrgConfigs =
          await remoteDataSource.updateSalesOrgConfig(
        salesOrg: salesOrg,
        variableData: variableData,
      );

      return Right(updatedSalesOrgConfigs);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
