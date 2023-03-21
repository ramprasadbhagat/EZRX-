import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_po_documents.freezed.dart';

@freezed
class PoDocuments with _$PoDocuments {
  const PoDocuments._();
  factory PoDocuments({
    required String url,
    required String name,
  }) = _PoDocuments;
  factory PoDocuments.empty() => PoDocuments(
        url: '',
        name: '',
      );
}
enum AttachmentType { downloadPOAttachment, downloadAttachment }

