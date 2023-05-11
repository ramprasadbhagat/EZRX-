import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IPaymentConfigurationRepository {
  Future<Either<ApiFailure, List<AvailablePaymentMethod>>>
      getAvailablePaymentMethods();
}
