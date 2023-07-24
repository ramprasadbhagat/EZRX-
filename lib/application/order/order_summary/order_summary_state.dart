part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();

  const factory OrderSummaryState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isSubmitting,
    required SubmitOrderResponse submitOrderResponse,
  }) = _OrderSummaryState;

  factory OrderSummaryState.initial() => OrderSummaryState(
        apiFailureOrSuccessOption: none(),
        isSubmitting: false,
        submitOrderResponse: SubmitOrderResponse.empty(),
      );
}
