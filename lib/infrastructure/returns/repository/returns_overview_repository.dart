import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/returns_overview.dart';
import 'package:ezrxmobile/domain/returns/repository/i_returns_overview_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/returns_overview_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/returns_overview_remote.dart';

class ReturnsOverviewRepository extends IReturnsOverviewRepository {
  final Config config;
  final ReturnsOverviewLocalDataSource localDataSource;
  final ReturnsOverviewRemoteDataSource remoteDataSource;

  ReturnsOverviewRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ReturnsOverview>> getReturnsOverview({
    required String soldTo,
    required String shipTo,
    required SalesOrg salesOrg,
    required Username username,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnsOverview = await localDataSource.fetch();

        return Right(returnsOverview);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnsOverview = await remoteDataSource.fetch(
        username: username.getOrCrash(),
        salesOrg: salesOrg.getOrCrash(),
        shipTo: shipTo,
        soldTo: soldTo,
      );

      return Right(returnsOverview);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
