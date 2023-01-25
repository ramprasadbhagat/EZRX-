import 'dart:convert';
import 'package:universal_io/io.dart';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/is_approver_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_remote.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class IsApproverDtoMock extends Mock implements IsApproverDto {}

void main() {
  late ApproverRemoteDataSource remoteDataSource;
  late User mockUser;
  late Config mockConfig;
  late IsApproverDto isApproverDtoMock;

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
    remoteDataSource = ApproverRemoteDataSource(
      config: mockConfig,
      httpService: service,
      approverQueryMutation: ApproverQueryMutation(),
      dataSourceExceptionHandler: DataSourceExceptionHandler(),
    );
    mockUser = User.empty().copyWith(
      username: Username('mockUserName'),
    );
    isApproverDtoMock = IsApproverDtoMock();
  });

  group('Approver remote test', () {
    test('Fetch success', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/getIsApproverResponse.json'),
      );

      final request = {
        'username': mockUser.username.getOrCrash(),
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
          'query': remoteDataSource.approverQueryMutation.getIsApprover(),
          'variables': {
            'request': request,
          },
        }),
      );

      final result = await remoteDataSource.fetch(
        username: mockUser.username.getOrCrash(),
      );

      expect(result, IsApproverDto.fromJson(res['data']['isApprover']));
    });

    test('Fetch failed', () async {
      final res = {
        'data': null,
        'errors': [
          {'message': 'fake-error'}
        ],
      };

      final request = {
        'username': mockUser.username.getOrCrash(),
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
          'query': remoteDataSource.approverQueryMutation.getIsApprover(),
          'variables': {
            'request': request,
          },
        }),
      );

      await remoteDataSource
          .fetch(username: mockUser.username.getOrCrash())
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(isApproverDtoMock);
      });
    });

    test('Fetch failed with status code != 200', () async {
      final res = {
        'data': {},
      };

      final request = {
        'username': mockUser.username.getOrCrash(),
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
          'query': remoteDataSource.approverQueryMutation.getIsApprover(),
          'variables': {
            'request': request,
          },
        }),
      );

      await remoteDataSource
          .fetch(username: mockUser.username.getOrCrash())
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(isApproverDtoMock);
      });
    });
  });
}
