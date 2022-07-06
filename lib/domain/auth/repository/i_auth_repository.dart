import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/jwt.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_failure.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, LoginV2>> login({
    required Username username,
    required Password password,
    // required String fcmToken, // not a good design fcm will expired
  });
  Future storeJWT({required JWT jwt});
  Future<Either<AuthFailure, Unit>> initOkta();
  Future<Either<AuthFailure, Unit>> loginWithOkta();
  Future<Either<AuthFailure, Unit>> getOktaAccessToken();
  Future<Either<AuthFailure, Unit>> logoutWithOkta();
  // Future storeCredential({
  //   required Username username,
  //   required Password password,
  // });
  // Future<Either<AuthFailure, Cred>> loadCredential();
  // Future<Either<AuthFailure, JWT>> proxyLogin({
  //   required Username username,
  // });
  // void logout();
  // Future<Either<Failure, List<BusStop>>> resetPassword({
  //   LatLng? currentPosition,
  // });
}
