import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:ezrxmobile/domain/aup_tc/repository/i_aup_tc_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_remote.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';

class AupTcRepository implements IAupTcRepository {
  final Config config;
  final AcceptanceDateLocalDataSource localDataSource;
  final AcceptanceDateRemoteDataSource remoteDataSource;
  final RemoteConfigService remoteConfigService;
  AupTcRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.remoteConfigService,
  });

  @override
  Future<Either<ApiFailure, TncDate>> getTncDate() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final acceptanceDate = await localDataSource.getAcceptanceDate();

        return Right(acceptanceDate);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }

    try {
      final acceptanceDate = await remoteDataSource.getAcceptanceDate();

      return Right(acceptanceDate);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  bool getTncConfig() {
    if (config.appFlavor == Flavor.mock) {
      return true;
    }
    try {
      final isTncEnabled = remoteConfigService.getTncConfig();

      return isTncEnabled;
    } catch (e) {
      return false;
    }
  }
}
