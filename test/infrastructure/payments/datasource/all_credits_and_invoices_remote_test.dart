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

void main() {
  late AllCreditsAndInvoicesRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final filterMap = [
    {'field': 'debitCreditCode', 'value': 'S'},
    {'field': 'accountingDocument', 'value': '321312'},
    {'field': 'netDueDate', 'value': '2023-05-11', 'type': 'ge'},
    {'field': 'netDueDate', 'value': '2023-05-16', 'type': 'le'},
    {'field': 'postingDate', 'value': '2023-05-22', 'type': 'ge'},
    {'field': 'postingDate', 'value': '2023-05-27', 'type': 'le'},
    {'field': 'amountInTransactionCurrency', 'value': '1', 'type': 'ge'},
    {'field': 'amountInTransactionCurrency', 'value': '10', 'type': 'le'},
    {'field': 'invoiceProcessingStatus', 'value': 'Overdue'},
  ];
  final variables = {
    'request': {
      'input': {
        'customerCode': '0030032223',
        'salesOrg': '2601',
        'first': 11,
        'after': 0,
        'excelFor': 'Debit',
        'orderBy': [
          {'order': 'desc', 'field': 'netDueDate'}
        ],
        'filterBy': filterMap
      }
    },
  };
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
    'All Credits And Invoices Remote Datasource',
    () {

      group('All Credits And Invoices', () {
        test(
          'get All Credits And Invoices Success',
          () async {
            final res = json.decode(
              await rootBundle
                  .loadString('assets/json/customerDocumentHeaderResponse.json'),
            );

            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                200,
                res,
                delay: const Duration(seconds: 1),
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getCustomerDocumentHeaderQuery(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.filterInvoices(
                customerCode: 'fake-customer-code',
                salesOrg: 'fake-sale-org',
                filterMap: filterMap,
                offset: 0,
                pageSize: 20);

            expect(
              result,
              CustomerDocumentHeaderDto.fromJson(
                      res['data']['customerDocumentHeader'])
                  .toDomain(),
            );
          },
        );

        test(
          'get All Credits And Invoices status is not 200',
          () async {
            dioAdapter.onPost(
              '/api/ezpay',
              (server) => server.reply(
                204,
                {'data': []},
                delay: const Duration(seconds: 1),
              ),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getCustomerDocumentHeaderQuery(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .filterInvoices(
                    customerCode: 'fake-customer-code',
                    salesOrg: 'fake-sale-org',
                    filterMap: filterMap,
                    offset: 0,
                    pageSize: 20)
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return CustomerDocumentHeader.empty();
            });
          },
        );

        test(
          'get All Credits And Invoices throws an error',
          () async {
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
              data: jsonEncode({
                'query': remoteDataSource.allCreditsAndInvoicesQueryMutation
                    .getCustomerDocumentHeaderQuery(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .filterInvoices(
                    customerCode: 'fake-customer-code',
                    salesOrg: 'fake-sale-org',
                    filterMap: filterMap,
                    offset: 0,
                    pageSize: 20)
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return CustomerDocumentHeader.empty();
            });
          },
        );
      });
    },
  );
}
