import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/account/error/user_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../presentation/home/home_tab_test.dart';

void main() {
  group('UserRemoteDataSource should - ', () {
    late UserRemoteDataSource userRemote;
    late HttpService httpService;
    late UserQueryMutation userQueryMutation;
    late DataSourceExceptionHandler dataSourceExceptionHandler;

    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      httpService = MockHTTPService();
      userQueryMutation = UserQueryMutation();
      dataSourceExceptionHandler = DataSourceExceptionHandler();
      userRemote = UserRemoteDataSource(
        httpService: httpService,
        userQueryMutation: userQueryMutation,
        dataSourceExceptionHandler: dataSourceExceptionHandler,
      );
    });
    test('getUser with valid response', () async {
      when(
        () => httpService.request(
            method: 'POST',
            url: '/api/strapiEngine',
            data: jsonEncode({
              'query': userQueryMutation.getUserQuery(),
              'variables': {'id': '276'},
            }),
            apiEndpoint: 'userQuery'),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: jsonDecode(
              await rootBundle.loadString('assets/json/userResponse.json')),
          requestOptions: RequestOptions(
            path: '/api/strapiEngine',
          ),
        ),
      );
      final user = await userRemote.getUser(userId: '276');

      expect(user.id, '276');
    });

    test('getUser with server exception response', () async {
      when(
        () => httpService.request(
            method: 'POST',
            url: '/api/strapiEngine',
            data: jsonEncode({
              'query': userQueryMutation.getUserQuery(),
              'variables': {'id': '276'},
            }),
            apiEndpoint: 'userQuery'),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: {
            'errors': [
              {'message': 'mockError'}
            ]
          },
          requestOptions: RequestOptions(
            path: '/api/strapiEngine',
          ),
        ),
      );
      expect(() async => userRemote.getUser(userId: '276'),
          throwsA(isA<ServerException>()));
    });

    test('getUser with 404 exception response', () async {
      when(
        () => httpService.request(
            method: 'POST',
            url: '/api/strapiEngine',
            data: jsonEncode({
              'query': userQueryMutation.getUserQuery(),
              'variables': {'id': '276'},
            }),
            apiEndpoint: 'userQuery'),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 404,
          data: jsonDecode(
              await rootBundle.loadString('assets/json/userResponse.json')),
          requestOptions: RequestOptions(
            path: '/api/strapiEngine',
          ),
        ),
      );
      expect(() async => userRemote.getUser(userId: '276'),
          throwsA(isA<UserException>()));
    });

    test('getUser with 401 exception response', () async {
      when(
        () => httpService.request(
            method: 'POST',
            url: '/api/strapiEngine',
            data: jsonEncode({
              'query': userQueryMutation.getUserQuery(),
              'variables': {'id': '276'},
            }),
            apiEndpoint: 'userQuery'),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 401,
          data: jsonDecode(
              await rootBundle.loadString('assets/json/userResponse.json')),
          requestOptions: RequestOptions(
            path: '/api/strapiEngine',
          ),
        ),
      );
      expect(() async => userRemote.getUser(userId: '276'),
          throwsA(isA<ServerException>()));
    });

    test('updateUserTC with valid response', () async {
      when(
        () => httpService.request(
            method: 'POST',
            url: '/api/strapiEngine',
            data: any(named: 'data'),
            apiEndpoint: 'updateUserMutation'),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: {
            'data': {
              'updateUser': {
                'user': {
                  'id': '276',
                  'privacyPolicyAcceptedPlatform': 'mobile',
                  'acceptPrivacyPolicy': true,
                }
              }
            }
          },
          requestOptions: RequestOptions(
            path: '/api/strapiEngine',
          ),
        ),
      );
      final settingTc = await userRemote.updateUserTC(userId: '276');

      expect(settingTc.privacyPolicyAcceptedPlatform, 'mobile');
      expect(settingTc.acceptPrivacyPolicy, true);
    });

    test('updateUserNotificationAndLanguagePreference with valid response',
        () async {
      when(
        () => httpService.request(
            method: 'POST',
            url: '/api/strapiEngineMutation',
            data: any(named: 'data'),
            apiEndpoint: 'updateUserMutation'),
      ).thenAnswer(
        (invocation) async => Response(
          statusCode: 200,
          data: json.decode(
            await rootBundle.loadString(
              'assets/json/updateUserNotificationAndLanguagePreferenceResponse.json',
            ),
          ),
          requestOptions: RequestOptions(
            path: '/api/strapiEngine',
          ),
        ),
      );
      final user = await userRemote.updateUserNotificationAndLanguagePreference(
        languagePreference: 'en',
        emailNotification: true,
        userId: '276',
      );

      expect(user.username.getOrCrash(), 'ezrxtest05');
    });
  });
}
