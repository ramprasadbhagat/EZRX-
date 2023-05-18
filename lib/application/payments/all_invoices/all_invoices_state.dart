part of 'all_invoices_bloc.dart';

@freezed
class AllInvoicesState with _$AllInvoicesState {
  const factory AllInvoicesState({
    required List<CreditAndInvoiceItem> invoices,
    required int totalCount,
    required String sortDirection,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _AllInvoicesState;

  factory AllInvoicesState.initial() => AllInvoicesState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        invoices: <CreditAndInvoiceItem>[],
        sortDirection: 'desc',
        totalCount: 0,
      );
}
