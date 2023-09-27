import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';

class PaymentSummaryRemoteDataSource {
  HttpService httpService;
  PaymentSummaryQuery paymentSummaryQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PaymentSummaryRemoteDataSource({
    required this.httpService,
    required this.paymentSummaryQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<PaymentSummaryDetails>> getPaymentSummary({
    required String customerCode,
    required String salesOrg,
    required List<Map<String, String>> filterList,
    required int offset,
    required int pageSize,
  }) async {
    final queryData = paymentSummaryQuery.getPaymentSummaryQuery();
    final request = {
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'first': pageSize,
      'after': offset,
      'orderBy': [
        {'order': 'desc', 'field': 'createdDate'},
      ],
      'filterBy': filterList,
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
    _approverReturnRequestInformationExceptionChecker(res: res);
    final data = res.data['data']['customerPayment']['customerPaymentResponse'];

    return List.from(data)
        .map((e) => PaymentSummaryDetailsDto.fromJson(e).toDomain())
        .toList();
  }

  void _approverReturnRequestInformationExceptionChecker({
    required Response<dynamic> res,
  }) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
