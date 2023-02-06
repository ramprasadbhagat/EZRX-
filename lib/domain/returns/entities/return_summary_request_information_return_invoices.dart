import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_request_information_return_invoices.freezed.dart';

@freezed
class ReturnInvoices with _$ReturnInvoices {
  const ReturnInvoices._();

  const factory ReturnInvoices({
    required String invoiceNumber,
    required String invoiceDate,
  }) = _ReturnInvoices;

  factory ReturnInvoices.empty() =>
      const ReturnInvoices(invoiceNumber: '', invoiceDate: '');
}
