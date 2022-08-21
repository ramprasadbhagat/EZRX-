import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.other(String message) = _Other;
  const factory AuthFailure.serverError(String message) = _ServerError;
  const factory AuthFailure.poorConnection() = _PoorConnection;
  const factory AuthFailure.serverTimeout() = _ServerTimeout;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory AuthFailure.accountLocked() = _AccountLocked;
  const factory AuthFailure.accountExpired() = _AccountExpired;
  const factory AuthFailure.tokenExpired() = _TokenExpired;
}
