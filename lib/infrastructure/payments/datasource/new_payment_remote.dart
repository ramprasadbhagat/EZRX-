import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';

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
  }) async {
    return getCustomerOpenItems(
      customerCode: customerCode,
      salesOrg: salesOrg,
      debitCreditType: 'debit',
      offset: offset,
      pageSize: pageSize,
    );
  }

  Future<List<CustomerOpenItem>> getAvailableCreditNotes({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
  }) async {
    return getCustomerOpenItems(
      customerCode: customerCode,
      salesOrg: salesOrg,
      debitCreditType: 'credit',
      offset: offset,
      pageSize: pageSize,
    );
  }

  Future<List<CustomerOpenItem>> getCustomerOpenItems({
    required String customerCode,
    required String salesOrg,
    required String debitCreditType,
    String sortDirection = 'desc',
    required int offset,
    required int pageSize,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': newPaymentQuery.getCustomerOpenItemsQuery(),
          'variables': {
            'request': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'debitCreditType': debitCreditType,
              'first': pageSize,
              'after': offset,
              'orderBy': {
                'order': sortDirection,
                'field': 'postingKeyName',
              },
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'customerOpenItems', res: res);
    final data = res.data['data']['customerOpenItems']['customerOpenItemsResponse'];

    final result = <CustomerOpenItem>[];
    for (final dynamic item in data) {
      result.add(CustomerOpenItemDto.fromJson(item).toDomain());
    }

    return result;
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
