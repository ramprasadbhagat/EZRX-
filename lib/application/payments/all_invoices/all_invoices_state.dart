part of 'all_invoices_bloc.dart';

@freezed
class AllInvoicesState with _$AllInvoicesState {
  const AllInvoicesState._();
  const factory AllInvoicesState({
    required List<CreditAndInvoiceItem> items,
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
        items: <CreditAndInvoiceItem>[],
        sortDirection: 'desc',
        totalCount: 0,
      );

  List<CreditAndInvoiceGroup> get groups => items
      .groupListsBy((item) => item.netDueDate)
      .entries
      .map(
        (entry) => CreditAndInvoiceGroup(
          dueDate: entry.key,
          invoiceItems: entry.value,
        ),
      )
      .toList();
}
