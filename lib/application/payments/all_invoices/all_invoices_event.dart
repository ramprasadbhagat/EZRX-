part of 'all_invoices_bloc.dart';

@freezed
class AllInvoicesEvent with _$AllInvoicesEvent {
  const factory AllInvoicesEvent.initialized() = _initialized;
  const factory AllInvoicesEvent.autoSearchProduct({
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _AutoSearchProduct;
  const factory AllInvoicesEvent.fetch({
    required AllInvoicesFilter appliedFilter,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
  const factory AllInvoicesEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;
}
