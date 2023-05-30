import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsCustomerDocumentHeaderrMock extends Mock
    implements CustomerDocumentHeader {}

void main() {
  late AllCreditsAndInvoicesRemoteDataSource remoteDataSource;
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
      remoteDataSource = AllCreditsAndInvoicesRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        allCreditsAndInvoicesQueryMutation:
            AllCreditsAndInvoicesQueryMutation(),
      );
    },
  );

  group(
    'All Credits Remote Data Test',
    () {
      test('=> getAllCredits with status code 200', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/customerDocumentHeaderResponse.json'),
        );

        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getCustomerDocumentHeaderQuery(),
          'variables': {
            'input': {
              'customerCode': 'mock_soldTo',
              'salesOrg': 'mock_salesOrg',
              'first': 1,
              'after': 0,
              'excelFor': 'Credit',
              'orderBy': [],
              'filterBy': [],
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await remoteDataSource.getAllCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offSet: 0,
            filterQuery: []);

        expect(
          result,
          CustomerDocumentHeaderDto.fromJson(
            res['data']['customerDocumentHeader'],
          ).toDomain(),
        );
      });

      test('=> getAllCredits status code not 200', () async {
        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getCustomerDocumentHeaderQuery(),
          'variables': {
            'input': {
              'customerCode': 'mock_soldTo',
              'salesOrg': 'mock_salesOrg',
              'first': 1,
              'after': 0,
              'excelFor': 'Credit',
              'orderBy': [],
              'filterBy': [],
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await remoteDataSource.getAllCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offSet: 0,
            filterQuery: []).onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(CustomerDocumentHeader.empty());
        });
      });

      test('=> getAllCredits with error', () async {
        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getCustomerDocumentHeaderQuery(),
          'variables': {
            'input': {
              'customerCode': 'mock_soldTo',
              'salesOrg': 'mock_salesOrg',
              'first': 1,
              'after': 0,
              'excelFor': 'Credit',
              'orderBy': [],
              'filterBy': [],
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
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

        await remoteDataSource.getAllCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offSet: 0,
            filterQuery: []).onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(CustomerDocumentHeader.empty());
        });
      });
    },
  );
}
