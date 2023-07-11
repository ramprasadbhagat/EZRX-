import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';

import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';

class AuthRepository implements IAuthRepository {
  final Config config;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final TokenStorage tokenStorage;
  final CredStorage credStorage;
  final CartStorage cartStorage;
  final SettingStorage settingStorage;
  final AccountSelectorStorage accountSelectorStorage;
  final OktaLoginServices oktaLoginServices;
  final PushNotificationService pushNotificationService;
  final LocalAuthentication localAuthentication;

  final MixpanelService mixpanelService;

  AuthRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.tokenStorage,
    required this.credStorage,
    required this.cartStorage,
    required this.settingStorage,
    required this.oktaLoginServices,
    required this.pushNotificationService,
    required this.localAuthentication,
    required this.accountSelectorStorage,
    required this.mixpanelService,
  });

  @override
  Future<Either<ApiFailure, Login>> login({
    required Username username,
    required Password password,
  }) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final login = await localDataSource.loginWithPassword();

        return Right(login);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final fcmToken = await pushNotificationService.getFCMToken();
      final login = await remoteDataSource.loginWithPassword(
        username: usernameStr,
        password: passwordStr,
        fcmToken: fcmToken,
      );
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.loginSuccess,
        properties: {
          MixpanelProps.loginMethod: 'By username',
        },
      );

      return Right(login);
    } catch (e) {
      if (e.runtimeType == ServerException) {
        final serverExceptionObject = e as ServerException;
        mixpanelService.trackEvent(
          eventName: MixpanelEvents.loginFailure,
          properties: {
            MixpanelProps.errorMessage: serverExceptionObject.message,
            MixpanelProps.loginMethod: 'By username',
          },
        );
      }

      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Login>> proxyLogin({
    required Username username,
  }) async {
    final usernameStr = username.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final login = await localDataSource.proxyLoginWithUsername();

        return Right(login);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final login = await remoteDataSource.proxyLoginWithUsername(
        username: usernameStr,
      );

      return Right(login);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> isEligibleProxyLogin({
    required User user,
    required JWT jwt,
  }) async {
    // 1.Root admin can proxy login any account
    // 2.ZP admin can proxy login same salesOrg's client and salesReps

    if (user.role.type.isRootAdmin) return const Right(unit);

    if (!user.role.type.isZPAdmin) {
      return const Left(ApiFailure.proxyLoginRolePermissionNotMatch());
    }

    if (!jwt.roleName.isEligibleLoginRoleForZPAdmin) {
      return const Left(ApiFailure.proxyLoginZPTargetRoleNotMatch());
    }

    final salesOrgMatches = user.userSalesOrganisations.any((element) =>
        jwt.salesOrgs.contains(element.salesOrg.value.getOrElse(() => '')));

    if (!salesOrgMatches) {
      return const Left(ApiFailure.proxyLoginZPSalesOrgNotMatch());
    }

    return const Right(unit);
  }

  @override
  Future<Either<ApiFailure, Login>> getEZRXJWT(JWT oktaAccessToken) async {
    final token = oktaAccessToken.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final login = await localDataSource.loginWithOktaToken();

        return Right(login);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final fcmToken = await pushNotificationService.getFCMToken();
      final login = await remoteDataSource.loginWithOktaToken(
        oktaAccessToken: token,
        fcmToken: fcmToken,
      );

      return Right(login);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> storeJWT({
    required JWT access,
    required JWT refresh,
  }) async {
    try {
      await tokenStorage.set(JWTDto.fromDomain(access, refresh));

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initTokenStorage() async {
    try {
      await tokenStorage.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> tokenValid() async {
    try {
      final token = await tokenStorage.get();

      return token.toDomain().isExpired && config.appFlavor != Flavor.mock
          ? const Left(ApiFailure.tokenExpired())
          : const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, JWT>> getRefreshToken() async {
    try {
      final token = await tokenStorage.get();
      final refreshToken = JWT(token.refresh);

      return refreshToken.isValid()
          ? Right(refreshToken)
          : const Left(ApiFailure.other('Invalid Refresh Token'));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initOkta() async {
    try {
      await oktaLoginServices.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> loginWithOkta() async {
    try {
      await oktaLoginServices.login();

      mixpanelService.trackEvent(
        eventName: MixpanelEvents.loginSuccess,
        properties: {
          MixpanelProps.loginMethod: 'Okta',
        },
      );

      return const Right(unit);
    } catch (e) {
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.loginFailure,
        properties: {
          MixpanelProps.loginMethod: 'Okta',
          MixpanelProps.errorMessage: e.toString(),
        },
      );

      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, JWT>> getOktaAccessToken() async {
    try {
      final result = await oktaLoginServices.getAccessToken();

      return Right(JWT(result?['message']));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> logout() async {
    try {
      await tokenStorage.clear();
      await oktaLoginServices.logout();
      await accountSelectorStorage.delete();
      await cartStorage.clear();
      await settingStorage.clear();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> storeCredential({
    required Username username,
    required Password password,
  }) async {
    try {
      await credStorage.set(
        CredDto(
          username: username.getOrCrash(),
          password: password.getOrCrash(),
        ),
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> deleteCredential() async {
    try {
      await credStorage.delete();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initCredStorage() async {
    try {
      await credStorage.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Cred>> loadCredential() async {
    try {
      final credDto = await credStorage.get();

      return Right(credDto.toDomain());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> doBiometricAuthentication() async {
    try {
      final isLocalAuthSuccess = await localAuthentication.authenticate(
        localizedReason: 'Complete the biometrics to continue',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Biometric authentication required!',
            cancelButton: 'No thanks',
            biometricNotRecognized: 'Failed Attempt',
            biometricRequiredTitle: 'Supports Biometric, but not setup',
            biometricSuccess: 'Recognised you',
            goToSettingsButton: 'Let\'s set-up biometric',
            goToSettingsDescription: 'You can set-up biometric on settings',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
            goToSettingsButton: 'Let\'s set-up biometric',
            goToSettingsDescription: 'You can set-up biometric on settings',
            lockOut: 'You have been locked out',
            localizedFallbackTitle: 'Fallback',
          ),
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
        ),
      );

      if (!isLocalAuthSuccess) {
        return const Left(ApiFailure.invalidBiometric());
      }

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> canBeAuthenticatedAndBioAvailable() async {
    try {
      if (kIsWeb) {
        return const Left(ApiFailure.deviceNotSupportBiometric());
      }

      if (!await localAuthentication.isDeviceSupported()) {
        return const Left(ApiFailure.deviceNotSupportBiometric());
      }

      if (!await localAuthentication.canCheckBiometrics) {
        return const Left(ApiFailure.cannotCheckBiometrics());
      }

      final availableBiometrics =
          await localAuthentication.getAvailableBiometrics();
      final isBioAvailable =
          availableBiometrics.contains(BiometricType.strong) ||
              availableBiometrics.contains(BiometricType.face) ||
              availableBiometrics.contains(BiometricType.fingerprint);

      if (!isBioAvailable) {
        return const Left(ApiFailure.noSupportedBiometrics());
      }

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> checkBiometricPermission() async {
    try {
      if (kIsWeb) {
        return const Left(ApiFailure.deviceNotSupportBiometric());
      }

      if (!await localAuthentication.canCheckBiometrics) {
        return const Left(ApiFailure.cannotCheckBiometrics());
      }

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> canShowBiometricToggle() async {
    try {
      if (kIsWeb) {
        return const Left(ApiFailure.deviceNotSupportBiometric());
      }

      if (!await localAuthentication.isDeviceSupported()) {
        return const Left(ApiFailure.deviceNotSupportBiometric());
      }

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Either<ApiFailure, bool> isBiometricEnabled() {
    try {
      final isBiometricEnabled = settingStorage.isBiometricEnabled() ?? false;

      return Right(isBiometricEnabled);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> putBiometricEnabledState({
    required bool isBiometricEnable,
  }) async {
    try {
      await settingStorage.putBiometricStatus(
        isBiometricEnabled: isBiometricEnable,
      );

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Login>> getAccessToken(JWT refreshToken) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final login = await localDataSource.getAccessToken();

        return Right(login);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final login = await remoteDataSource.getAccessToken(
        refreshToken: refreshToken.getOrDefaultValue(''),
      );

      return Right(login);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
