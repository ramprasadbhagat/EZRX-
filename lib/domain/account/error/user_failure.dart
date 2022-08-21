import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failure.freezed.dart';

@freezed
class UserFailure with _$UserFailure {
  const factory UserFailure.other(String message) = _Other;
  const factory UserFailure.serverError(String message) = _ServerError;
  const factory UserFailure.poorConnection() = _PoorConnection;
  const factory UserFailure.serverTimeout() = _ServerTimeout;
  const factory UserFailure.userNotFound() = _UserNotFound;
}
