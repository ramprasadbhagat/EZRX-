import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
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
        final banners = await localDataSource.getBanners(
          isPreSalesOrg: isPreSalesOrg,
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        );

        return Right(banners);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final banners = await remoteDataSource.getBanners(
        isPreSalesOrg: isPreSalesOrg,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(banners);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<BannerItem>>> getEZReachBanner({
    required SalesOrganisation salesOrganisation,
    required String country,
    required String role,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final ezReachBanners = await localDataSource.getEZReachBanners(
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          country: country,
          role: role,
        );

        return Right(ezReachBanners);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final ezReachBanners = await remoteDataSource.getEZReachBanners(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        country: country,
        role: role,
      );

      return Right(ezReachBanners);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
