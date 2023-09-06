import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_po_attachment.freezed.dart';

@freezed
class AdminPoAttachment with _$AdminPoAttachment {
  const AdminPoAttachment._();
  factory AdminPoAttachment({
    required String salesOrderNumber,
    required String ezrxReferenceNumber,
    required String createdBy,
    required String createdTime,
    required String documentUrl,
    required String documentName,
    required String salesOrg,
    required String soldToCode,
    required String shipToCode,
    required String tempOrderNumber,
    @Default(false) bool isSelected,
  }) = _AdminPoAttachment;

  PoDocuments get pooDocuments => PoDocuments(
        name: documentName,
        url: documentUrl,
        path: '',
      );
}
