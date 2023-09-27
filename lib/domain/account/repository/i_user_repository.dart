import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IUserRepository {
  Future<Either<ApiFailure, User>> getUser();
  Future<Either<ApiFailure, SettingTc>> updateUserTc();
  Future<Either<ApiFailure, User>> updateNotificationSettings(User user);
  Future<Either<ApiFailure, UpdateLanguageResponse>> updateLanguage({
    required Locale language,
  });
}
