part of 'return_summary_bloc.dart';

@freezed
class ReturnSummaryState with _$ReturnSummaryState {
  const ReturnSummaryState._();
  const factory ReturnSummaryState({
    required List<ReturnSummaryRequest> returnSummaryList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _ReturnSummaryState;

  factory ReturnSummaryState.initial() => ReturnSummaryState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        returnSummaryList: <ReturnSummaryRequest>[],
      );
}
