import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_po_document_buffer.freezed.dart';

@freezed
class OrderHistoryDetailsPoDocumentsBuffer
    with _$OrderHistoryDetailsPoDocumentsBuffer {
  const OrderHistoryDetailsPoDocumentsBuffer._();
  factory OrderHistoryDetailsPoDocumentsBuffer({
    required Uint8List buffer,
    required String name,
  }) = _OrderHistoryDetailspoDocumentsBuffer;
  factory OrderHistoryDetailsPoDocumentsBuffer.empty() =>
      OrderHistoryDetailsPoDocumentsBuffer(
        buffer: Uint8List(0),
        name: '',
      );
}
