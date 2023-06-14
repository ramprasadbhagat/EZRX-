import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/repository/i_account_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_remote.dart';

class AccountSummaryRepository extends IAccountSummaryRepository {
  final Config config;
  final AccountSummaryLocalDataSource localDataSource;
  final AccountSummaryRemoteDataSource remoteDataSource;
  AccountSummaryRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, OutstandingBalance>> fetchInvoiceSummary({
    required String custCode,
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.fetchInvoiceSummary();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, CreditLimit>> fetchCreditSummary({
    required String custCode,
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.fetchCreditSummary();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    throw UnimplementedError();
  }
}
