import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/repository/i_deduction_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_remote.dart';

class DeductionCodeRepository implements IDeductionCodeRepository {
  final Config config;
  final DeductionCodeRemoteDataSource remoteDataSource;
  final DeductionCodeLocalDataSource localDataSource;

  DeductionCodeRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<DeductionCode>>> getDeductionCodes() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final deductionCodes = await localDataSource.getDeductionCodes();

        return Right(deductionCodes);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final deductionCodes = await remoteDataSource.getDeductionCodes();

      return Right(deductionCodes);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
