import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/repository/i_usage_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_remote.dart';

class UsageRepository implements IUsageRepository {
  final Config config;
  final UsageLocalDataSource usageLocalDataSource;
  final UsageRemoteDataSource usageRemoteDataSource;

  UsageRepository({
    required this.config,
    required this.usageLocalDataSource,
    required this.usageRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<Usage>>> getUsages({
    required SalesOrg salesOrg,
  }) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        final usage = await usageLocalDataSource.getUsages();

        return Right(usage);
      } else {
        final usage = await usageRemoteDataSource.getUsages(
          salesOrg: salesOrg.getOrCrash(),
        );

        return Right(usage);
      }
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
