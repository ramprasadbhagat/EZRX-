import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_statuses_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';

class AllCreditsAndInvoicesRemoteDataSource {
  HttpService httpService;
  AllCreditsAndInvoicesQueryMutation allCreditsAndInvoicesQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AllCreditsAndInvoicesRemoteDataSource({
    required this.httpService,
    required this.allCreditsAndInvoicesQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<AvailableStatuses> getAvailableStatuses({
    required String salesOrg,
    String statusFor = 'DebitItems',
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query':
              allCreditsAndInvoicesQueryMutation.getAvailableStatusesQuery(),
          'variables': {
            'request': {
              'statusFor': 'DebitItems',
              'salesOrg': salesOrg,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'availableStatuses', res: res);
    final data = res.data['data']['availableStatuses'];

    return AvailableStatusesDto.fromJson(data).toDomain();
  }

  Future<AvailableStatuses> getAvailableStatusesForAllCredits({
    required String salesOrg,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query':
              allCreditsAndInvoicesQueryMutation.getAvailableStatusesQuery(),
          'variables': {
            'request': {
              'statusFor': 'CreditItems',
              'salesOrg': salesOrg,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'availableStatuses', res: res);
    final data = res.data['data']['availableStatuses'];

    return AvailableStatusesDto.fromJson(data).toDomain();
  }

  Future<CustomerDocumentHeader> filterInvoices({
    required String customerCode,
    required String salesOrg,
    required List<Map<String, String>> filterMap,
    String sortDirection = 'desc',
    required int offset,
    required int pageSize,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': allCreditsAndInvoicesQueryMutation
              .getCustomerDocumentHeaderQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'first': pageSize,
              'after': offset,
              'excelFor': 'Debit',
              'orderBy': [
                {
                  'order': sortDirection,
                  'field': 'netDueDate',
                },
              ],
              'filterBy': filterMap,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'customerDocumentHeader', res: res);
    final data = res.data['data']['customerDocumentHeader'];

    return CustomerDocumentHeaderDto.fromJson(data).toDomain();
  }

  Future<CustomerDocumentHeader> getAllCredits({
    required String customerCode,
    required String salesOrg,
    required int offset,
    required int pageSize,
    required List<Map<String, dynamic>> filterQuery,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': allCreditsAndInvoicesQueryMutation
              .getCustomerDocumentHeaderQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'first': pageSize,
              'after': offset,
              'excelFor': 'Credit',
              'orderBy': [],
              'filterBy': filterQuery,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'customerDocumentHeader', res: res);
    final data = res.data['data']['customerDocumentHeader'];

    return CustomerDocumentHeaderDto.fromJson(data).toDomain();
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
