import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_user_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:flutter/foundation.dart';

class UserRepository implements IUserRepository {
  final Config config;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final FirebaseAnalyticsService firebaseAnalyticsService;
  final FirebaseCrashlyticsService firebaseCrashlyticsService;
  final TokenStorage tokenStorage;
  final MixpanelService mixpanelService;

  UserRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.firebaseAnalyticsService,
    required this.firebaseCrashlyticsService,
    required this.tokenStorage,
    required this.mixpanelService,
  });

  @override
  Future<Either<ApiFailure, User>> getUser() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final user = await localDataSource.getUser();

        return Right(user);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final token = await tokenStorage.get();
      final user =
          await remoteDataSource.getUser(userId: token.toDomain().userId);
      await firebaseAnalyticsService.analytics.setUserId(id: user.id);
      // await firebaseAnalyticsService.analytics.setUserProperty(
      //   name: user.username.getOrCrash(),
      //   value: user.email.getOrCrash(),
      // );

      mixpanelService.setUser(
        firstName: user.fullName.firstName,
        lastName: user.fullName.lastName,
        username: user.username.getOrDefaultValue(''),
        email: user.email.getOrDefaultValue(''),
        role: user.role.name,
      );

      if (!kIsWeb) {
        await firebaseCrashlyticsService.crashlytics.setUserIdentifier(user.id);
      }

      return Right(user);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, SettingTc>> updateUserTc(
    User userDetails, {
    required String date,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final settingTc = await localDataSource.updateUserTC();

        return Right(settingTc);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final settingTc = await remoteDataSource.updateUserTC(
        userId: userDetails.id,
        date: date,
      );

      return Right(settingTc);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, User>> updateNotificationSettings(
    User userDetails,
  ) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final user =
            await localDataSource.updateUserNotificationAndLanguagePreference();

        return Right(user);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    } else {
      try {
        final user =
            await remoteDataSource.updateUserNotificationAndLanguagePreference(
          languagePreference: userDetails.settings.languagePreference,
          emailNotification: userDetails.settings.emailNotifications,
          userId: userDetails.id,
        );

        return Right(user);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }
}
