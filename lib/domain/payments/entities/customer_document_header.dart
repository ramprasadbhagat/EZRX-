import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_document_header.freezed.dart';

@freezed
class CustomerDocumentHeader with _$CustomerDocumentHeader {
  const CustomerDocumentHeader._();
  factory CustomerDocumentHeader({
    required List<CreditAndInvoiceItem> invoices,
    required int totalCount,
  }) = _CustomerDocumentHeader;

  factory CustomerDocumentHeader.empty() => CustomerDocumentHeader(
        invoices: <CreditAndInvoiceItem>[],
        totalCount: 0,
      );
}
