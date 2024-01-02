part of 'outstanding_invoices_bloc.dart';

@freezed
class OutstandingInvoicesState with _$OutstandingInvoicesState {
  const OutstandingInvoicesState._();
  const factory OutstandingInvoicesState({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerOpenItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool isOrderFetching,
    required bool canLoadMore,
    required OutstandingInvoiceFilter appliedFilter,
    required List<String> orderFetchingInvoiceIdList,
    required SearchKey searchKey,
  }) = _OutstandingInvoicesState;

  factory OutstandingInvoicesState.initial() => OutstandingInvoicesState(
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        isOrderFetching: false,
        items: <CustomerOpenItem>[],
        appliedFilter: OutstandingInvoiceFilter.empty(),
        searchKey: SearchKey.searchFilter(''),
        orderFetchingInvoiceIdList: <String>[],
      );

  bool get isSearchAndFilterEmpty =>
      searchKey.isValueEmpty &&
      appliedFilter == OutstandingInvoiceFilter.empty();
}
