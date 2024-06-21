import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class LoginMock extends Mock implements Login {}

void main() {
  late AuthRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com',
    ),
  );
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: const UrlRequestMatcher(),
  );
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AuthRemoteDataSource(
        httpService: service,
        authQueryMutation: AuthQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: Config(),
      );
    },
  );
  group(
    'Login Remote Test',
    () {
      test(
        'Login with password success',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/loginAdResponse.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getLoginQuery(),
            }),
          );

          final result = await remoteDataSource.loginWithPassword(
            username: 'username',
            password: 'password',
            fcmToken: 'fcmToken',
          );

          expect(
            result,
            LoginDto.fromJson(res['data']['loginV4']).toDomain(),
          );
        },
      );

      test(
        'Login with password error',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getLoginQuery(),
            }),
          );

          await remoteDataSource
              .loginWithPassword(
            username: 'username',
            password: 'password',
            fcmToken: 'fcmToken',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(LoginMock());
          });
        },
      );

      test(
        'Login with password error with status code != 200',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getLoginQuery(),
            }),
          );

          await remoteDataSource
              .loginWithPassword(
            username: 'username',
            password: 'password',
            fcmToken: 'fcmToken',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(LoginMock());
          });
        },
      );

      test(
        'Login with password success with authenticate = false',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/loginAdResponseFailAuthenticate.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getLoginQuery(),
            }),
          );

          await remoteDataSource
              .loginWithPassword(
            username: 'username',
            password: 'password',
            fcmToken: 'fcmToken',
          )
              .onError((error, _) async {
            expect(error, isA<AuthException>());
            return Future.value(LoginMock());
          });
        },
      );

      test(
        'Login with Okta success',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/loginAdResponse.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getLoginQuery(),
            }),
          );

          final result = await remoteDataSource.loginWithOktaToken(
            oktaAccessToken: 'oktaAccessToken',
            fcmToken: 'fcmToken',
          );

          expect(
            result,
            LoginDto.fromJson(res['data']['loginV4']).toDomain(),
          );
        },
      );

      test(
        'Login with Okta error',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getLoginQuery(),
            }),
          );

          await remoteDataSource
              .loginWithOktaToken(
            oktaAccessToken: 'oktaAccessToken',
            fcmToken: 'fcmToken',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(LoginMock());
          });
        },
      );

      test(
        'Proxy Login With Username success',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/proxyLoginResponse.json'),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getProxyLoginQuery(),
            }),
          );

          final result = await remoteDataSource.proxyLoginWithUsername(
            username: 'username',
          );

          expect(
            result,
            LoginDto.fromJson(res['data']['proxyLoginV3']).toDomain(),
          );
        },
      );

      test(
        'Proxy Login With Username error',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getProxyLoginQuery(),
            }),
          );

          await remoteDataSource
              .proxyLoginWithUsername(
            username: 'username',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(LoginMock());
          });
        },
      );

      test(
        'Proxy Login With Username error when the authenticated is coming as false',
        () async {
          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': {
                  'proxyLoginV3': {
                    'userID': 7307,
                    'authenticated': false,
                    'eZRxJWT':
                        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJadWVsbGlnIFBoYXJtYSIsInN1YiI6IkFjY2VzcyBUb2tlbiIsImV4cCI6MTY5MDQ2NjgyOCwiaWF0IjoxNjkwNDYzMjI4LCJpZCI6NzMwNywicm9sZSI6IkNsaWVudCBBZG1pbiIsInVzZXJuYW1lIjoidGVzdGNsaWVudGFkbWluIiwicmlnaHRzIjpbeyJ2YWx1ZSI6W3sic2hpcFRvQ29kZSI6WyIwMDcwMTQ5ODYzIiwiMDA3MDE0OTg2NCJdLCJjdXN0b21lckNvZGUiOiIwMDMwMDgyNzA3Iiwic2FsZXNPcmciOiIyMDAxIn1dfV0sInNhbGVzT3JncyI6WyIyMDAxIl19.j39coMdr1V5cUBeCMU6C5ReoiDOdFvRFug_tATv1Jag',
                    'email': '',
                    'userMobileToken': {
                      'firstName': 'testclientadmin',
                      'lastName': 'testclientadmin',
                      'mobileTokens': [],
                      'mobileNotifications': false,
                    },
                    'passwordLastReset': '',
                    'passwordExpiry': '',
                    'isAccountLocked': false,
                    'isAccountExpired': false,
                  },
                },
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.authQueryMutation.getProxyLoginQuery(),
            }),
          );

          await remoteDataSource
              .proxyLoginWithUsername(
            username: 'username',
          )
              .onError((error, _) async {
            expect(error, isA<AuthException>());
            return Future.value(LoginMock());
          });
        },
      );
    },
  );
}
