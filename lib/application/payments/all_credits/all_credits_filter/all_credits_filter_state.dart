part of 'all_credits_filter_bloc.dart';

@freezed
class AllCreditsFilterState with _$AllCreditsFilterState {
  const AllCreditsFilterState._();

  const factory AllCreditsFilterState({
    required AllCreditsFilter allCreditsFilter,
    required bool isSubmitting,
    required bool isFetching,
    required bool showErrorMessages,
    required List<String> allCreditsStatuses,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,

  }) = _AllCreditsFilterState;

  factory AllCreditsFilterState.initial() => AllCreditsFilterState(
        allCreditsFilter: AllCreditsFilter.empty(),
        isSubmitting: false,
        isFetching: false,
        showErrorMessages: false,
        allCreditsStatuses: <String>[],
        failureOrSuccessOption: none(),
      );
}
