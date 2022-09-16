import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';

class AuthRepository implements IAuthRepository {
  final Config config;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final TokenStorage tokenStorage;
  final CredStorage credStorage;
  final OktaLoginServices oktaLoginServices;
  final PushNotificationService pushNotificationService;

  AuthRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.tokenStorage,
    required this.credStorage,
    required this.oktaLoginServices,
    required this.pushNotificationService,
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
        final loginv2 = await localDataSource.loginWithPassword(
          username: usernameStr,
          password: passwordStr,
        );

        return Right(loginv2);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final fcmToken = await pushNotificationService.getFCMToken();
      final loginv2 = await remoteDataSource.loginWithPassword(
        username: usernameStr,
        password: passwordStr,
        fcmToken: fcmToken,
      );

      return Right(loginv2);
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
        final loginv2 = await localDataSource.proxyLoginWithUsername(
          username: usernameStr,
        );

        return Right(loginv2);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final loginv2 = await remoteDataSource.proxyLoginWithUsername(
        username: usernameStr,
      );

      return Right(loginv2);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Login>> getEZRXJWT(JWT oktaAccessToken) async {
    final token = oktaAccessToken.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final loginv2 = await localDataSource.loginWithOktaToken(
          oktaAccessToken: token,
        );

        return Right(loginv2);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final fcmToken = await pushNotificationService.getFCMToken();
      final loginv2 = await remoteDataSource.loginWithOktaToken(
        oktaAccessToken: token,
        fcmToken: fcmToken,
      );

      return Right(loginv2);
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
}
