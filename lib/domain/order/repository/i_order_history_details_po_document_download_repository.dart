import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';

abstract class IOrderHistoryDetailsPoDocumentRepository {
  Future<Either<ApiFailure, List<OrderHistoryDetailsPoDocumentsBuffer>>>
      downloadFiles(Map<String, String> files);
}
