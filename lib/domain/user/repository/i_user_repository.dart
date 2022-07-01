import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/domain/user/error/user_failure.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, User>> getUser();
}
