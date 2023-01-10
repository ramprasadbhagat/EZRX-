part of 'return_request_type_code_bloc.dart';

@freezed
class ReturnRequestTypeCodeState with _$ReturnRequestTypeCodeState {
  const factory ReturnRequestTypeCodeState({
    required List<ReturnRequestTypeCodeDetails> returnRequestTypeCodeDetailsList,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>>
        returnRequestTypeCodeDetailsFailureOrSuccessOption,
  }) = _ReturnRequestTypeCodeState;
  
  factory ReturnRequestTypeCodeState.initial() => ReturnRequestTypeCodeState(
    returnRequestTypeCodeDetailsFailureOrSuccessOption: none(),
    isFetching: false,
    returnRequestTypeCodeDetailsList: <ReturnRequestTypeCodeDetails>[],
  );
}
