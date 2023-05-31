import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';

abstract class IPaymentAdviceFooterRepository {
  Future<Either<ApiFailure, List<PaymentAdviceFooter>>> getPaymentAdvice();
}
