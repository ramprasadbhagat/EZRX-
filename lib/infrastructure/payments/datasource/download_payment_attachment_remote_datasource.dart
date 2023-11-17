import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_query.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/download_payment_attachment_dto.dart';

class DownloadPaymentAttachmentRemoteDataSource {
  HttpService httpService;
  DownloadPaymentAttachmentQuery downloadPaymentAttachmentQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  DownloadPaymentAttachmentRemoteDataSource({
    required this.httpService,
    required this.downloadPaymentAttachmentQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<DownloadPaymentAttachment> getFileDownloadUrl({
    required String salesOrg,
    required String customerCode,
    required String excelFor,
    required List<Map<String, dynamic>> queryObject,
  }) async {
    final queryData = downloadPaymentAttachmentQuery.getFileUrl();
    final request = {
      'salesOrg': salesOrg,
      'customerCode': customerCode,
      'filterBy': queryObject,
      'excelFor': excelFor,
      'orderBy': [
        {
          'order': 'desc',
          'field': 'documentDate',
        },
      ],
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
    _approverReturnRequestInformationExceptionChecker(res: res);
    final data = res.data['data']['customerDocumentHeaderExcel'];

    return DownloadPaymentAttachmentDto.fromJson(data).toDomain();
  }

  Future<DownloadPaymentAttachment> getPaymentSummaryFileDownloadUrl({
    required String salesOrg,
    required String customerCode,
  }) async {
    final queryData = downloadPaymentAttachmentQuery.getPaymentSummaryFileUrl();
    final request = {
      'salesOrg': salesOrg,
      'customerCode': customerCode,
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
    final data = res.data['data']['customerPaymentExcel'];

    return DownloadPaymentAttachmentDto.fromJson(data).toDomain();
  }

  Future<AttachmentFileBuffer> fileDownload(
    String fileUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/payment/downloads',
        data: {'url': fileUrl},
        responseType: ResponseType.bytes,
      );
      _fileDownloadExceptionChecker(res: res);

      return AttachmentFileBuffer(
        name: Uri.parse(fileUrl).pathSegments.last,
        buffer: res.data,
      );
    });
  }

  Future<AttachmentFileBuffer> soaDownload(
    String fileUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}/payment/downloadSoa',
        data: {'url': fileUrl},
        responseType: ResponseType.bytes,
      );
      _fileDownloadExceptionChecker(res: res);

      return AttachmentFileBuffer(
        name: Uri.parse(fileUrl).pathSegments.last,
        buffer: res.data,
      );
    });
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

  void _fileDownloadExceptionChecker({required Response<dynamic> res}) {
    if (res.data is List && res.data.isEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
