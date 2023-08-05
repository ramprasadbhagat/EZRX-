import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/manage_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/add_payment_advice_footer_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_footer_dto.dart';

class PaymentAdviceFooterRemoteDataSource {
  PaymentAdviceFooterRemoteDataSource({
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
    required this.paymentAdviceQueryMutation,
  });

  final HttpService httpService;
  final PaymentAdviceQueryMutation paymentAdviceQueryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;

  Future<List<PaymentAdviceFooter>> getPaymentAdvice() async {
    final queryData = paymentAdviceQueryMutation.getPaymentAdviceQuery();
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'request': {},
          },
        },
      ),
    );
    _paymentAdviceExceptionChecker(res: res);
    final data = res.data['data']['paymentAdvice'];

    return List.from(data)
        .map((e) => PaymentAdviceFooterDto.fromJson(e).toDomain())
        .toList();
  }

  void _paymentAdviceExceptionChecker({
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

  Future<ManagePaymentAdviceFooterResponse> addPaymentAdvice({
    required Map<String, dynamic> query,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpayMutation',
        data: jsonEncode(
          {
            'query': paymentAdviceQueryMutation.addPaymentAdviceMutation(),
            'variables': {
              'input': query,
            },
          },
        ),
        apiEndpoint: 'addPaymentAdviceMutation',
      );
      _managePaymentAdviceFooterExceptionChecker(res: res);
      final data = res.data['data']['addPaymentAdvice'];

      return ManagePaymentAdviceFooterResponseDto.fromJson(data).toDomain();
    });
  }

  Future<PaymentAdviceLogoNetworkFile> headerLogoUpload({
    required MultipartFile file,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/upload-payment-advice-logo',
        data: FormData.fromMap({
          'excel': file,
        }),
      );
      _managePaymentAdviceFooterExceptionChecker(res: res);

      return PaymentAdviceLogoNetworkFileDto.fromJson(res.data).toDomain();
    });
  }

  Future<ManagePaymentAdviceFooterResponse> deletePaymentAdvice({
    required String salesOrg,
    required String salesDistrict,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpayMutation',
        data: jsonEncode(
          {
            'query': paymentAdviceQueryMutation.deletePaymentAdviceMutation(),
            'variables': {
              'input': {
                'salesOrg': salesOrg,
                'salesDistrict': salesDistrict,
              },
            },
          },
        ),
        apiEndpoint: 'deletePaymentAdviceMutation',
      );
      _managePaymentAdviceFooterExceptionChecker(res: res);
      final data = res.data['data']['deletePaymentAdvice'];

      return ManagePaymentAdviceFooterResponseDto.fromJson(data).toDomain();
    });
  }

  void _managePaymentAdviceFooterExceptionChecker({
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
