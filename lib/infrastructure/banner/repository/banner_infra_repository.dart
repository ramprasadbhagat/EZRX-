import 'package:ezrxmobile/domain/banner/error/banner_failure.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';

class BannerInfraRepository implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;

  BannerInfraRepository({required this.remoteDataSource});

  @override
  Future<Either<BannerFailure, List<BannerItem>>> getBanner() async {
    try {
      final banner = await remoteDataSource.getBanners(false, '2001');
      print(banner);
      return Right(banner);
    } on ServerException catch (e) {
      return Left(BannerFailure.other(e.message));
    }
  }
}
