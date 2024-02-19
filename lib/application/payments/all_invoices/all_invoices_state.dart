part of 'all_invoices_bloc.dart';

@freezed
class AllInvoicesState with _$AllInvoicesState {
  const AllInvoicesState._();
  const factory AllInvoicesState({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required AllInvoicesFilter appliedFilter,
    required List<CreditAndInvoiceItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool isFetchingOrder,
    required bool canLoadMore,
  }) = _AllInvoicesState;

  factory AllInvoicesState.initial() => AllInvoicesState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        isFetchingOrder: false,
        canLoadMore: true,
        appliedFilter: AllInvoicesFilter.empty(),
        items: <CreditAndInvoiceItem>[],
      );
}
