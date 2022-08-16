import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/loginv2_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AuthRemoteDataSource {
  HttpService httpService;
  AuthQueryMutation authQueryMutation;
  AuthRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
  });

  Future<LoginV2> loginWithPassword({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final res = await httpService.request(
        method: 'POST',
        url: '/ezrxapi/api/loginAd',
        data: jsonEncode(
          {
            'query': authQueryMutation.passwordLoginData(
              username,
              password,
              fcmToken,
            )
          },
        ),
      );
      if (res.statusCode != 200) {
        throw const AuthException.serverError();
      } else if (res.data['errors'] != null && res.data['data'] == null) {
        throw AuthException.other(res.data['errors'][0]['message']);
      } else if (res.data['data']['loginV2']['authenticated'] == false) {
        throw const AuthException.invalidEmailAndPasswordCombination();
      } else if (res.data['data']['loginV2']['isAccountLocked'] == true) {
        throw const AuthException.accountLocked();
      } else if (res.data['data']['loginV2']['isAccountExpired'] == true) {
        throw const AuthException.accountExpired();
      }
      return LoginV2Dto.fromJson(res.data['data']['loginV2']).toDomain();
    } catch (e) {
      throw const AuthException.serverError();
    }
  }

  Future<LoginV2> loginWithOktaToken({
    required String oktaAccessToken,
    required String fcmToken,
  }) async {
    try {
      final res = await httpService.request(
        method: 'POST',
        url: '/ezrxapi/api/loginAd',
        data: jsonEncode(
          {
            'query': authQueryMutation.oktaTokenLoginData(
              oktaAccessToken,
              fcmToken,
            )
          },
        ),
      );

      if (res.statusCode != 200) {
        throw const AuthException.serverError();
      } else if (res.data['errors'] != null && res.data['data'] == null) {
        throw AuthException.other(res.data['errors'][0]['message']);
      } else if (res.data['data']['loginV2']['authenticated'] == false) {
        throw const AuthException.invalidEmailAndPasswordCombination();
      } else if (res.data['data']['loginV2']['isAccountLocked'] == true) {
        throw const AuthException.accountLocked();
      } else if (res.data['data']['loginV2']['isAccountExpired'] == true) {
        throw const AuthException.accountExpired();
      }

      return LoginV2Dto.fromJson(res.data['data']['loginV2']).toDomain();
    } catch (e) {
      throw const AuthException.serverError();
    }
  }

  Future<LoginV2> proxyLoginWithUsername({required String username}) async {
    final res = await httpService.request(
      method: 'POST',
      url: '/ezrxapi/api/loginAd',
      data: jsonEncode({'query': authQueryMutation.proxyLoginData(username)}),
    );

    if (res.statusCode != 200) {
      throw const AuthException.serverError();
    } else if (res.data['errors'] != null && res.data['data'] == null) {
      throw AuthException.other(res.data['errors'][0]['message']);
    } else if (res.data['data']['proxyLoginV2']['authenticated'] == false) {
      throw const AuthException.invalidEmailAndPasswordCombination();
    } else if (res.data['data']['proxyLoginV2']['isAccountLocked'] == true) {
      throw const AuthException.accountLocked();
    } else if (res.data['data']['proxyLoginV2']['isAccountExpired'] == true) {
      throw const AuthException.accountExpired();
    }

    return LoginV2Dto.fromJson(res.data['data']['proxyLoginV2']).toDomain();
  }
}
