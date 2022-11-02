part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();

  const factory OrderSummaryState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required int step,
    required int maxSteps,
  }) = _OrderSummaryState;

  factory OrderSummaryState.initial() => OrderSummaryState(
        apiFailureOrSuccessOption: none(),
        step: 0,
        maxSteps: 4,
      );
}
