import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';

class InvoiceDetailsRemoteDataSource {
  HttpService httpService;
  InvoiceDetailsQueryMutation invoiceDetailsQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  InvoiceDetailsRemoteDataSource({
    required this.httpService,
    required this.invoiceDetailsQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<CustomerDocumentDetail>> getInvoiceDetails({
    required String customerCode,
    required String salesOrg,
    required String accountingDocument,
    required String fiscalYear,
    required String bpCustomerNumber,
    required String accountingDocumentItem,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': invoiceDetailsQueryMutation.getInvoiceDetails(),
          'variables': {
            'input': {
              'customerCode': customerCode,
              'salesOrg': salesOrg,
              'accountingDocument': accountingDocument,
              'fiscalYear': fiscalYear,
              'bpCustomerNumber': bpCustomerNumber,
              'accountingDocumentItem': accountingDocumentItem,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'customerDocumentDetails', res: res);
    final data = res.data['data']['customerDocumentDetails'];
    final result = <CustomerDocumentDetail>[];
    for (final dynamic element in data) {
      result.add(CustomerDocumentDetailDto.fromJson(element).toDomain());
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
