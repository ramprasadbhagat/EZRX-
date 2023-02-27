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
  const factory ApiFailure.authenticationFailed() = _AuthenticationFailed;

  const factory ApiFailure.proxyLoginRolePermissionNotMatch() =
      _ProxyLoginRolePermissionNotMatch;
  const factory ApiFailure.proxyLoginZPTargetRoleNotMatch() =
      _ProxyLoginZPTargetRoleNotMatch;
  const factory ApiFailure.proxyLoginZPSalesOrgNotMatch() =
      _ProxyLoginZPSalesOrgNotMatch;

  // Bio failure
  const factory ApiFailure.deviceNotSupportBiometirc() =
      _DeviceNotSupportBiometirc;
  const factory ApiFailure.cannotCheckBiometrics() = _CannotCheckBiometrics;
  const factory ApiFailure.noSupportedBiometrics() = _NoSupportedBiometrics;
  const factory ApiFailure.invalidBiometirc() = _InvalidBiometirc;
  const factory ApiFailure.priceOverrideNotFound() = _PriceOverrideNotFound;

  // Cart failure
  const factory ApiFailure.productOutOfStock() = _ProductOutOfStock;
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
      authenticationFailed: (_) => 'Your session has expired',
      deviceNotSupportBiometirc: (_) => 'Device not support biometric',
      cannotCheckBiometrics: (_) => 'Unable to check your biometric',
      noSupportedBiometrics: (_) => 'No supported biometric',
      invalidBiometirc: (_) => 'Incorrect biometric',
      priceOverrideNotFound: (_) => 'Price override not found!',
      proxyLoginRolePermissionNotMatch: (_) =>
          'Only Root Admin and ZP Admin can login on behalf',
      proxyLoginZPSalesOrgNotMatch: (_) =>
          'ZP Admin can only login on behalf of users from the same Sales Org',
      proxyLoginZPTargetRoleNotMatch: (_) =>
          'ZP Admin can only login on behalf of Sales Rep and Customer users',
      productOutOfStock: (_) => 'Product Not Available',
    );

    return failureMessage;
  }
}
