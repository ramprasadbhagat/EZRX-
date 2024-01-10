import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/soa_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class SoaMock extends Mock implements Soa {}

class PaymentSummaryQueryMock extends Mock implements PaymentSummaryQuery {}

void main() {
  late SoaRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);
  final data = jsonEncode(
    {
      'customer_code': '26010030082707',
    },
  );
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = SoaRemoteDataSource(
      httpService: service,
      config: Config(),
    );
  });
  group('SOA remote data source test', () {
    test('Get Soa', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/listSoaResponse.json'),
      );

      dioAdapter.onPost(
        '/api/payment/listSoa',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: data,
      );

      final result = await remoteDataSource.getSoa(
        '26010030082707',
      );

      expect(
        result,
        List.from(res['data'])
            .map((e) => SoaDto.fromJson(e).toDomain())
            .toList(),
      );
    });
    test('statuscode not equal to 200', () async {
      dioAdapter.onPost(
        '/api/payment/listSoa',
        (server) => server.reply(
          205,
          {'data': []},
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: data,
      );

      await remoteDataSource
          .getSoa(
        '26010030082707',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value([SoaMock()]);
      });
    });

    test('response with error', () async {
      dioAdapter.onPost(
        '/api/payment/listSoa',
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
        data: data,
      );

      await remoteDataSource
          .getSoa(
        '26010030082707',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value([SoaMock()]);
      });
    });
    test('response with others error', () async {
      dioAdapter.onPost(
        '/api/payment/listSoa',
        (other) => other.reply(
          200,
          {'data': []},
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: data,
      );

      await remoteDataSource
          .getSoa(
        '26010030082707',
      )
          .onError((error, _) async {
        expect(error, isA<OtherException>());
        return Future.value([SoaMock()]);
      });
    });
  });
}
