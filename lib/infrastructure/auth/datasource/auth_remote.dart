import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AuthRemoteDataSource {
  HttpService httpService;
  AuthQueryMutation authQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AuthRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<Login> loginWithPassword({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}loginV3',
        data: jsonEncode(
          {
            'query': authQueryMutation.getLoginQuery(),
            'variables': {
              'input': {
                'username': username,
                'password': password,
                'mobileToken': {
                  'mobileTokens': [
                    {'token': fcmToken, 'provider': 'firebase'},
                  ],
                },
              },
            },
          },
        ),
      );
      _authExceptionChecker(res: res, jsonKey: 'loginV3');

      return LoginDto.fromJson(res.data['data']['loginV3']).toDomain();
    });
  }

  Future<Login> loginWithOktaToken({
    required String oktaAccessToken,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}loginV3',
        data: jsonEncode(
          {
            'query': authQueryMutation.getLoginQuery(),
            'variables': {
              'input': {
                'isOktaAuthenticated': true,
                'accessToken': oktaAccessToken,
                'mobileToken': {
                  'mobileTokens': [
                    {'token': fcmToken, 'provider': 'firebase'},
                  ],
                },
              },
            },
          },
        ),
      );

      _authExceptionChecker(res: res, jsonKey: 'loginV3');

      return LoginDto.fromJson(res.data['data']['loginV3']).toDomain();
    });
  }

  Future<Login> proxyLoginWithUsername({required String username}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}loginV3',
        data: jsonEncode(
          {
            'query': authQueryMutation.getProxyLoginQuery(),
            'variables': {
              'input': {'username': username},
            },
          },
        ),
      );

      _authExceptionChecker(res: res, jsonKey: 'proxyLoginV3');

      return LoginDto.fromJson(res.data['data']['proxyLoginV3']).toDomain();
    });
  }

  void _authExceptionChecker({
    required Response<dynamic> res,
    required String jsonKey,
  }) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.data['data'][jsonKey]['authenticated'] == false) {
      throw const AuthException.invalidEmailAndPasswordCombination();
    } else if (res.data['data'][jsonKey]['isAccountLocked'] == true) {
      throw const AuthException.accountLocked();
    } else if (res.data['data'][jsonKey]['isAccountExpired'] == true) {
      throw const AuthException.accountExpired();
    }
  }
}
