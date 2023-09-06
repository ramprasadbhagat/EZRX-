part of 'outstanding_invoices_bloc.dart';

@freezed
class OutstandingInvoicesState with _$OutstandingInvoicesState {
  const OutstandingInvoicesState._();
  const factory OutstandingInvoicesState({
    required List<CustomerOpenItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
    required OutstandingInvoiceFilter appliedFilter,
    required SearchKey searchKey,
  }) = _OutstandingInvoicesState;

  factory OutstandingInvoicesState.initial() => OutstandingInvoicesState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        items: <CustomerOpenItem>[],
        appliedFilter: OutstandingInvoiceFilter.empty(),
        searchKey: SearchKey.search(''),
      );
}
