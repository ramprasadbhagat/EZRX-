import 'dart:convert';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_status_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:universal_io/io.dart';

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
        {'message': 'fake-error'},
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

  test('get user restrictions', () async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/getReturnApprovalAndApproverRights.json'),
    );

    final request = {
      'request': {
        'salesOrg': salesOrg,
        'username': 'fake-username',
      },
      'approverRequest': {
        'salesOrg': salesOrg,
        'username': 'fake-username',
      },
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
        'query': remoteDataSource.userRestrictionMutation.getUserRestrictions(),
        'variables': request,
      }),
    );

    final result = await remoteDataSource.getUserRestrictions(
      salesOrg: salesOrg,
      userName: 'fake-username',
    );

    expect(
      result,
      UserRestrictionsDto.fromJson(res['data']).toDomain(),
    );
  });

  test('add approval limit', () async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/getAddUserRestrictionDetails.json'),
    );

    final request = {
      'request': {
        'username': 'fake-username',
        'salesOrg': salesOrg,
        'valueLowerLimit': 0,
        'valueUpperLimit': 10,
      },
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
        'query': remoteDataSource.userRestrictionMutation.addApprovalLimit(),
        'variables': request,
      }),
    );

    final result = await remoteDataSource.addApprovalLimit(
      salesOrg: salesOrg,
      userName: 'fake-username',
      valueLowerLimit: 0,
      valueUpperLimit: 10,
    );

    expect(
      result,
      UserRestrictionStatusDto.fromJson(res['data']).toDomain(),
    );
  });

  test('add user restriction', () async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/getConfigureUserRestrictionDetails.json'),
    );

    final request = {
      'username': 'fake-username',
      'approverRights': [],
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
        'query': remoteDataSource.userRestrictionMutation.addRestriction(),
        'variables': {'input': request},
      }),
    );

    final result = await remoteDataSource.configureUserRestriction(
      userName: 'fake-username',
      approverRightsList: [],
    );

    expect(
      result,
      UserRestrictionStatusDto.fromJson(res['data']).toDomain(),
    );
  });

  test('delete approver right', () async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/getDeleteUserRestriction.json'),
    );

    final request = {
      'uuid': 'uuid',
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
        'query': remoteDataSource.userRestrictionMutation.deleteApprovalRight(),
        'variables': {'input': request},
      }),
    );

    final result = await remoteDataSource.deleteApprovalRight(
      salesOrg: salesOrg,
      uuid: 'uuid',
    );

    expect(
      result,
      UserRestrictionStatusDto.fromJson(res['data']).toDomain(),
    );
  });

  test('delete approval limit', () async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/getDeleteReturnApprovalLimit.json'),
    );

    final request = {
      'uuid': 'uuid',
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
        'query': remoteDataSource.userRestrictionMutation.deleteApprovalLimit(),
        'variables': {'input': request},
      }),
    );

    final result = await remoteDataSource.deleteApprovalLimit(uuid: 'uuid');

    expect(
      result,
      UserRestrictionStatusDto.fromJson(res['data']).toDomain(),
    );
  });
}
