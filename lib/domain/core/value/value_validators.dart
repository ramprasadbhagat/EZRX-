import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

// Either<ValueFailure<String>, String> validateMaxStringLength(
//   String input,
//   int maxLength,
// ) {
//   return input.length <= maxLength
//       ? right(input)
//       : left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
// }

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateDateString(String input) {
  final dateTime = tryParseDateTime(input);

  return dateTime != null
      ? right(input)
      : left(ValueFailure.invalidDateValue(failedValue: input));
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

Either<ValueFailure<String>, String> validateMinStringLength(
  String input,
  int minLength,
) {
  return isMinCharacter(input: input, minLength: minLength)
      ? right(input)
      : left(ValueFailure.subceedLength(failedValue: input, min: minLength));
}

Either<ValueFailure<String>, String> atleastOneUpperCharacter(String input) {
  return isAtleastOneUpperCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneUpperCaseCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atleastOneLowerCharacter(String input) {
  return isAtleastOneLowerCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneLowerCaseCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atleastOneNumericCharacter(String input) {
  return isAtleastOneNumericCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneNumericCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atleastOneSpecialCharacter(String input) {
  return isAtleastOneSpecialCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneSpecialCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> validateContainUserNameOrName(
  String input,
  User user,
) {
  return isMustNotContainUserNameOrName(input: input, user: user)
      ? right(input)
      : left(ValueFailure.mustNotContainUserName(failedValue: input));
}

Either<ValueFailure<String>, String> validateStringIsEmpty(String input) {
  return input.isEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<double>, double> validateNumberIsBiggerThanZero(
  double input,
) {
  return input > 0.0
      ? right(input)
      : left(ValueFailure.numberMustBiggerThanZero(failedValue: input));
}

Either<ValueFailure<String>, String> validateInputIsBiggerThanMaxValue(
  String input,
  int maxValue,
) {
  return int.parse(input) <= maxValue
      ? right(input)
      : left(ValueFailure.exceedingMaxValue(
          failedValue: maxValue.toString(),
        ));
}
