import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/domain/user/error/user_failure.dart';
import 'package:ezrxmobile/domain/user/repository/i_user_repository.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_remote.dart';

class UserRepository implements IUserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepository({
    required this.remoteDataSource,
  });

  @override
  Future<Either<UserFailure, User>> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(UserFailure.other(e.message));
    }
  }
}
