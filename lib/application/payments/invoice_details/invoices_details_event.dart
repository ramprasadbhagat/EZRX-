part of 'invoice_details_bloc.dart';

@freezed
class InvoiceDetailsEvent with _$InvoiceDetailsEvent {
  const factory InvoiceDetailsEvent.initialized() = _Initialized;

  const factory InvoiceDetailsEvent.fetch({
    required CreditAndInvoiceItem invoiceItem,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
}
