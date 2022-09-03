import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/loginv2_dto.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AuthRemoteDataSource {
  HttpService httpService;
  AuthQueryMutation authQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  AuthRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<LoginV2> loginWithPassword({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/ezrxapi/api/loginAd',
        data: jsonEncode(
          {
            'query': authQueryMutation.getPasswordLoginQuery(
              username,
              password,
              fcmToken,
            ),
          },
        ),
      );
      _authExceptionChecker(res: res, jsonKey: 'loginV2');

      return LoginV2Dto.fromJson(res.data['data']['loginV2']).toDomain();
    });
  }

  Future<LoginV2> loginWithOktaToken({
    required String oktaAccessToken,
    required String fcmToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/ezrxapi/api/loginAd',
        data: jsonEncode(
          {
            'query': authQueryMutation.getOktaTokenLoginQuery(
              oktaAccessToken,
              fcmToken,
            ),
          },
        ),
      );

      _authExceptionChecker(res: res, jsonKey: 'loginV2');

      return LoginV2Dto.fromJson(res.data['data']['loginV2']).toDomain();
    });
  }

  Future<LoginV2> proxyLoginWithUsername({required String username}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/ezrxapi/api/loginAd',
        data: jsonEncode(
          {
            'query': authQueryMutation.getProxyLoginQuery(username),
          },
        ),
      );

      _authExceptionChecker(res: res, jsonKey: 'proxyLoginV2');

      return LoginV2Dto.fromJson(res.data['data']['proxyLoginV2']).toDomain();
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
    } else if (res.data['errors'] != null && res.data['data'] == null) {
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
