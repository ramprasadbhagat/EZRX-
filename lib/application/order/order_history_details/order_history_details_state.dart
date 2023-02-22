part of 'order_history_details_bloc.dart';

@freezed
class OrderHistoryDetailsState with _$OrderHistoryDetailsState {
  const OrderHistoryDetailsState._();
  const factory OrderHistoryDetailsState({
    required OrderHistoryDetails orderHistoryDetails,
    required bool isLoading,
    required Map<MaterialQueryInfo, bool> isLoadingTenderContract,
    required bool showErrorMessage,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required Map<MaterialQueryInfo, PriceAggregate> materials,
  }) = _OrderHistoryDetailsState;

  factory OrderHistoryDetailsState.initial() => OrderHistoryDetailsState(
        orderHistoryDetails: OrderHistoryDetails.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        isLoadingTenderContract: {},
        showErrorMessage: false,
        materials: {},
      );

  bool get loadingTenderContractSuccess => isLoadingTenderContract.values.every(
        (isLoading) => !isLoading,
      );
}
