import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_po_document_buffer.freezed.dart';

@freezed
class PoDocumentsBuffer with _$PoDocumentsBuffer {
  const PoDocumentsBuffer._();
  factory PoDocumentsBuffer({
    required Uint8List buffer,
    required String name,
  }) = _PoDocumentsBuffer;
  factory PoDocumentsBuffer.empty() => PoDocumentsBuffer(
        buffer: Uint8List(0),
        name: '',
      );
}
