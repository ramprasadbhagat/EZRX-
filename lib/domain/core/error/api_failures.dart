import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failures.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.other(String message) = _Other;
  const factory ApiFailure.serverError(String message) = _ServerError;
  const factory ApiFailure.poorConnection() = _PoorConnection;
  const factory ApiFailure.serverTimeout() = _ServerTimeout;

  //User failure
  const factory ApiFailure.userNotFound() = _UserNotFound;

  //Auth failure
  const factory ApiFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory ApiFailure.accountLocked() = _AccountLocked;
  const factory ApiFailure.accountExpired() = _AccountExpired;
  const factory ApiFailure.tokenExpired() = _TokenExpired;

  // Bio failure
  const factory ApiFailure.deviceNotSupportBiometirc() =
      _DeviceNotSupportBiometirc;
  const factory ApiFailure.cannotCheckBiometrics() = _CannotCheckBiometrics;
  const factory ApiFailure.noSupportedBiometrics() = _NoSupportedBiometrics;
  const factory ApiFailure.invalidBiometirc() = _InvalidBiometirc;
}

extension ApiFailureExt on ApiFailure {
  String get failureMessage {
    final failureMessage = map(
      other: (other) => other.message,
      serverError: (serverError) => serverError.message,
      poorConnection: (_) => 'Poor Internet connection',
      serverTimeout: (_) => 'Server time out',
      userNotFound: (_) => 'User not found.',
      invalidEmailAndPasswordCombination: (_) =>
          'Incorrect username and/or password.',
      accountLocked: (_) => 'Account is Locked',
      accountExpired: (_) => 'Account is Expired',
      tokenExpired: (_) => 'Session token is Expired',
      deviceNotSupportBiometirc: (_) => 'Device not support biometric',
      cannotCheckBiometrics: (_) => 'Unable to check your biometric',
      noSupportedBiometrics: (_) => 'No supported biometric',
      invalidBiometirc: (_) => 'Incorrect biometric',
    );

    return failureMessage;
  }
}
