part of 'return_details_by_request_bloc.dart';

@freezed
class ReturnDetailsByRequestState with _$ReturnDetailsByRequestState {
  const factory ReturnDetailsByRequestState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<ReturnRequestInformation> requestInformation,
    required ReturnRequestInformationHeader requestInformationHeader,
  }) = _ReturnSummaryDetailsState;

  factory ReturnDetailsByRequestState.initial() => ReturnDetailsByRequestState(
        failureOrSuccessOption: none(),
        isLoading: false,
        requestInformation: <ReturnRequestInformation>[],
        requestInformationHeader: ReturnRequestInformationHeader.empty(),
      );
}
