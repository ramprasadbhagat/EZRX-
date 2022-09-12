import 'dart:async';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';

class BannerRepository implements IBannerRepository {
  final Config config;
  final BannerRemoteDataSource remoteDataSource;
  final BannerLocalDataSource localDataSource;

  BannerRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<BannerItem>>> getBanner({
    required bool isPreSalesOrg,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final loginv2 = await localDataSource.getBanners(
          isPreSalesOrg: isPreSalesOrg,
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        );

        return Right(loginv2);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final banner = await remoteDataSource.getBanners(
        isPreSalesOrg: isPreSalesOrg,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(banner);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
