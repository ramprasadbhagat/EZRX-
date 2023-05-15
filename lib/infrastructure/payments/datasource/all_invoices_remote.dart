import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_statuses_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';

class AllInvoicesRemoteDataSource {
  HttpService httpService;
  AllInvoicesQueryMutation allInvoicesQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AllInvoicesRemoteDataSource({
    required this.httpService,
    required this.allInvoicesQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<AvailableStatuses> getAvailableStatuses({
    required String salesOrg,
    String statusFor = 'DebitItems',
    required int offSet,
    required int pageSize,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': allInvoicesQueryMutation.getAvailableStatusesQuery(),
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

  Future<CustomerDocumentHeader> getAllInvoices({
    required String customerCode,
    required String salesOrg,
    String sortDirection = 'desc',
    String excelFor = 'Debit',
    String orderByField = 'netDueDate',
    String filterByField = 'debitCreditCode',
    required int offSet,
    required int pageSize,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': allInvoicesQueryMutation.getAllInvoicesQuery(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'first': pageSize,
              'after': offSet,
              'excelFor': excelFor,
              'orderBy': [
                {
                  'order': sortDirection,
                  'field': orderByField,
                },
              ],
              'filterBy': [
                {
                  'field': filterByField,
                  'value': 'S',
                },
              ],
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
    } else if (data['data'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    } else if (data['data'][property] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
