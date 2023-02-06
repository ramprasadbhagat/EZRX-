import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc_credit_notes.dart';

part 'return_summary_request_information_sales_doc.freezed.dart';

@freezed
class SalesDoc with _$SalesDoc {
  const SalesDoc._();

  const factory SalesDoc({
    required String invoiceNo,
    required String invoiceDate,
    required String bapiSalesDoc,
    required String ezrxNumber,
    required List<CreditNotes> creditNotes,
  }) = _SalesDoc;

  factory SalesDoc.empty() => const SalesDoc(
        invoiceNo: '',
        invoiceDate: '',
        bapiSalesDoc: '',
        ezrxNumber: '',
        creditNotes: <CreditNotes>[],
      );
}
