import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late AllCreditsAndInvoicesRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
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
      test('=> filterCredits with status code 200', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/customerDocumentHeaderV2Response.json'),
        );

        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getDocumentHeaderListQuery(),
          'variables': {
            'input': {
              'customerCode': '0000100120',
              'salesOrg': '2001',
              'first': 1,
              'after': 0,
              'excelFor': 'Credit',
              // 'orderBy': [],
              // 'filterBy': [],
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

        final result = await remoteDataSource.filterCredits(
          customerCode: '0000100120',
          salesOrg: '2001',
          pageSize: 1,
          offset: 0,
          filterMap: [],
        );

        final expectResult = <CreditAndInvoiceItem>[];
        for (final dynamic item in res['data']['customerDocumentHeaderV2']
            ['documentHeaderList']) {
          expectResult.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
        }
        expect(
          result,
          expectResult,
        );
      });

      test('=> filterCredits status code not 200', () async {
        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getDocumentHeaderListQuery(),
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

        await remoteDataSource.filterCredits(
          customerCode: 'mock_soldTo',
          salesOrg: 'mock_salesOrg',
          pageSize: 1,
          offset: 0,
          filterMap: [],
        ).onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(List<CreditAndInvoiceItem>.empty());
        });
      });

      test('=> filterCredits with error', () async {
        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getDocumentHeaderListQuery(),
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

        await remoteDataSource.filterCredits(
          customerCode: 'mock_soldTo',
          salesOrg: 'mock_salesOrg',
          pageSize: 1,
          offset: 0,
          filterMap: [],
        ).onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(List<CreditAndInvoiceItem>.empty());
        });
      });
    },
  );
}
