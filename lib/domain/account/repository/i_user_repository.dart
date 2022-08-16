import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/error/user_failure.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, User>> getUser();
}
