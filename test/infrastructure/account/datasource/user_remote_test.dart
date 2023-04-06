import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/setting_tc_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class UserMock extends Mock implements User {}

void main() {
  late UserRemoteDataSource remoteDataSource;
  late String saleOrgName;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = UserRemoteDataSource(
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        userQueryMutation: UserQueryMutation(),
      );
      saleOrgName = '2601';
    },
  );

  group('User remote', () {
    test(
      'Get user',
      () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/userResponse.json'),
        );

        dioAdapter.onPost(
          '/api/strapiEngine',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.getUserQuery(),
            'variables': {'id': saleOrgName},
          }),
        );
        final result = await remoteDataSource.getUser(userId: saleOrgName);
        final resTest = UserDto.fromJson(res['data']['user']).toDomain();
        expect(result.fullName, resTest.fullName);
      },
    );
    test(
      'Get user server exception',
      () async {
        dioAdapter.onPost(
          '/api/strapiEngine',
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
            'query': remoteDataSource.userQueryMutation.getUserQuery(),
            'variables': {'id': saleOrgName},
          }),
        );
        await remoteDataSource
            .getUser(userId: saleOrgName)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(User.empty());
        });
      },
    );
    test(
      'Status code != 200',
      () async {
        dioAdapter.onPost(
          '/api/strapiEngine',
          (server) => server.reply(
            201,
            {
              'data': null,
              'errors': null,
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.getUserQuery(),
            'variables': {'id': saleOrgName},
          }),
        );
        await remoteDataSource
            .getUser(userId: saleOrgName)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(User.empty());
        });
      },
    );
    // test(
    //   'Status code = 404',
    //   () async {
    //     dioAdapter.onPost(
    //       '/api/strapiEngine',
    //       (server) => server.reply(
    //         404,
    //         {
    //           'data': null,
    //           'errors': null,
    //         },
    //         delay: const Duration(seconds: 1),
    //       ),
    //       headers: {'Content-Type': 'application/json; charset=utf-8'},
    //       data: jsonEncode({
    //         'query': remoteDataSource.userQueryMutation.getUserQuery(),
    //         'variables': {'id': saleOrgName},
    //       }),
    //     );
    //     await remoteDataSource
    //         .getUser(userId: saleOrgName)
    //         .onError((error, _) async {
    //       expect(error, isA<UserException>userNotFound() );
    //       return Future.value(User.empty());
    //     });
    //   },
    // );

    test(
      'update TC',
      () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/tncdateUpdateResponse.json'),
        );
        final date = DateTime.now().toUtc().toIso8601String();
        final data = {
          'input': {
            'where': {'id': int.parse(saleOrgName)},
            'data': {
              'acceptPrivacyPolicy': true,
              'acceptPrivacyPolicyTime': date, // '2022-12-27T09:37:45.843154Z',
              'privacyPolicyAcceptedPlatform': 'Mobile',
            },
          },
        };

        dioAdapter.onPost(
          '/api/strapiEngine',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.updatePrivacyPolicy(),
            'variables': data,
          }),
        );
        final result = await remoteDataSource.updateUserTC(
          userId: saleOrgName,
          date: date, //DateTime.now().toUtc().toIso8601String(),
        );
        final resTest = SettingTcDto.fromJson(res['data']['updateUser']['user']).toDomain();
        expect(result.acceptPrivacyPolicy, resTest.acceptPrivacyPolicy);
      },
    );
    test(
      'get announcement',
      () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/tncdateUpdateResponse.json'),
        );

        dioAdapter.onPost(
          '/api/strapiEngine',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.getAnnouncementsQuery(),
          }),
        );
      },
    );
    test(
      'update notification',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/updateUserNotificationAndLanguagePreferenceResponse.json',
          ),
        );
        final data = {
          'input': {
            'where': {'id': 2601},
            'data': {
              'emailNotifications': false,
              'languagePreference': '',
            },
          },
        };

        dioAdapter.onPost(
          '/api/strapiEngineMutation',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.userQueryMutation.updateNotification(),
            'variables': data
          }),
        );

        final result =
            await remoteDataSource.updateUserNotificationAndLanguagePreference(
          languagePreference: '',
          emailNotification: false,
          userId: '2601',
        );

        final resTest =
            UserDto.fromJson(res['data']['updateUser']['user']).toDomain();
        expect(result.fullName, resTest.fullName);
      },
    );
  });
}
