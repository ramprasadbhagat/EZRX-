import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/invoice_order_item_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late List<String> invoiceId;
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
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AllCreditsAndInvoicesRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        allCreditsAndInvoicesQueryMutation:
            AllCreditsAndInvoicesQueryMutation(),
      );

      final invoiceOrderItems =
          await AllCreditsAndInvoicesLocalDataSource().getOrderForInvoice();
      invoiceId =
          invoiceOrderItems.map((e) => e.invoiceId.getOrCrash()).toList();
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

  group(
    'All InvoiceOrderItem Remote Datasource Test',
    () {
      test('=> success', () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/getOrdersForInvoiceIdResponse.json',
          ),
        );

        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getOrderForInvoice(),
          'variables': {
            'invoiceId': invoiceId,
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

        final result = await remoteDataSource.getOrderForInvoice(invoiceId);

        final expectResult = List.from(res['data']['getOrdersForInvoiceId'])
            .map((e) => InvoiceOrderItemDto.fromJson(e).toDomain)
            .toList();
        expect(
          result,
          expectResult,
        );
      });

      test('=>error', () async {
        final data = jsonEncode({
          'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
              .getOrderForInvoice(),
          'variables': {
            'invoiceId': invoiceId,
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

        await remoteDataSource
            .getOrderForInvoice(invoiceId)
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(List<InvoiceOrderItem>.empty());
        });
      });
    },
  );
}
