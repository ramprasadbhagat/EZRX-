part of 'returns_overview_bloc.dart';

@freezed
class ReturnsOverviewState with _$ReturnsOverviewState {
  const ReturnsOverviewState._();
  factory ReturnsOverviewState({
    required ReturnsOverview returnRequestsOverview,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isLoading,
  }) = _ReturnsOverviewState;

  factory ReturnsOverviewState.initial() => ReturnsOverviewState(
        returnRequestsOverview: ReturnsOverview.empty(),
        apiFailureOrSuccessOption: none(),
        isLoading: false,
      );
}
