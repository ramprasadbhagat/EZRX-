part of 'all_invoices_filter_bloc.dart';

@freezed
class AllInvoicesFilterState with _$AllInvoicesFilterState {
  const AllInvoicesFilterState._();
  const factory AllInvoicesFilterState({
    required AllInvoicesFilter tempFilter,
    required AllInvoicesFilter appliedFilter,
    required List<String> statuses,
    required bool applied,
    required bool isFetching,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AllInvoicesFilterState;

  factory AllInvoicesFilterState.initial() => AllInvoicesFilterState(
        failureOrSuccessOption: none(),
        applied: false,
        isFetching: false,
        tempFilter: AllInvoicesFilter.empty(),
        appliedFilter: AllInvoicesFilter.empty(),
        showErrorMessages: false,
        statuses: <String>[
          'Open',
          'In progress',
          'Overdue',
          'Cleared',
        ],
      );
}
