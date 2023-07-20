part of 'view_by_order_details_bloc.dart';

@freezed
class ViewByOrderDetailsState with _$ViewByOrderDetailsState {
  const ViewByOrderDetailsState._();
  const factory ViewByOrderDetailsState({
    required OrderHistoryDetails orderHistoryDetails,
    required bool isLoading,
    required Map<MaterialQueryInfo, bool> isLoadingTenderContract,
    required bool showErrorMessage,
    required bool isImageLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required Map<MaterialQueryInfo, PriceAggregate> materials,
  }) = _ViewByOrderDetailsState;

  factory ViewByOrderDetailsState.initial() => ViewByOrderDetailsState(
        orderHistoryDetails: OrderHistoryDetails.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        isLoadingTenderContract: {},
        showErrorMessage: false,
        materials: {},
        isImageLoading: false,
      );
  //TODO:Need To Revisit when tender contract is implemented for V3
  // bool get loadingTenderContractSuccess => isLoadingTenderContract.values.every(
  //       (isLoading) => !isLoading,
  //     );
}
