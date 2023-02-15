part of 'order_history_details_bloc.dart';

@freezed
class OrderHistoryDetailsState with _$OrderHistoryDetailsState {
  const OrderHistoryDetailsState._();
  const factory OrderHistoryDetailsState({
    required OrderHistoryDetails orderHistoryDetails,
    required bool isLoading,
    required bool showErrorMessage,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<OrderHistoryDetailsBonusAggregate> bonusItem,
  }) = _OrderHistoryDetailsState;

  factory OrderHistoryDetailsState.initial() => OrderHistoryDetailsState(
        orderHistoryDetails: OrderHistoryDetails.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        showErrorMessage: false,
        bonusItem: <OrderHistoryDetailsBonusAggregate>[],
      );
}
