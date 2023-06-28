part of 'all_credits_filter_bloc.dart';

@freezed
class AllCreditsFilterState with _$AllCreditsFilterState {
  const AllCreditsFilterState._();
  const factory AllCreditsFilterState({
    required AllCreditsFilter filter,
    required List<String> statuses,
    required bool applied,
    required bool isFetching,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AllCreditsFilterState;

  factory AllCreditsFilterState.initial() => AllCreditsFilterState(
        failureOrSuccessOption: none(),
        applied: false,
        isFetching: false,
        filter: AllCreditsFilter.empty(),
        showErrorMessages: false,
        statuses: <String>[
          'Open',
          'Cleared',
        ],
      );
}
