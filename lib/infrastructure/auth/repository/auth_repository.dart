import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/jwt.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/auth/error/auth_failure.dart';
import 'package:ezrxmobile/domain/auth/login/I_login_service.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/database/i_token_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';

class AuthRepository implements IAuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  // final AuthLocalDataSource localDataSource;
  final ITokenStorage tokenStorage;
  final ILoginService oktaLoginServices;
  // final ICredStorage credStorage;

  AuthRepository({
    required this.remoteDataSource,
    required this.tokenStorage,
    required this.oktaLoginServices,
    // required this.credStorage,
  });

  @override
  Future<Either<AuthFailure, LoginV2>> login({
    required Username username,
    required Password password,
  }) async {
    // if (const String.fromEnvironment('flavor') == 'dev') {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      final loginv2 = await remoteDataSource.login(
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
    // }
    // else {
    //   try {
    //     final jwt = await remoteDataSource.login(
    //       username: username,
    //       password: password,
    //     );
    //     return Right(jwt);
    //   } on LocalException {
    //     return const Left(AuthFailure.invalidEmailAndPasswordCombination());
    //   }
    // }
  }

  @override
  Future storeJWT({required JWT jwt}) async {
    await tokenStorage.set(JWTDto.fromDomain(jwt));
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithOkta() async {
    try {
      final loginv2 = await oktaLoginServices.login();
      print('@@@@ $loginv2');
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(AuthFailure.other(e.message));
    }
  }

  // @override
  // Future storeCredential({
  //   required Username username,
  //   required Password password,
  // }) async {
  //   await credStorage.set(
  //     CredDto(
  //       username: username.getOrCrash(),
  //       password: password.getOrCrash(),
  //     ),
  //   );
  // }

  // @override
  // Future<Either<AuthFailure, Cred>> loadCredential() async {
  //   try {
  //     final credDto = await credStorage.get();
  //     return Right(credDto.toDomain());
  //   } on CacheException {
  //     return const Left(AuthFailure.other(''));
  //   }
  // }
}
