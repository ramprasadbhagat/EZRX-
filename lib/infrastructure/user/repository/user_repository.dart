import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/domain/user/error/user_failure.dart';
import 'package:ezrxmobile/domain/user/repository/i_user_repository.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_remote.dart';

class UserRepository implements IUserRepository {
  final Config config;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
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
      return Right(user);
    } on ServerException catch (e) {
      return Left(UserFailure.other(e.message));
    }
  }
}
