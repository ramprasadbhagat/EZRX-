import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/domain/returns/repository/i_user_restriction_repository.dart';

class UserRestrictionRepository extends IUserRestrictionRepository {
  final Config config;
  final UserRestrictionLocalDataSource localDataSource;
  final UserRestrictionRemoteDataSource remoteDataSource;

  UserRestrictionRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<String>>> getUserRestrictionsList(
    SalesOrg salesOrg,
  ) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final userRestriction = await localDataSource.fetch();

        return Right(userRestriction.rawMetaData.usernames);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final userRestriction =
          await remoteDataSource.fetch(salesOrg: salesOrg.getOrCrash());

      return Right(userRestriction.rawMetaData.usernames);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
