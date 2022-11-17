import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class OrderHistoryDetailsPoDocumentDownloadRemote {
  final HttpService httpService;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  static const _url = '/api/downloadPOAttachment';
  static const _method = 'POST';

  OrderHistoryDetailsPoDocumentDownloadRemote({
    required this.httpService,
    required this.dataSourceExceptionHandler,
  });
  Future<OrderHistoryDetailsPoDocumentsBuffer> fileDownload(
    String name,
    String imgUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: _method,
        url: _url,
        data: {'url': imgUrl},
        responseType: ResponseType.bytes,
      );
      _fileDownloadExceptionChecker(res: res);

      return OrderHistoryDetailsPoDocumentsBuffer(
        name: name,
        buffer: res.data,
      );
    });
  }

  void _fileDownloadExceptionChecker({required Response<dynamic> res}) {
    if (res.data is! List && res.data.isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
