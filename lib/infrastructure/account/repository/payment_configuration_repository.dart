import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_configuration_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_configuration_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_configuration_remote.dart';

class PaymentConfigurationRepository
    implements IPaymentConfigurationRepository {
  final Config config;
  final PaymentConfigurationRemoteDataSource remoteDataSource;
  final PaymentConfigurationLocalDataSource localDataSource;

  PaymentConfigurationRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<AvailablePaymentMethod>>>
      getAvailablePaymentMethods() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentMethods =
            await localDataSource.getAvailablePaymentMethods();

        return Right(paymentMethods);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final availablePaymentMethods =
          await remoteDataSource.getAvailablePaymentMethods();

      return Right(availablePaymentMethods);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, EditPaymentMethod>> updatePaymentMethods({
    required SalesOrg salesOrg,
    required PaymentMethod oldPaymentMethod,
    required PaymentMethod newPaymentMethod,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        return Right(await localDataSource.updatePaymentMethods());
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      return Right(
        await remoteDataSource.updatePaymentMethods(
          salesOrg: salesOrg.getOrCrash(),
          oldPaymentMethod: oldPaymentMethod.getOrCrash(),
          newPaymentMethod: newPaymentMethod.getOrCrash(),
        ),
      );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, DeletePaymentMethod>> deletePaymentMethods({
    required SalesOrg salesOrg,
    required PaymentMethod paymentMethod,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        return Right(await localDataSource.deletePaymentMethods());
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      return Right(
        await remoteDataSource.deletePaymentMethods(
          salesOrg: salesOrg.getOrCrash(),
          paymentMethod: paymentMethod.getOrCrash(),
        ),
      );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
