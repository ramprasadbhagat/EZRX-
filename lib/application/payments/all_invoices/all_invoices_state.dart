part of 'all_invoices_bloc.dart';

@freezed
class AllInvoicesState with _$AllInvoicesState {
  //Constructor created for Getter
  const AllInvoicesState._();
  const factory AllInvoicesState({
    required AllInvoicesFilter appliedFilter,
    required List<CreditAndInvoiceItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _AllInvoicesState;

  factory AllInvoicesState.initial() => AllInvoicesState(
      failureOrSuccessOption: none(),
      isLoading: false,
      canLoadMore: true,
      appliedFilter: AllInvoicesFilter.empty(),
        items: <CreditAndInvoiceItem>[],
      );
      
}
