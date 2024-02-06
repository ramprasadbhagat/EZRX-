import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/error/user_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/setting_tc_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class UserRemoteDataSource {
  HttpService httpService;
  UserQueryMutation userQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  UserRemoteDataSource({
    required this.httpService,
    required this.userQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<User> getUser({required String userId}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation
              .getUserQuery(remoteConfigService.marketPlaceConfig),
          'variables': {'id': userId, 'ignoreCustomerCode': true},
        }),
        apiEndpoint: 'userQuery',
      );
      _userExceptionChecker(res: res);

      return UserDto.fromJson(res.data['data']['user']).toDomain();
    });
  }

  void _userExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode == 404) {
      throw const UserException.userNotFound();
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }

  Future<SettingTc> updateUserTC() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation.updatePrivacyPolicy(),
          'variables': {
            'isAcceptTC': true,
          },
        }),
        apiEndpoint: 'updateAcceptanceStatus',
      );
      _userExceptionChecker(res: res);

      return SettingTcDto.fromJson(res.data['data']).toDomain();
    });
  }

  Future<SettingTc> updateUserMarketPlaceTC(int value) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation.updateMarketPlaceTnCAcceptance(),
          'variables': {'isAcceptMPTC': value},
        }),
        apiEndpoint: 'updateAcceptanceStatus',
      );
      _userExceptionChecker(res: res);

      return SettingTcDto.fromJson(res.data['data']).toDomain();
    });
  }

  Future<User> updateUserNotificationAndLanguagePreference({
    required String languagePreference,
    required bool emailNotification,
    required String userId,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final data = {
          'input': {
            'where': {'id': int.parse(userId)},
            'data': {
              'emailNotifications': emailNotification,
              'languagePreference': languagePreference,
            },
          },
        };

        final res = await httpService.request(
          method: 'POST',
          url: '/api/strapiEngineMutation',
          data: jsonEncode(
            {
              'query': userQueryMutation.updateNotification(),
              'variables': data,
            },
          ),
          apiEndpoint: 'updateUserMutation',
        );
        _userExceptionChecker(res: res);

        return UserDto.fromJson(res.data['data']['updateUser']['user'])
            .toDomain();
      },
    );
  }
}
