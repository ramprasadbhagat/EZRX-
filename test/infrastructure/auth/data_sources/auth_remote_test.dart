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
                  {'message': 'fake-error'}
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
                  {'message': 'fake-error'}
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
            salesOrg: '2001',
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
                  {'message': 'fake-error'}
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
            salesOrg: '2001',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(LoginMock());
          });
        },
      );
    },
  );
}
