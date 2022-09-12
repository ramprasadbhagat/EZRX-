import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAuthRepository {
  Future<Either<ApiFailure, LoginV2>> login({
    required Username username,
    required Password password,
    // required String fcmToken, // not a good design fcm will expired
  });
  Future<Either<ApiFailure, LoginV2>> getEZRXJWT(JWT oktaAccessToken);
  Future<Either<ApiFailure, Unit>> storeJWT({required JWT jwt});
  Future<Either<ApiFailure, Unit>> initTokenStorage();
  Future<Either<ApiFailure, Unit>> initOkta();
  Future<Either<ApiFailure, Unit>> tokenValid();
  Future<Either<ApiFailure, Unit>> loginWithOkta();
  Future<Either<ApiFailure, JWT>> getOktaAccessToken();
  Future<Either<ApiFailure, Unit>> logout();
  Future<Either<ApiFailure, Unit>> initCredStorage();
  Future<Either<ApiFailure, Unit>> storeCredential({
    required Username username,
    required Password password,
  });
  Future<Either<ApiFailure, Unit>> deleteCredential();
  Future<Either<ApiFailure, Cred>> loadCredential();
  Future<Either<ApiFailure, LoginV2>> proxyLogin({required Username username});
}
