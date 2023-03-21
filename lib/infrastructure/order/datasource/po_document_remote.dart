import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';

class PoDocumentRemote {
  final HttpService httpService;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  static const _pODownloadUrl = '/api/downloadPOAttachment';
  static const _returnSummaryAttachmentUrl = '/api/downloadAttachment';

  static const _uploadUrl = '/api/po-upload';

  static const _method = 'POST';

  PoDocumentRemote({
    required this.httpService,
    required this.dataSourceExceptionHandler,
  });
  Future<PoDocumentsBuffer> fileDownload(
    String name,
    String imgUrl,
    AttachmentType attachmentType,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: attachmentType == AttachmentType.downloadPOAttachment
            ? _pODownloadUrl
            : _returnSummaryAttachmentUrl,
        data: {'url': imgUrl},
        responseType: ResponseType.bytes,
      );
      _fileDownloadExceptionChecker(res: res);

      return PoDocumentsBuffer(
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
    required String countryName,
    required MultipartFile file,
    required String userName,
    required String currentYear,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: _uploadUrl,
        data: FormData.fromMap({
          'excel': file,
          'countryName': countryName,
          'userName': userName,
          'currentYear': currentYear,
        }),
      );
      _fileUploadExceptionChecker(res: res);

      return PoDocumentsDto.fromJson(res.data).toDomain();
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
