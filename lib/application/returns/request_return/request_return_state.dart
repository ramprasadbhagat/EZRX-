part of 'request_return_bloc.dart';

@freezed
class RequestReturnState with _$RequestReturnState {
  const RequestReturnState._();
  const factory RequestReturnState({
    required List<ReturnItem> returnItemList,
    required String returnReferenceNumber,
    required String specialInstructions,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
    required String sortDirection,
  }) = _RequestReturnState;

  factory RequestReturnState.initial() => RequestReturnState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        returnItemList: <ReturnItem>[],
        sortDirection: 'desc',
        returnReferenceNumber: '',
        specialInstructions: '',
      );
}
