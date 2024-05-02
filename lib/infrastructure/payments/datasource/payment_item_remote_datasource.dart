import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_query.dart';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_detail_dto.dart';

class PaymentItemRemoteDataSource {
  HttpService httpService;
  PaymentItemQuery paymentItemQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  PaymentItemRemoteDataSource({
    required this.config,
    required this.dataSourceExceptionHandler,
    required this.httpService,
    required this.paymentItemQuery,
  });

  Future<List<PaymentItem>> getPaymentItemList({
    required String customerCode,
    required String salesOrg,
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
    required bool isMarketPlace,
  }) async {
    final queryData = paymentItemQuery.getPaymentItemQuery();
    final request = {
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'paymentBatchAdditionalInfo': paymentBatchAdditionalInfo,
      'paymentID': paymentID,
      'accountingDocExternalReference': accountingDocExternalReference,
      if (isMarketPlace) 'isMarketPlace': isMarketPlace,
    };
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'request': request,
          },
        },
      ),
    );
    _exceptionChecker(response: res);
    final data = res.data['data']['paymentItems'];

    return List.from(data)
        .map((e) => PaymentItemDto.fromJson(e).toDomain())
        .toList();
  }

  Future<PaymentSummaryDetails> getPaymentSummaryDetails({
    required String customerCode,
    required String salesOrg,
    required Map<String, dynamic> filterBy,
    required bool isMarketPlace,
  }) async {
    final queryData = paymentItemQuery.getPaymentSummaryQuery();

    final request = {
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'filterBy': [filterBy],
      if (isMarketPlace) 'isMarketPlace': isMarketPlace,
    };

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'request': request,
          },
        },
      ),
    );
    _exceptionChecker(response: res);
    final data = res.data['data']['customerPayment']['customerPaymentResponse'];
    if (data == null || data.isEmpty) return PaymentSummaryDetails.empty();

    return PaymentSummaryDetailsDto.fromJson(data[0]).toDomain();
  }

  Future<bool> deleteCustomerPayment({
    required String customerCode,
    required String salesOrg,
    required String shipToCode,
    required String paymentAmount,
    required String paymentBatchAdditionalInfo,
    required String paymentId,
    required String transactionCurrency,
    required String paymentDate,
    required String zzAdvice,
  }) async {
    final queryData = paymentItemQuery.deleteCustomerPaymentQuery();
    final request = {
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'shipToCode': shipToCode,
      'paymentAmount': paymentAmount,
      'paymentBatchAdditionalInfo': paymentBatchAdditionalInfo,
      'paymentID': paymentId,
      'transactionCurrency': transactionCurrency,
      'valueDate': paymentDate,
      'zzAdvice': zzAdvice,
    };
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'input': request,
          },
        },
      ),
    );
    _exceptionChecker(response: res);
    final data = res.data['data']['deleteCustomerPayment'];

    if (data != null) {
      final statusMessage = data['statusMessage'];

      return statusMessage ==
          'Customer Payment Advice has been Deleted Successfully';
    }

    throw ServerException(message: data['statusMessage']);
  }

  Future<PaymentSummaryDetails> getTransaction({
    required String customerCode,
    required String salesOrg,
    required String paymentId,
  }) async {
    final queryData = paymentItemQuery.getTransactionQuery();
    final request = {
      'customer': customerCode,
      'salesOrg': salesOrg,
      'id': paymentId,
    };
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'input': request,
          },
        },
      ),
    );
    _exceptionChecker(response: res);
    final data = res.data['data']['getTransaction'];
    if (data == null || data.isEmpty) return PaymentSummaryDetails.empty();

    return TransactionDetailDto.fromJson(data).toDomain();
  }

  Future<String> cancelPaymentAdvice({
    required String customerCode,
    required String salesOrg,
    required String referenceId,
  }) async {
    final queryData = paymentItemQuery.getCancelVirtualAccountQuery();
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'input': {
              'salesOrg': salesOrg,
              'customer': customerCode,
              'id': referenceId,
            },
          },
        },
      ),
    );
    _exceptionChecker(response: res, property: 'cancelVirtualAccount');

    return res.data['data']['cancelVirtualAccount']['id']?.toString() ?? '';
  }

  void _exceptionChecker({
    required Response<dynamic> response,
    String? property,
  }) {
    final data = response.data;
    if (data['errors'] != null && data['errors'].isNotEmpty) {
      throw ServerException(message: data['errors'][0]['message']);
    } else if (response.statusCode != 200) {
      throw ServerException(
        code: response.statusCode ?? 0,
        message: response.statusMessage ?? '',
      );
    } else if (data['data'] == null ||
        (property != null && data['data'][property] == null)) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
