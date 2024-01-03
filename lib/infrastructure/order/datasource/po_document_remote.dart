import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';

class PoDocumentRemoteDataSource {
  final HttpService httpService;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  PoDocumentQuery queryMutation;

  PoDocumentRemoteDataSource({
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.queryMutation,
  });
  Future<AttachmentFileBuffer> fileDownload(
    String name,
    String imgUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final poDownloadUrl = '/api/ereturn/downloads?encryptedURL=$imgUrl';
      final res = await httpService.request(
        method: 'GET',
        url: poDownloadUrl,
        data: {'url': imgUrl},
        responseType: ResponseType.bytes,
      );
      _fileDownloadExceptionChecker(res: res);

      return AttachmentFileBuffer(
        name: name,
        buffer: res.data,
      );
    });
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

  Future<PoDocuments> fileUpload({
    required MultipartFile file,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}po-upload',
        data: FormData.fromMap({
          'files': file,
          'userName': userName,
        }),
      );
      _fileUploadExceptionChecker(res: res);

      return PoDocumentsDto.fromJson(res.data).toDomain();
    });
  }

  Future<bool> deleteFile({
    required String filePath,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.deleteFile();
      final variables = {
        'filePath': filePath,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _fileUploadExceptionChecker(
        res: res,
      );

      return res.data['data']['deleteFile']['isDeleted'] as bool;
    });
  }

  void _fileUploadExceptionChecker({required Response<dynamic> res}) {
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
