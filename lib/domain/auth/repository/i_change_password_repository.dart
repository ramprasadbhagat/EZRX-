import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

abstract class IChangePasswordRepository {
  Future<Either<ApiFailure, ResetPassword>> changePassword({
    required Password newPassword,
    required Password oldPassword,
    required User user,
  });

  Future<Either<ApiFailure, ResetPassword>> resetPassword({
    required Password newPassword,
    required StringValue token,
    required Username username,
  });

  Future<Either<ApiFailure, ResetPassword>> changePasswordForFirstTime({
    required Password newPassword,
  });
}
