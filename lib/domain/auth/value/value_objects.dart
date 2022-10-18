import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_transformers.dart';
import 'package:ezrxmobile/domain/auth/value/value_validators.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    return Username._(validateStringNotEmpty(input));
  }

  const Username._(this.value);
}

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateStringNotEmpty(input).flatMap(validateEmailAddress),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password.login(String input) {
    return Password._(validateStringNotEmpty(input));
  }

  factory Password.reset(String input) {
    return Password._(validateStringNotEmpty(input).flatMap(validatePassword));
  }

  factory Password.resetV2(String newPassword, String oldPassword, User user) {
    return Password._(
      validateStringNotEmpty(newPassword)
          .flatMap(atleastOneLowerCharacter)
          .flatMap(atleastOneUpperCharacter)
          .flatMap(atleastOneNumericCharacter)
          .flatMap(atleastOneSpecialCharacter)
          .flatMap((input) => validateMinStringLength(input, 10))
          .flatMap((input) => validateContainUserNameOrName(input, user))
          .flatMap((input) => validateOldAndNewPassword(input, oldPassword)),
    );
  }

  factory Password.comfirm(String confirmPassword, String newPassword) {
    return Password._(
      validateStringNotEmpty(confirmPassword).flatMap(
        (input) => validateNewAndConfirmPassword(input, newPassword),
      ),
    );
  }

  bool matchMinCharacter(int length) {
    return isMinCharacter(
      input: value.fold((l) => l.failedValue, (r) => r),
      minLength: length,
    );
  }

  bool matchAtleastOneUpperCharacter() {
    return isAtleastOneUpperCharacter(
      input: value.fold((l) => l.failedValue, (r) => r),
    );
  }

  bool matchAtleastOneLowerCharacter() {
    return isAtleastOneLowerCharacter(
      input: value.fold((l) => l.failedValue, (r) => r),
    );
  }

  bool matchAtleastOneNumericCharacter() {
    return isAtleastOneNumericCharacter(
      input: value.fold((l) => l.failedValue, (r) => r),
    );
  }

  bool matchAtleastOneSpeacialCharacter() {
    return isAtleastOneSpecialCharacter(
      input: value.fold((l) => l.failedValue, (r) => r),
    );
  }

  bool matchMustNotContainUserNameOrName({required User user}) {
    return isMustNotContainUserNameOrName(
      input: value.fold((l) => l.failedValue, (r) => r),
      user: user,
    );
  }

  const Password._(this.value);
}

class JWT extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory JWT(String input) {
    return JWT._(validateJWT(input));
  }

  DateTime get expirationDate {
    return getJWTExpirationDate(value.getOrElse(() => ''));
  }

  Duration get issueTime {
    return getJWTTime(value.getOrElse(() => ''));
  }

  Duration get remainingTime {
    return getJWTRemainingTime(value.getOrElse(() => ''));
  }

  bool get isExpired {
    return isJWTExpired(value.getOrElse(() => ''));
  }

  const JWT._(this.value);
}
