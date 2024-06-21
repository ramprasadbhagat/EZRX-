import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
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
        url: '${config.urlConstants}license',
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
      _authExceptionChecker(res: res, jsonKey: 'loginV4');

      return LoginDto.fromJson(res.data['data']['loginV4']).toDomain();
    });
  }

  Future<Login> loginWithOktaToken({
    required String oktaAccessToken,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
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

      _authExceptionChecker(res: res, jsonKey: 'loginV4');

      return LoginDto.fromJson(res.data['data']['loginV4']).toDomain();
    });
  }

  Future<Login> proxyLoginWithUsername({required String username}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.getProxyLoginQuery(),
            'variables': {
              'request': {
                'username': username,
              },
            },
          },
        ),
      );

      _authExceptionChecker(
        res: res,
        jsonKey: 'proxyLoginV3',
        isProxyLogin: true,
      );

      return LoginDto.fromJson(res.data['data']['proxyLoginV3']).toDomain();
    });
  }

  Future<Login> getAccessToken({
    required String refreshToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}regenerateToken',
        data: jsonEncode(
          {
            'query': authQueryMutation.getAccessToken(),
            'variables': {
              'eZRxRefreshToken': refreshToken,
            },
          },
        ),
      );

      _authExceptionChecker(res: res, jsonKey: 'getAccessToken');

      return LoginDto.fromJson(res.data['data']['getAccessToken']).toDomain();
    });
  }

  void _authExceptionChecker({
    required Response<dynamic> res,
    required String jsonKey,
    bool isProxyLogin = false,
  }) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }

    if (dataSourceExceptionHandler.isServerResponseError(res: res)) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }

    final jsonData = res.data['data'][jsonKey];

    if (jsonData['authenticated'] == false) {
      throw isProxyLogin
          ? const AuthException.accountBlocked()
          : const AuthException.invalidEmailAndPasswordCombination();
    }

    if (jsonData['isAccountLocked'] == true) {
      throw const AuthException.accountLocked();
    }

    if (jsonData['isAccountExpired'] == true) {
      throw const AuthException.accountExpired();
    }
  }
}
