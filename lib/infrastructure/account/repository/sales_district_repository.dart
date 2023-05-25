import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_district_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_district_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_district_remote.dart';

class SalesDistrictRepository implements ISalesDistrictRepository {
  final Config config;
  final SalesDistrictRemoteDataSource remoteDataSource;
  final SalesDistrictLocalDataSource localDataSource;

  SalesDistrictRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrictList() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final salesDistrictList = await localDataSource.getSalesDistrictList();

        return Right(salesDistrictList);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final salesDistrictList = await remoteDataSource.getSalesDistrictList();

      return Right(salesDistrictList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
