import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_return_invoices.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_request_information_return_invoice_dto.freezed.dart';
part 'return_summary_request_information_return_invoice_dto.g.dart';

@freezed
class ReturnInvoiceDto with _$ReturnInvoiceDto {
  const ReturnInvoiceDto._();

  const factory ReturnInvoiceDto({
    @JsonKey(name: 'invoiceNumber', defaultValue: '')
        required String invoiceNumber,
    @JsonKey(name: 'invoiceDate', defaultValue: '') required String invoiceDate,
  }) = _ReturnInvoiceDto;

  ReturnInvoices toDomain() {
    return const ReturnInvoices(invoiceNumber: '', invoiceDate: '',);
  }

  factory ReturnInvoiceDto.fromDomain(ReturnInvoices returnInvoices) {
    return ReturnInvoiceDto(
        invoiceNumber: returnInvoices.invoiceNumber,
        invoiceDate: returnInvoices.invoiceDate,);
  }

  factory ReturnInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceDtoFromJson(json);
}
