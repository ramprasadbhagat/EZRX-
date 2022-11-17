import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:flutter/services.dart';

class OrderHistoryDetailsPoDocumentDownloadLocal {
  OrderHistoryDetailsPoDocumentDownloadLocal();
  Future<OrderHistoryDetailsPoDocumentsBuffer> fileDownload(
    String name,
    String imgUrl,
  ) async {
    final data = await rootBundle.load('assets/images/splash.png');

    return OrderHistoryDetailsPoDocumentsBuffer(
      name: name,
      buffer: data.buffer.asUint8List(),
    );
  }
}
