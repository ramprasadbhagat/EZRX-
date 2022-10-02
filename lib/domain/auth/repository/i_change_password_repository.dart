import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_entities.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IChangePasswordRepository {
  Future<Either<ApiFailure, ResetPasswordEntities>> setPassword({
    required Password newPassword,
    required Password oldPassword,
    required Username userName,
  });
}
