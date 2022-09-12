import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_org_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';

class SalesOrgRepository implements ISalesOrgRepository {
  final Config config;
  final SalesOrgRemoteDataSource remoteDataSource;
  final SalesOrgLocalDataSource localDataSource;

  SalesOrgRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, SalesOrganisationConfigs>>
      getSalesOrganisationConfigs(SalesOrganisation salesOrganisation) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final salesOrgConfigs = await localDataSource.getConfig(
          salesOrg: salesOrg,
        );

        return Right(salesOrgConfigs);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final salesOrgConfigs = await remoteDataSource.getConfig(
        salesOrg: salesOrg,
      );

      return Right(salesOrgConfigs);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
