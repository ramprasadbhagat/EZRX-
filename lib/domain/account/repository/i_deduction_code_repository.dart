import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IDeductionCodeRepository {
  Future<Either<ApiFailure, List<DeductionCode>>> getDeductionCodes();
}
