part of 'outstanding_invoices_bloc.dart';

@freezed
class OutstandingInvoicesEvent with _$OutstandingInvoicesEvent {
  const factory OutstandingInvoicesEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Initialized;

  const factory OutstandingInvoicesEvent.fetch({
    required OutstandingInvoiceFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory OutstandingInvoicesEvent.loadMore() = _LoadMore;
}
