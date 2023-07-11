import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_query.dart';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';

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

  Future<List<PaymentItem>> getPaymentItem({
    required String customerCode,
    required String salesOrg,
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
  }) async {
    final queryData = paymentItemQuery.getPaymentItemQuery();
    final request = {
      'customerCode': customerCode,
      'salesOrg': salesOrg,
      'paymentBatchAdditionalInfo': paymentBatchAdditionalInfo,
      'paymentID': paymentID,
      'accountingDocExternalReference': accountingDocExternalReference,
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
    final data = res.data['data']['paymentItems'];

    return List.from(data)
        .map((e) => PaymentItemDto.fromJson(e).toDomain())
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
