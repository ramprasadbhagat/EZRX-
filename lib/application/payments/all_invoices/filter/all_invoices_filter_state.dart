part of 'all_invoices_filter_bloc.dart';

@freezed
class AllInvoicesFilterState with _$AllInvoicesFilterState {
  const AllInvoicesFilterState._();
  const factory AllInvoicesFilterState({
    required AllInvoicesFilter filter,
    required List<String> statuses,
    required bool showErrorMessages,
  }) = _AllInvoicesFilterState;

  factory AllInvoicesFilterState.initial() => AllInvoicesFilterState(
        filter: AllInvoicesFilter.empty(),
        showErrorMessages: false,
        statuses: <String>[
          'Open',
          'In progress',
          'Overdue',
          'Cleared',
        ],
      );
}
