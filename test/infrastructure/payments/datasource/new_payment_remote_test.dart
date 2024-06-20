import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/error/payment_exception.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_info_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_invoice_info_pdf_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_method_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class PaymentInfoMock extends Mock implements PaymentInfo {}

class PaymentInvoiceInfoPdfMock extends Mock implements PaymentInvoiceInfoPdf {}

class NewPaymentMethodMock extends Mock implements NewPaymentMethod {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late NewPaymentRemoteDataSource newPaymentRemoteDataSource;
  final updatePaymentGatewayResponse = json.decode(
    await rootBundle
        .loadString('assets/json/updatePaymentGatewayResponse.json'),
  );
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);
  const fakeCustomerCode = 'fake-customer-code';
  const fakeSalesOrg = 'fake-salesOrg';
  const fakeShipToCode = 'fake-shipToCode';
  const fakeBaseUrl = 'fake-baseurl';

  setUpAll(
    () {
      newPaymentRemoteDataSource = NewPaymentRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        newPaymentQuery: NewPaymentQuery(),
      );
    },
  );

  group(
    'New Payment Remote Data Test: pay method',
    () {
      test('pay with statuscode equal to 200', () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/payResponseVN.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': 'fake-customer-code',
              'customerInvoice': [],
              'paymentMethod': 'Payment Gateway',
              'salesOrg': 'fake-salesOrg',
              'transactionCurrency': 'VND',
              'userName': 'rootadmin',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await newPaymentRemoteDataSource.pay(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          paymentMethod: 'Payment Gateway',
          transactionCurrency: 'VND',
          customerInvoices: [],
          userName: 'rootadmin',
          shipToCode: fakeShipToCode,
          isMarketPlace: false,
          baseUrl: fakeBaseUrl,
        );

        expect(
          result,
          PaymentInfoDto.fromJson(res['data']['addCustomerPayment']).toDomain(
            baseUrl: fakeBaseUrl,
          ),
        );
      });

      test('pay should inclue isMarketPlace when value is true', () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/payResponseVN.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': 'fake-customer-code',
              'customerInvoice': [],
              'paymentMethod': 'Payment Gateway',
              'salesOrg': 'fake-salesOrg',
              'transactionCurrency': 'VND',
              'userName': 'rootadmin',
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await newPaymentRemoteDataSource.pay(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          paymentMethod: 'Payment Gateway',
          transactionCurrency: 'VND',
          customerInvoices: [],
          userName: 'rootadmin',
          shipToCode: fakeShipToCode,
          isMarketPlace: true,
          baseUrl: fakeBaseUrl,
        );

        expect(
          result,
          PaymentInfoDto.fromJson(res['data']['addCustomerPayment'])
              .toDomain(baseUrl: fakeBaseUrl),
        );
      });

      test('pay with statuscode not equal to 200', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': 'fake-customer-code',
              'customerInvoice': [],
              'paymentMethod': 'Payment Gateway',
              'salesOrg': 'fake-salesOrg',
              'transactionCurrency': 'VND',
              'userName': 'rootadmin',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            205,
            {'data': {}},
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .pay(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          paymentMethod: 'Payment Gateway',
          transactionCurrency: 'VND',
          customerInvoices: [],
          userName: 'rootadmin',
          shipToCode: fakeShipToCode,
          isMarketPlace: false,
          baseUrl: fakeBaseUrl,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(PaymentInfoMock());
        });
      });

      test('pay with error', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': 'fake-customer-code',
              'customerInvoice': [],
              'paymentMethod': 'Payment Gateway',
              'salesOrg': 'fake-salesOrg',
              'transactionCurrency': 'VND',
              'userName': 'rootadmin',
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
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .pay(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          paymentMethod: 'Payment Gateway',
          transactionCurrency: 'VND',
          customerInvoices: [],
          userName: 'rootadmin',
          shipToCode: fakeShipToCode,
          isMarketPlace: false,
          baseUrl: fakeBaseUrl,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(PaymentInfoMock());
        });
      });

      test('pay with error missing zzhtmcs on response', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/payResponseVNEmptyzzHtmcs.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': 'fake-customer-code',
              'customerInvoice': [],
              'paymentMethod': 'Payment Gateway',
              'salesOrg': 'fake-salesOrg',
              'transactionCurrency': 'VND',
              'userName': 'rootadmin',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .pay(
          customerCode: fakeCustomerCode,
          salesOrg: fakeSalesOrg,
          paymentMethod: 'Payment Gateway',
          transactionCurrency: 'VND',
          customerInvoices: [],
          userName: 'rootadmin',
          shipToCode: fakeShipToCode,
          isMarketPlace: false,
          baseUrl: fakeBaseUrl,
        )
            .onError((error, _) async {
          expect(error, isA<PaymentException>());
          return Future.value(PaymentInfoMock());
        });
      });
    },
  );

  group(
    'New Payment Remote Data Test: payment invoice pdf method',
    () {
      test('paymentInvoicePdf with statuscode equal to 200', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/paymentInvoiceInfoPdfResponse.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .getPaymentInvoiceInfoPdf(),
          'variables': {
            'request': {
              'accountingDocExternalReference':
                  'fake-accountingDocExternalReference',
              'customerCode': 'fake-customerCode',
              'customerName': 'fake-customerName',
              'payer': 'fake-customerCode',
              'paymentBatchAdditionalInfo': 'fake-paymentBatchAdditionalInfo',
              'paymentId': 'fake-paymentId',
              'salesOrg': 'fake-salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result =
            await newPaymentRemoteDataSource.getPaymentInvoiceInfoPdf(
          accountingDocExternalReference: 'fake-accountingDocExternalReference',
          customerCode: 'fake-customerCode',
          customerName: 'fake-customerName',
          paymentBatchAdditionalInfo: 'fake-paymentBatchAdditionalInfo',
          paymentId: 'fake-paymentId',
          salesOrg: 'fake-salesOrg',
          zzAdviceNumber: 'fake-adviceNumber',
          isMarketPlace: false,
        );

        expect(
          result,
          PaymentInvoiceInfoPdfDto.fromJson(res['data']['paymentInvoicePdf'])
              .toDomain(),
        );
      });

      test('paymentInvoicePdf should include isMarketPlace when value is true',
          () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/paymentInvoiceInfoPdfResponse.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .getPaymentInvoiceInfoPdf(),
          'variables': {
            'request': {
              'accountingDocExternalReference':
                  'fake-accountingDocExternalReference',
              'customerCode': 'fake-customerCode',
              'customerName': 'fake-customerName',
              'payer': 'fake-customerCode',
              'paymentBatchAdditionalInfo': 'fake-paymentBatchAdditionalInfo',
              'paymentId': 'fake-paymentId',
              'salesOrg': 'fake-salesOrg',
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result =
            await newPaymentRemoteDataSource.getPaymentInvoiceInfoPdf(
          accountingDocExternalReference: 'fake-accountingDocExternalReference',
          customerCode: 'fake-customerCode',
          customerName: 'fake-customerName',
          paymentBatchAdditionalInfo: 'fake-paymentBatchAdditionalInfo',
          paymentId: 'fake-paymentId',
          salesOrg: 'fake-salesOrg',
          zzAdviceNumber: 'fake-adviceNumber',
          isMarketPlace: true,
        );

        expect(
          result,
          PaymentInvoiceInfoPdfDto.fromJson(res['data']['paymentInvoicePdf'])
              .toDomain(),
        );
      });

      test('paymentInvoicePdf with statuscode not equal to 200', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .getPaymentInvoiceInfoPdf(),
          'variables': {
            'request': {
              'accountingDocExternalReference':
                  'fake-accountingDocExternalReference',
              'customerCode': 'fake-customerCode',
              'customerName': 'fake-customerName',
              'payer': 'fake-customerCode',
              'paymentBatchAdditionalInfo': 'fake-paymentBatchAdditionalInfo',
              'paymentId': 'fake-paymentId',
              'salesOrg': 'fake-salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            205,
            {'data': {}},
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .getPaymentInvoiceInfoPdf(
          accountingDocExternalReference: 'fake-accountingDocExternalReference',
          customerCode: 'fake-customerCode',
          customerName: 'fake-customerName',
          paymentBatchAdditionalInfo: 'fake-paymentBatchAdditionalInfo',
          paymentId: 'fake-paymentId',
          salesOrg: 'fake-salesOrg',
          zzAdviceNumber: 'fake-adviceNumber',
          isMarketPlace: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(PaymentInvoiceInfoPdfMock());
        });
      });

      test('paymentInvoicePdf with error', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .getPaymentInvoiceInfoPdf(),
          'variables': {
            'request': {
              'accountingDocExternalReference':
                  'fake-accountingDocExternalReference',
              'customerCode': 'fake-customerCode',
              'customerName': 'fake-customerName',
              'payer': 'fake-customerCode',
              'paymentBatchAdditionalInfo': 'fake-paymentBatchAdditionalInfo',
              'paymentId': 'fake-paymentId',
              'salesOrg': 'fake-salesOrg',
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
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .getPaymentInvoiceInfoPdf(
          accountingDocExternalReference: 'fake-accountingDocExternalReference',
          customerCode: 'fake-customerCode',
          customerName: 'fake-customerName',
          paymentBatchAdditionalInfo: 'fake-paymentBatchAdditionalInfo',
          paymentId: 'fake-paymentId',
          salesOrg: 'fake-salesOrg',
          zzAdviceNumber: 'fake-adviceNumber',
          isMarketPlace: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(PaymentInvoiceInfoPdfMock());
        });
      });
    },
  );

  group(
    'New Payment Remote Data Test: update payment gateway method',
    () {
      test('update payment gateway with statuscode equal to 200', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .updatePaymentGatewayQuery(),
          'variables': {
            'input': {
              'paymentID': 'fake-paymentID',
              'txnStatus': 'fake-txnStatus',
              'transactionRef': 'fake-transactionRef',
              'salesOrg': 'fake-salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            updatePaymentGatewayResponse,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await newPaymentRemoteDataSource.updatePaymentGateway(
          paymentID: 'fake-paymentID',
          txnStatus: 'fake-txnStatus',
          transactionRef: 'fake-transactionRef',
          salesOrg: 'fake-salesOrg',
          customerCode: 'fake-customer-code',
          isMarketPlace: false,
        );

        expect(
          () => result,
          isA<void>(),
        );
      });

      test('update payment gateway with statuscode not equal to 200', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .updatePaymentGatewayQuery(),
          'variables': {
            'input': {
              'paymentID': 'fake-paymentID',
              'txnStatus': 'fake-txnStatus',
              'transactionRef': 'fake-transactionRef',
              'salesOrg': 'fake-salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            205,
            updatePaymentGatewayResponse,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .updatePaymentGateway(
          paymentID: 'fake-paymentID',
          txnStatus: 'fake-txnStatus',
          transactionRef: 'fake-transactionRef',
          salesOrg: 'fake-salesOrg',
          customerCode: 'fake-customer-code',
          isMarketPlace: false,
        )
            .onError((error, _) {
          expect(error, isA<ServerException>());
        });
      });

      test(
          'should contain isMarketPlace and customer code in payload when isMarketPlace is true',
          () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .updatePaymentGatewayQuery(),
          'variables': {
            'input': {
              'paymentID': 'fake-paymentID',
              'txnStatus': 'fake-txnStatus',
              'transactionRef': 'fake-transactionRef',
              'salesOrg': 'fake-salesOrg',
              'customerCode': 'fake-customer-code',
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            updatePaymentGatewayResponse,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await newPaymentRemoteDataSource.updatePaymentGateway(
          paymentID: 'fake-paymentID',
          txnStatus: 'fake-txnStatus',
          transactionRef: 'fake-transactionRef',
          salesOrg: 'fake-salesOrg',
          customerCode: 'fake-customer-code',
          isMarketPlace: true,
        );

        expect(
          () => result,
          isA<void>(),
        );
      });
    },
  );

  group(
    'New Payment Remote Data Test: fetch payment method method',
    () {
      test('fetchPaymentMethod with statuscode equal to 200', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/paymentMethodsResponse.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .fetchPaymentMethodQuery(),
          'variables': {
            'request': {
              'salesOrg': 'fake-salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await newPaymentRemoteDataSource.fetchPaymentMethods(
          salesOrg: 'fake-salesOrg',
          isMarketPlace: false,
        );

        expect(
          result.length,
          List.from(res['data']['availablePaymentMethods'])
              .map((e) => PaymentMethodDto.fromJson(e).toDomain())
              .toList()
              .length,
        );
      });

      test('fetchPaymentMethod should contain isMarketPlace when value is true',
          () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/paymentMethodsResponse.json'),
        );

        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .fetchPaymentMethodQuery(),
          'variables': {
            'request': {
              'salesOrg': 'fake-salesOrg',
              'isMarketPlace': true,
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await newPaymentRemoteDataSource.fetchPaymentMethods(
          salesOrg: 'fake-salesOrg',
          isMarketPlace: true,
        );

        expect(
          result.length,
          List.from(res['data']['availablePaymentMethods'])
              .map((e) => PaymentMethodDto.fromJson(e).toDomain())
              .toList()
              .length,
        );
      });

      test('fetchPaymentMethod with statuscode not equal to 200', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .fetchPaymentMethodQuery(),
          'variables': {
            'request': {
              'salesOrg': 'fake-salesOrg',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            205,
            {'data': {}},
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .fetchPaymentMethods(
          salesOrg: 'fake-salesOrg',
          isMarketPlace: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([NewPaymentMethodMock()]);
        });
      });

      test('fetchPaymentMethod with error', () async {
        final data = jsonEncode({
          'query': newPaymentRemoteDataSource.newPaymentQuery
              .fetchPaymentMethodQuery(),
          'variables': {
            'request': {
              'salesOrg': 'fake-salesOrg',
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
                {'message': 'fake-error'},
              ],
            },
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await newPaymentRemoteDataSource
            .fetchPaymentMethods(
          salesOrg: 'fake-salesOrg',
          isMarketPlace: false,
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([NewPaymentMethodMock()]);
        });
      });
    },
  );
}
