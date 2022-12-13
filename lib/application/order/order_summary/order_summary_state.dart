part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();

  const factory OrderSummaryState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required int step,
    required int maxSteps,
    required int additionalDetailsStep,
    required bool isSubmitting,
    required bool isSubmitSuccess,
    required SubmitOrderResponse submitOrderResponse,
  }) = _OrderSummaryState;

  factory OrderSummaryState.initial() => OrderSummaryState(
        apiFailureOrSuccessOption: none(),
        step: 0,
        maxSteps: 4,
        additionalDetailsStep: 3,
        isSubmitting: false,
        isSubmitSuccess: false,
        submitOrderResponse: SubmitOrderResponse.empty(),
      );
}
