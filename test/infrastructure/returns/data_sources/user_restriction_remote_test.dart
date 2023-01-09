import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../presentation/account/account_tab_test.dart';

class UserRestrictionListDtoMock extends Mock
    implements UserRestrictionListDto {}

void main() {
  late String salesOrg;
  late Config mockConfig;
  late UserRestrictionRemoteDataSource remoteDataSource;
  late UserRestrictionListDto userRestrictionListDtoMock;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockConfig = Config()..appFlavor = Flavor.uat;
    locator.registerSingleton<Config>(mockConfig);
    remoteDataSource = UserRestrictionRemoteDataSource(
      config: mockConfig,
      httpService: service,
      userRestrictionMutation: UserRestrictionMutation(),
      dataSourceExceptionHandler: DataSourceExceptionHandler(),
    );
    salesOrg = '2601';
    userRestrictionListDtoMock = UserRestrictionListDtoMock();
  });

  group('User restriction remote test', () {
    test('fetch list success', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
      );

      final request = {
        'salesOrg': salesOrg,
      };

      dioAdapter.onPost(
        '${mockConfig.urlConstants}ereturn',
        (server) => server.reply(
          HttpStatus.ok,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.userRestrictionMutation.getApproverRights(),
          'variables': {
            'request': request,
          },
        }),
      );

      final result = await remoteDataSource.fetch(salesOrg: salesOrg);

      expect(
        result,
        UserRestrictionListDto.fromJson(res['data']['approverRights']),
      );
    });
  });

  test('Fetch list failed', () async {
    final res = {
      'data': null,
      'errors': [
        {'message': 'fake-error'}
      ],
    };

    final request = {
      'salesOrg': salesOrg,
    };

    dioAdapter.onPost(
      '${mockConfig.urlConstants}ereturn',
      (server) => server.reply(
        HttpStatus.ok,
        res,
        delay: const Duration(seconds: 1),
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      data: jsonEncode({
        'query': remoteDataSource.userRestrictionMutation.getApproverRights(),
        'variables': {
          'request': request,
        },
      }),
    );

    await remoteDataSource.fetch(salesOrg: salesOrg).onError((error, _) async {
      expect(error, isA<ServerException>());
      return Future.value(userRestrictionListDtoMock);
    });
  });

  test('Fetch list failed with status code != 200', () async {
    final res = {
      'data': {},
    };

    final request = {
      'salesOrg': salesOrg,
    };

    dioAdapter.onPost(
      '${mockConfig.urlConstants}ereturn',
      (server) => server.reply(
        HttpStatus.noContent,
        res,
        delay: const Duration(seconds: 1),
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      data: jsonEncode({
        'query': remoteDataSource.userRestrictionMutation.getApproverRights(),
        'variables': {
          'request': request,
        },
      }),
    );

    await remoteDataSource.fetch(salesOrg: salesOrg).onError((error, _) async {
      expect(error, isA<ServerException>());
      return Future.value(userRestrictionListDtoMock);
    });
  });
}
