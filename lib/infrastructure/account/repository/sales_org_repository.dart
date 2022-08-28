import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/error/sales_org_failure.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_org_repository.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
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
  Future<Either<SalesOrgFailure, SalesOrganisationConfigs>>
      getSalesOrganisationConfigs(SalesOrganisation salesOrganisation) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final salesOrgConfigs = await localDataSource.getConfig(
          salesOrg: salesOrg,
        );
        return Right(salesOrgConfigs);
      } on MockException catch (e) {
        return Left(SalesOrgFailure.other(e.message));
      }
    }
    try {
      final salesOrgConfigs = await remoteDataSource.getConfig(
        salesOrg: salesOrg,
      );
      return Right(salesOrgConfigs);
    } on ServerException catch (e) {
      return Left(SalesOrgFailure.serverError(e.message));
    } on CacheException catch (e) {
      return Left(SalesOrgFailure.other(e.message));
    } on SocketException {
      return const Left(SalesOrgFailure.poorConnection());
    } on TimeoutException {
      return const Left(SalesOrgFailure.serverTimeout());
    } on OtherException catch (e) {
      return Left(SalesOrgFailure.other(e.message));
    }
  }
}
