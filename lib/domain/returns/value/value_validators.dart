import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';

Either<ValueFailure<double>, double> validateDoubleValue(
  String input,
) {
  if (double.tryParse(input) == null) {
    return left(const ValueFailure.invalidDoubleValue(failedValue: 0));
  }

  return Right(double.parse(input));
}
