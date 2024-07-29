import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'po_documents.freezed.dart';

@freezed
class PoDocuments with _$PoDocuments {
  const PoDocuments._();
  factory PoDocuments({
    required String url,
    required String name,
    required FileSize size,
  }) = _PoDocuments;
  factory PoDocuments.empty() => PoDocuments(
        url: '',
        name: '',
        size: FileSize(0),
      );
}

enum AttachmentType { downloadPOAttachment, downloadAttachment }
