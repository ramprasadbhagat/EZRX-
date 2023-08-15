import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_transformers.dart';
import 'package:ezrxmobile/domain/auth/value/value_validators.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class AppMarket extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AppMarket(String input) {
    return AppMarket._(validateStringNotEmpty(input));
  }

  String get marketName => getMarketName(value.getOrElse(() => ''));

  String get countryFlag => getCountryFlag(value.getOrElse(() => ''));
  
  const AppMarket._(this.value);
}

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

  factory EmailAddress.optional(String input) {
    return EmailAddress._(
      (validateStringIsEmpty(input).fold(
        (l) => validateEmailAddress(input),
        (r) => Right(r),
      )),
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
          .flatMap(atLeastOneLowerCharacter)
          .flatMap(atLeastOneUpperCharacter)
          .flatMap(atLeastOneNumericCharacter)
          .flatMap(atLeastOneSpecialCharacter)
          .flatMap((input) => validateMinStringLength(input, 10))
          .flatMap((input) => validateContainUserNameOrName(input, user))
          .flatMap((input) => validateOldAndNewPassword(input, oldPassword)),
    );
  }

  factory Password.confirm(String confirmPassword, String newPassword) {
    return Password._(
      validateStringNotEmpty(confirmPassword).flatMap(
        (input) => validateNewAndConfirmPassword(input, newPassword),
      ),
    );
  }

  bool get matchMinCharacter => isMinCharacter(
        input: getValidPassword,
        minLength: 10,
      );

  bool get matchAtLeastOneUpperCharacter => isAtLeastOneUpperCharacter(
        input: getValidPassword,
      );

  bool get matchAtLeastOneLowerCharacter => isAtLeastOneLowerCharacter(
        input: getValidPassword,
      );

  bool get matchAtLeastOneNumericCharacter => isAtLeastOneNumericCharacter(
        input: getValidPassword,
      );

  bool get matchAtLeastOneSpecialCharacter => isAtLeastOneSpecialCharacter(
        input: getValidPassword,
      );

  String get getValidPassword => value.fold((l) => l.failedValue, (r) => r);

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

  String get userId {
    return getJwtUserId(value.getOrElse(() => ''));
  }

  bool get isExpired {
    return isJWTExpired(value.getOrElse(() => ''));
  }

  List get salesOrgs {
    return getJWTSalesOrg(value.getOrElse(() => ''));
  }

  RoleName get roleName {
    return getJWTRoleName(value.getOrElse(() => ''));
  }

  const JWT._(this.value);
}
