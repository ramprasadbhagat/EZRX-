import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IPaymentMethodsRepository {
  Future<Either<ApiFailure, List<AvailablePaymentMethod>>>
      getAvailablePaymentMethods();

  Future<Either<ApiFailure, EditPaymentMethod>> updatePaymentMethods({
    required SalesOrg salesOrg,
    required PaymentMethod oldPaymentMethod,
    required PaymentMethod newPaymentMethod,
  });

  Future<Either<ApiFailure, DeletePaymentMethod>> deletePaymentMethods({
    required SalesOrg salesOrg,
    required PaymentMethod paymentMethod,
  });
}
