import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException.other(String message) = _Other;
  const factory AuthException.serverError() = _ServerError;
  const factory AuthException.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory AuthException.accountLocked() = _AccountLocked;
  const factory AuthException.accountExpired() = _AccountExpired;
}
