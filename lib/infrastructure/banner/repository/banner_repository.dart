import 'dart:async';
import 'dart:io';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/error/banner_failure.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
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
  Future<Either<BannerFailure, List<BannerItem>>> getBanner({
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
      } on MockException catch (e) {
        return Left(BannerFailure.other(e.message));
      }
    }
    try {
      final banner = await remoteDataSource.getBanners(
        isPreSalesOrg: isPreSalesOrg,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );
      return Right(banner);
    } on CacheException catch (e) {
      return Left(BannerFailure.other(e.message));
    } on ServerException catch (e) {
      return Left(BannerFailure.serverError(e.message));
    } on SocketException {
      return const Left(BannerFailure.poorConnection());
    } on TimeoutException {
      return const Left(BannerFailure.serverTimeout());
    } on OtherException catch (e) {
      return Left(BannerFailure.other(e.message));
    }
  }

  // Future<Either<BannerFailure, List<BannerItem>>> _bannerFailureHandler(
  //   Function function,
  // ) async {
  //   try {
  //     return await function();
  //   } on CacheException catch (e) {
  //     return Left(BannerFailure.other(e.message));
  //   } on ServerException catch (e) {
  //     return Left(BannerFailure.serverError(e.message));
  //   } on SocketException {
  //     return const Left(BannerFailure.poorConnection());
  //   } on TimeoutException {
  //     return const Left(BannerFailure.serverTimeout());
  //   } on OtherException catch (e) {
  //     return Left(BannerFailure.other(e.message));
  //   }
  // }
}
