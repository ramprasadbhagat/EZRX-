import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';

Either<ValueFailure<String>, String> validateJWT(String token) {
  try {
    getJWTPayload(token);
    return right(token);
  } catch (error) {
    return left(ValueFailure.invalidJWT(failedValue: token));
  }
}
