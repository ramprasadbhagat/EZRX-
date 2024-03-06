import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';

class EInvoiceRemoteDataSource {
  final HttpService httpService;
  final Config config;
  final DataSourceExceptionHandler exceptionHandler;

  EInvoiceRemoteDataSource({
    required this.httpService,
    required this.exceptionHandler,
    required this.config,
  });

  Future<DownloadPaymentAttachment> getEInvoice({
    required String invoiceNumber,
    required String salesOrg,
    required String country,
    required String soldTo,
  }) async {
    final data = _getData(
      invoiceNumber: invoiceNumber,
      salesOrg: salesOrg,
      country: country,
      soldTo: soldTo,
    );
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}payment/listInvoice',
      data: jsonEncode(
        data,
      ),
    );
    _exceptionChecker(res: res);
    if (res.data['data'] == null || res.data['data'].isEmpty) {
      return DownloadPaymentAttachment.empty();
    }

    return ECreditInvoiceDto.fromJson(res.data['data'][0]).toDomain();
  }

  void _exceptionChecker({
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

  dynamic _getData({
    required String invoiceNumber,
    required String salesOrg,
    required String country,
    required String soldTo,
  }) {
    switch (country) {
      case 'SG':
        return {
          'invoice_number': invoiceNumber,
        };
      case 'PH':
        return {
          'invoice_number': invoiceNumber,
          'sales_org': salesOrg,
          'sold_to': soldTo,
          'document_type': 'ZPF2',
        };
    }
  }
}
