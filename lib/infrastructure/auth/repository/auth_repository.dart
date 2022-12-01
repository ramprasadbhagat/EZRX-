import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
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
  final AccountSelectorStorage accountSelectorStorage;
  final OktaLoginServices oktaLoginServices;
  final PushNotificationService pushNotificationService;
  final LocalAuthentication localAuthentication;
  final CountlyService countlyService;

  AuthRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.tokenStorage,
    required this.credStorage,
    required this.cartStorage,
    required this.oktaLoginServices,
    required this.pushNotificationService,
    required this.localAuthentication,
    required this.accountSelectorStorage,
    required this.countlyService,
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
        final login = await localDataSource.loginWithPassword(
          username: usernameStr,
          password: passwordStr,
        );

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
      await countlyService.addCountlyEvent('Login Success');

      return Right(login);
    } catch (e) {
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
        final login = await localDataSource.proxyLoginWithUsername(
          username: usernameStr,
        );

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
  Future<Either<ApiFailure, Login>> getEZRXJWT(JWT oktaAccessToken) async {
    final token = oktaAccessToken.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final login = await localDataSource.loginWithOktaToken(
          oktaAccessToken: token,
        );

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
  Future<Either<ApiFailure, Unit>> storeJWT({required JWT jwt}) async {
    try {
      await tokenStorage.set(JWTDto.fromDomain(jwt));

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

      return const Right(unit);
    } catch (e) {
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
            goToSettingsButton: 'Let\'s setup biometric',
            goToSettingsDescription: 'You can setupbiometric on settings',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
            goToSettingsButton: 'Let\'s setup biometric',
            goToSettingsDescription: 'You can setupbiometric on settings',
            lockOut: 'you have been locked out',
            localizedFallbackTitle: 'Fallback',
          ),
        ],
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
        ),
      );

      if (!isLocalAuthSuccess) {
        return const Left(ApiFailure.invalidBiometirc());
      }

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> canBeAuthenticatedAndBioAvailable() async {
    try {
      if (!await localAuthentication.canCheckBiometrics) {
        return const Left(ApiFailure.cannotCheckBiometrics());
      }

      if (!await localAuthentication.isDeviceSupported()) {
        return const Left(ApiFailure.deviceNotSupportBiometirc());
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
}
