part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryEvent with _$OrderSummaryEvent {
  const factory OrderSummaryEvent.initialized({
    required int step,
    required int maxSteps,
    required int additionalDetailsStep,
  }) = _Initialized;
  const factory OrderSummaryEvent.stepContinue() = _StepContinue;
  const factory OrderSummaryEvent.stepCancel() = _StepCancel;
  const factory OrderSummaryEvent.stepTapped({
    required int step,
  }) = _StepTapped;
  const factory OrderSummaryEvent.submitOrder() = _SubmitOrder;
}
