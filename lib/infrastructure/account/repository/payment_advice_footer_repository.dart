import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_advice_footer_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_remote.dart';

class PaymentAdviceFooterRepository extends IPaymentAdviceFooterRepository {
  final Config config;
  final PaymentAdviceFooterLocalDataSource localDataSource;
  final PaymentAdviceFooterRemoteDataSource remoteDataSource;
  PaymentAdviceFooterRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<PaymentAdviceFooter>>>
      getPaymentAdvice() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getPaymentAdvice();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getPaymentAdvice();

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
