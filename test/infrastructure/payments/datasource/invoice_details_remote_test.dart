import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late InvoiceDetailsRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  const fakeAccountingDocument = '1080005528';
  const fakeFiscalYear = '2023';
  const fakeBpCustomerNumber = '0030032223';
  const fakeAccountingDocumentItem = '001';
  final variables = {
    'input': {
      'customerCode': '0030032223',
      'salesOrg': '2601',
      'accountingDocument': fakeAccountingDocument,
      'fiscalYear': fakeFiscalYear,
      'bpCustomerNumber': fakeBpCustomerNumber,
      'accountingDocumentItem': fakeAccountingDocumentItem
    }
  };
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = InvoiceDetailsRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        invoiceDetailsQueryMutation: InvoiceDetailsQueryMutation(),
      );
    },
  );

  group(
    'Invoice Details Remote Datasource',
    () {
      group('Invoice Details', () {
        test(
          'get Invoice Details Success',
          () async {
            final res = json.decode(
              await rootBundle.loadString(
                  'assets/json/customerDocumentDetailsResponse.json'),
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
                'query': remoteDataSource.invoiceDetailsQueryMutation
                    .getInvoiceDetails(),
                'variables': variables,
              }),
            );

            final result = await remoteDataSource.getInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              accountingDocument: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
            );

            final details = res['data']['customerDocumentDetails'];
            final data = <CustomerDocumentDetail>[];
            for (final dynamic detail in details) {
              data.add(CustomerDocumentDetailDto.fromJson(detail).toDomain());
            }

            expect(
              result,
              data,
            );
          },
        );

        test(
          'get Invoice Details status is not 200',
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
                'query': remoteDataSource.invoiceDetailsQueryMutation
                    .getInvoiceDetails(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .getInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              accountingDocument: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
            )
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return <CustomerDocumentDetail>[];
            });
          },
        );

        test(
          'get Invoice Details throws an error',
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
                'query': remoteDataSource.invoiceDetailsQueryMutation
                    .getInvoiceDetails(),
                'variables': variables,
              }),
            );

            await remoteDataSource
                .getInvoiceDetails(
              customerCode: 'fake-customer-code',
              salesOrg: 'fake-sale-org',
              bpCustomerNumber: fakeBpCustomerNumber,
              fiscalYear: fakeFiscalYear,
              accountingDocument: fakeAccountingDocument,
              accountingDocumentItem: fakeAccountingDocumentItem,
            )
                .onError((error, _) {
              expect(error, isA<ServerException>());
              return <CustomerDocumentDetail>[];
            });
          },
        );
      });
    },
  );
}
