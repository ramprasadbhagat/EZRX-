import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/domain/user/error/user_failure.dart';
import 'package:ezrxmobile/domain/user/repository/i_user_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_remote.dart';

class UserRepository implements IUserRepository {
  final Config config;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final FirebaseAnalyticsService firebaseAnalyticsService;
  final FirebaseCrashlyticsService firebaseCrashlyticsService;

  UserRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.firebaseAnalyticsService,
    required this.firebaseCrashlyticsService,
  });

  @override
  Future<Either<UserFailure, User>> getUser() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final user = await localDataSource.getUser();
        return Right(user);
      } on LocalException catch (e) {
        return Left(UserFailure.other(e.message));
      }
    }
    try {
      final user = await remoteDataSource.getUser();
      await firebaseAnalyticsService.analytics.setUserId(id: user.id);
      await firebaseAnalyticsService.analytics.setUserProperty(
        name: user.username.getOrCrash(),
        value: user.email.getOrCrash(),
      );
      await firebaseCrashlyticsService.crashlytics.setUserIdentifier(user.id);
      return Right(user);
    } on ServerException catch (e) {
      return Left(UserFailure.other(e.message));
    }
  }
}
