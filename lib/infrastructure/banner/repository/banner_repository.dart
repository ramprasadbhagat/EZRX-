import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/error/banner_failure.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';

class BannerRepository implements IBannerRepository {
  final BannerRemoteDataSource remoteDataSource;

  BannerRepository({required this.remoteDataSource});

  @override
  Future<Either<BannerFailure, List<BannerItem>>> getBanner(
    bool isPreSalesOrg,
    SalesOrganisation salesOrganisation,
  ) async {
    try {
      final banner = await remoteDataSource.getBanners(
        isPreSalesOrg,
        salesOrganisation.salesOrg.getOrCrash(),
      );
      return Right(banner);
    } on ServerException catch (e) {
      return Left(BannerFailure.other(e.message));
    }
  }
}
