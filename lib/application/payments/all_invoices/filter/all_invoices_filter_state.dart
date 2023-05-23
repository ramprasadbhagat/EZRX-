part of 'all_invoices_filter_bloc.dart';

@freezed
class AllInvoicesFilterState with _$AllInvoicesFilterState {
  const AllInvoicesFilterState._();
  const factory AllInvoicesFilterState({
    required AllInvoicesFilter allInvoicesFilter,
    required List<String> statuses,
    required bool changed,
    required bool edited,
    required bool isFetching,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AllInvoicesFilterState;

  factory AllInvoicesFilterState.initial() => AllInvoicesFilterState(
        failureOrSuccessOption: none(),
        changed: false,
        edited: false,
        isFetching: false,
        allInvoicesFilter: AllInvoicesFilter.empty(),
        showErrorMessages: false,
        statuses: <String>[],
      );

  bool get clearNeeded => !allInvoicesFilter.isEmpty || edited;
}
