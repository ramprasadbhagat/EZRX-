import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_approver_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_remote.dart';

class ApproverRepository implements IApproverRepository {
  final Config config;
  final ApproverLocalDataSource localDataSource;
  final ApproverRemoteDataSource remoteDataSource;

  ApproverRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, bool>> getIsApprover(User user) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final isApprover = await localDataSource.fetch();

        return Right(isApprover.isApprover);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final isApprover = await remoteDataSource.fetch(
        username: user.username.getOrCrash(),
      );

      return Right(isApprover.isApprover);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
