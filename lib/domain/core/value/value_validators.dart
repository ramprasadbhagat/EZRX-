import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  return input.length <= maxLength
      ? right(input)
      : left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  return input.contains('\n')
      ? left(ValueFailure.multiline(failedValue: input))
      : right(input);
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  return RegExp(emailRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // Password should be alphanumeric and consist of at least one upper case letter,
  // one special character and should be 10-20 characters long
  const passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,20}$';

  return RegExp(passwordRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.passwordNotMatchRequirements(failedValue: input));
}
