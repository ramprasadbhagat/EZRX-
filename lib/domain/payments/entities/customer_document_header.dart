import 'package:ezrxmobile/domain/payments/entities/invoice_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_document_header.freezed.dart';

@freezed
class CustomerDocumentHeader with _$CustomerDocumentHeader {
  const CustomerDocumentHeader._();
  factory CustomerDocumentHeader({
    required List<InvoiceItem> invoices,
    required int totalCount,
  }) = _CustomerDocumentHeader;

  factory CustomerDocumentHeader.empty() => CustomerDocumentHeader(
        invoices: <InvoiceItem>[],
        totalCount: 0,
      );
}
