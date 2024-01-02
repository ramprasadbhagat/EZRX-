part of 'download_e_invoice_bloc.dart';

@freezed
class DownloadEInvoiceEvent with _$DownloadEInvoiceEvent {
  const factory DownloadEInvoiceEvent.initialized() = _initialized;
  const factory DownloadEInvoiceEvent.fetch({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrg salesOrg,
    required String invoiceNumber,
  }) = _Fetch;
}
