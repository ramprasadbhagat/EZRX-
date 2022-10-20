import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/setting_aup.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IUserRepository {
  Future<Either<ApiFailure, User>> getUser();
  Future<Either<ApiFailure, SettingAup>> updateUserAup(User user);
  Future<Either<ApiFailure, SettingTc>> updateUserTc(User user);
  Future<Either<ApiFailure, User>> updateNotificationSettings(User user);
}
