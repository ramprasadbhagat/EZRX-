part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();

  const factory OrderSummaryState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isSubmitting,
    required bool isConfirming,
    required SubmitOrderResponse submitOrderResponse,
    required OrderHistoryDetails orderHistoryDetails,
  }) = _OrderSummaryState;

  factory OrderSummaryState.initial() => OrderSummaryState(
        apiFailureOrSuccessOption: none(),
        isSubmitting: false,
        isConfirming: false,
        submitOrderResponse: SubmitOrderResponse.empty(),
        orderHistoryDetails: OrderHistoryDetails.empty(),
      );

  bool get isOrderHistoryDetailsEmpty =>
      orderHistoryDetails == OrderHistoryDetails.empty();
}
