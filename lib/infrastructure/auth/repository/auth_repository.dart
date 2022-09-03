import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/auth/error/auth_failure.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:flutter/services.dart';
import 'dart:io';

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
  Future<Either<AuthFailure, LoginV2>> login({
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
      } on MockException catch (e) {
        return Left(AuthFailure.other(e.message));
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
    } on AuthException catch (e) {
      return Left(e.map(
        invalidEmailAndPasswordCombination: (_) =>
            const AuthFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const AuthFailure.accountLocked(),
        accountExpired: (_) => const AuthFailure.accountExpired(),
      ));
    } on CacheException catch (e) {
      return Left(AuthFailure.other(e.message));
    } on ServerException catch (e) {
      return Left(AuthFailure.serverError(e.message));
    } on SocketException {
      return const Left(AuthFailure.poorConnection());
    } on TimeoutException {
      return const Left(AuthFailure.serverTimeout());
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on OtherException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, LoginV2>> proxyLogin({
    required Username username,
  }) async {
    final usernameStr = username.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final loginv2 = await localDataSource.proxyLoginWithUsername(
          username: usernameStr,
        );

        return Right(loginv2);
      } on MockException catch (e) {
        return Left(AuthFailure.other(e.message));
      }
    }
    try {
      final loginv2 = await remoteDataSource.proxyLoginWithUsername(
        username: usernameStr,
      );

      return Right(loginv2);
    } on AuthException catch (e) {
      return Left(e.map(
        invalidEmailAndPasswordCombination: (_) =>
            const AuthFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const AuthFailure.accountLocked(),
        accountExpired: (_) => const AuthFailure.accountExpired(),
      ));
    } on CacheException catch (e) {
      return Left(AuthFailure.other(e.message));
    } on ServerException catch (e) {
      return Left(AuthFailure.serverError(e.message));
    } on SocketException {
      return const Left(AuthFailure.poorConnection());
    } on TimeoutException {
      return const Left(AuthFailure.serverTimeout());
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on OtherException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, LoginV2>> getEZRXJWT(JWT oktaAccessToken) async {
    final token = oktaAccessToken.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final loginv2 = await localDataSource.loginWithOktaToken(
          oktaAccessToken: token,
        );

        return Right(loginv2);
      } on MockException catch (e) {
        return Left(AuthFailure.other(e.message));
      }
    }
    try {
      final fcmToken = await pushNotificationService.getFCMToken();
      final loginv2 = await remoteDataSource.loginWithOktaToken(
        oktaAccessToken: token,
        fcmToken: fcmToken,
      );

      return Right(loginv2);
    } on AuthException catch (e) {
      return Left(e.map(
        invalidEmailAndPasswordCombination: (_) =>
            const AuthFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const AuthFailure.accountLocked(),
        accountExpired: (_) => const AuthFailure.accountExpired(),
      ));
    } on CacheException catch (e) {
      return Left(AuthFailure.other(e.message));
    } on ServerException catch (e) {
      return Left(AuthFailure.serverError(e.message));
    } on SocketException {
      return const Left(AuthFailure.poorConnection());
    } on TimeoutException {
      return const Left(AuthFailure.serverTimeout());
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on OtherException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> storeJWT({required JWT jwt}) async {
    try {
      await tokenStorage.set(JWTDto.fromDomain(jwt));

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> initTokenStorage() async {
    try {
      await tokenStorage.init();

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> tokenValid() async {
    try {
      final token = await tokenStorage.get();

      return token.toDomain().isExpired
          ? const Left(AuthFailure.tokenExpired())
          : const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> initOkta() async {
    try {
      await oktaLoginServices.init();

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithOkta() async {
    try {
      await oktaLoginServices.login();

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, JWT>> getOktaAccessToken() async {
    try {
      final result = await oktaLoginServices.getAccessToken();

      return Right(JWT(result?['message']));
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      await tokenStorage.clear();
      await oktaLoginServices.logout();

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> storeCredential({
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
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> deleteCredential() async {
    try {
      await credStorage.delete();

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> initCredStorage() async {
    try {
      await credStorage.init();

      return const Right(unit);
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future<Either<AuthFailure, Cred>> loadCredential() async {
    try {
      final credDto = await credStorage.get();

      return Right(credDto.toDomain());
    } on PlatformException catch (e) {
      return Left(AuthFailure.other('${e.message}'));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  // Future<Either<AuthFailure, LoginV2>> _loginV2FailureHandler(
  //   Function function,
  // ) async {
  //   try {
  //     return await function();
  //   } on AuthException catch (e) {
  //     return Left(e.map(
  //       invalidEmailAndPasswordCombination: (_) =>
  //           const AuthFailure.invalidEmailAndPasswordCombination(),
  //       accountLocked: (_) => const AuthFailure.accountLocked(),
  //       accountExpired: (_) => const AuthFailure.accountExpired(),
  //     ));
  //   } on CacheException catch (e) {
  //     return Left(AuthFailure.other(e.message));
  //   } on ServerException catch (e) {
  //     return Left(AuthFailure.serverError(e.message));
  //   } on SocketException {
  //     return const Left(AuthFailure.poorConnection());
  //   } on TimeoutException {
  //     return const Left(AuthFailure.serverTimeout());
  //   } on PlatformException catch (e) {
  //     return Left(AuthFailure.other('${e.message}'));
  //   } on OtherException catch (e) {
  //     return Left(AuthFailure.other(e.message));
  //   }
  // }

  // Future<Either<AuthFailure, Unit>> _unitFailureHandler(
  //   Function function,
  // ) async {
  //   try {
  //     return await function();
  //   } on PlatformException catch (e) {
  //     return Left(AuthFailure.other('${e.message}'));
  //   } on ServerException catch (e) {
  //     return Left(AuthFailure.other(e.message));
  //   }
  // }

  // Future<Either<AuthFailure, JWT>> _jwtFailureHandler(Function function) async {
  //   try {
  //     return await function();
  //   } on PlatformException catch (e) {
  //     return Left(AuthFailure.other('${e.message}'));
  //   } on ServerException catch (e) {
  //     return Left(AuthFailure.other(e.message));
  //   }
  // }

  // Future<Either<AuthFailure, Cred>> _credFailureHandler(
  //   Function function,
  // ) async {
  //   try {
  //     return await function();
  //   } on PlatformException catch (e) {
  //     return Left(AuthFailure.other('${e.message}'));
  //   } on ServerException catch (e) {
  //     return Left(AuthFailure.other(e.message));
  //   }
  // }
}
