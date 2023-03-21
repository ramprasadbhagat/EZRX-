part of 'return_summary_details_bloc.dart';

@freezed
class ReturnSummaryDetailsState with _$ReturnSummaryDetailsState {
  const factory ReturnSummaryDetailsState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ReturnSummaryRequest returnSummaryRequests,
    required RequestInformation requestInformation,

  }) = _ReturnSummaryDetailsState;

  factory ReturnSummaryDetailsState.initial() => ReturnSummaryDetailsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        returnSummaryRequests: ReturnSummaryRequest.empty(),
        requestInformation: RequestInformation.empty(),
      );
}
