import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/auth/error/auth_failure.dart';
import 'package:ezrxmobile/domain/auth/local_storage/i_cred_storage.dart';
import 'package:ezrxmobile/domain/auth/login/I_login_service.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/local_storage/i_token_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:flutter/services.dart';

class AuthRepository implements IAuthRepository {
  final Config config;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final ITokenStorage tokenStorage;
  final ICredStorage credStorage;
  final ILoginService oktaLoginServices;

  AuthRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.tokenStorage,
    required this.credStorage,
    required this.oktaLoginServices,
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
      } on LocalException catch (e) {
        return Left(AuthFailure.other(e.message));
      }
    }
    try {
      final loginv2 = await remoteDataSource.loginWithPassword(
        username: usernameStr,
        password: passwordStr,
      );
      return Right(loginv2);
    } on AuthException catch (e) {
      return Left(e.map(
        other: (other) => AuthFailure.other(other.message),
        serverError: (_) => const AuthFailure.serverError(),
        invalidEmailAndPasswordCombination: (_) =>
            const AuthFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const AuthFailure.accountLocked(),
        accountExpired: (_) => const AuthFailure.accountExpired(),
      ));
    } on ServerException catch (e) {
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
      } on LocalException catch (e) {
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
        other: (other) => AuthFailure.other(other.message),
        serverError: (_) => const AuthFailure.serverError(),
        invalidEmailAndPasswordCombination: (_) =>
            const AuthFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const AuthFailure.accountLocked(),
        accountExpired: (_) => const AuthFailure.accountExpired(),
      ));
    } on ServerException catch (e) {
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
      } on LocalException catch (e) {
        return Left(AuthFailure.other(e.message));
      }
    }
    try {
      final loginv2 = await remoteDataSource.loginWithOktaToken(
        oktaAccessToken: token,
      );
      return Right(loginv2);
    } on AuthException catch (e) {
      return Left(e.map(
        other: (other) => AuthFailure.other(other.message),
        serverError: (_) => const AuthFailure.serverError(),
        invalidEmailAndPasswordCombination: (_) =>
            const AuthFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const AuthFailure.accountLocked(),
        accountExpired: (_) => const AuthFailure.accountExpired(),
      ));
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  @override
  Future storeJWT({required JWT jwt}) async {
    await tokenStorage.set(JWTDto.fromDomain(jwt));
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
      return token.toDomain().isValid()
          ? const Right(unit)
          : const Left(AuthFailure.tokenExpired());
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
  Future storeCredential({
    required Username username,
    required Password password,
  }) async {
    await credStorage.set(
      CredDto(
        username: username.getOrCrash(),
        password: password.getOrCrash(),
      ),
    );
  }

  @override
  Future deleteCredential() async => await credStorage.delete();

  @override
  Future<Either<AuthFailure, Cred>> loadCredential() async {
    try {
      final credDto = await credStorage.get();
      return Right(credDto.toDomain());
    } on CacheException {
      return const Left(AuthFailure.other(''));
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
}
