part of 'outstanding_invoices_bloc.dart';

@freezed
class OutstandingInvoicesEvent with _$OutstandingInvoicesEvent {
  const factory OutstandingInvoicesEvent.initialized() = _initialized;

  const factory OutstandingInvoicesEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required OutstandingInvoiceFilter appliedFilter,
  }) = _Fetch;
  const factory OutstandingInvoicesEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;
}
