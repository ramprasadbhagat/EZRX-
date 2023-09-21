import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_info_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_invoice_info_pdf_dto.dart';

class NewPaymentRemoteDataSource {
  HttpService httpService;
  NewPaymentQuery newPaymentQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  NewPaymentRemoteDataSource({
    required this.httpService,
    required this.newPaymentQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<CustomerOpenItem>> getOutstandingInvoices({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, String>> filterList,
  }) async {
    return await getCustomerOpenItems(
      customerCode: customerCode,
      salesOrg: salesOrg,
      debitCreditType: 'debit',
      debitCreditCode: 'S',
      orderBy: 'netDueDate',
      filterList: filterList,
      offset: offset,
      pageSize: pageSize,
    );
  }

  Future<List<CustomerOpenItem>> getAvailableCreditNotes({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, String>> filterList,
  }) async {
    return await getCustomerOpenItems(
      customerCode: customerCode,
      salesOrg: salesOrg,
      debitCreditType: 'credit',
      debitCreditCode: 'H',
      orderBy: 'postingKeyName',
      filterList: filterList,
      offset: offset,
      pageSize: pageSize,
    );
  }

  Future<PaymentInfo> pay({
    required String customerCode,
    required String salesOrg,
    required List<Map<String, dynamic>> customerInvoices,
    required String paymentMethod,
    required String transactionCurrency,
    required String userName,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.payQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'customerInvoice': customerInvoices,
              'paymentMethod': paymentMethod,
              'salesOrg': salesOrg,
              'transactionCurrency': transactionCurrency,
              'userName': userName,
            },
          },
        },
      ),
      apiEndpoint: 'addCustomerPayment',
    );
    _exceptionChecker(property: 'addCustomerPayment', res: res);

    return PaymentInfoDto.fromJson(res.data['data']['addCustomerPayment'])
        .toDomain();
  }

  Future<void> updatePaymentGateway({
    required String salesOrg,
    required String txnStatus,
    required String paymentID,
    required String transactionRef,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.updatePaymentGatewayQuery(),
          'variables': {
            'input': {
              'paymentID': paymentID,
              'txnStatus': txnStatus,
              'transactionRef': transactionRef,
              'salesOrg': salesOrg,
            },
          },
        },
      ),
      apiEndpoint: 'updatePaymentGatewayMutation',
    );
    _exceptionChecker(property: 'updatePaymentGatewayMutation', res: res);
  }

  Future<List<CustomerOpenItem>> getCustomerOpenItems({
    required String customerCode,
    required String salesOrg,
    required String debitCreditType,
    required String debitCreditCode,
    required String orderBy,
    required List<Map<String, String>> filterList,
    required int offset,
    required int pageSize,
  }) async {
    final requestParams = <String, dynamic>{
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'debitCreditType': debitCreditType,
      'first': pageSize,
      'after': offset,
      'orderBy': {
        'order': 'desc',
        'field': orderBy,
      },
    };
    filterList.add({
      'field': 'debitCreditCode',
      'value': debitCreditCode,
    });

    requestParams.putIfAbsent('filterBy', () => filterList);

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.getCustomerOpenItemsQuery(),
          'variables': {
            'request': requestParams,
          },
        },
      ),
    );
    _exceptionChecker(property: 'customerOpenItems', res: res);
    final data =
        res.data['data']['customerOpenItems']['customerOpenItemsResponse'];

    final result = <CustomerOpenItem>[];
    for (final dynamic item in data) {
      result.add(CustomerOpenItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<PaymentInvoiceInfoPdf> getPaymentInvoiceInfoPdf({
    required String customerCode,
    required String customerName,
    required String salesOrg,
    required String accountingDocExternalReference,
    required String paymentBatchAdditionalInfo,
    required String paymentId,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.getPaymentInvoiceInfoPdf(),
          'variables': {
            'request': {
              'accountingDocExternalReference': accountingDocExternalReference,
              'customerCode': customerCode,
              'customerName': customerName,
              'payer': customerCode,
              'paymentBatchAdditionalInfo': paymentBatchAdditionalInfo,
              'paymentId': paymentId,
              'salesOrg': salesOrg,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'paymentInvoicePdf', res: res);
    final data = res.data['data']['paymentInvoicePdf'];

    return PaymentInvoiceInfoPdfDto.fromJson(data).toDomain();
  }

  void _exceptionChecker({
    required String property,
    required Response<dynamic> res,
  }) {
    final data = res.data;
    if (data['errors'] != null && data['errors'].isNotEmpty) {
      throw ServerException(message: data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (data['data'] == null || data['data'][property] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
