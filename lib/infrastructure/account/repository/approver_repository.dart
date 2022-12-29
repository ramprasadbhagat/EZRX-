import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_approver_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_remote.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';

class ApproverRepository implements IApproverRepository {
  final Config config;
  final ApproverLocalDataSource localDataSource;
  final RemoteConfigService remoteConfigService;
  final ApproverRemoteDataSource remoteDataSource;

  ApproverRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.remoteConfigService,
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

  @override
  bool getReturnsConfig() {
    if (config.appFlavor == Flavor.mock) {
      return true;
    }
    try {
      final isReturnsEnabled = remoteConfigService.getReturnsConfig();

      return isReturnsEnabled;
    } catch (e) {
      return false;
    }
  }
}
