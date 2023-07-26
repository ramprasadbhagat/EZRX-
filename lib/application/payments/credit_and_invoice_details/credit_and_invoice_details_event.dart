part of 'credit_and_invoice_details_bloc.dart';

@freezed
class CreditAndInvoiceDetailsEvent with _$CreditAndInvoiceDetailsEvent {
  const factory CreditAndInvoiceDetailsEvent.initialized() = _Initialized;

  const factory CreditAndInvoiceDetailsEvent.fetch({
    required CreditAndInvoiceItem creditAndInvoiceItem,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
}
