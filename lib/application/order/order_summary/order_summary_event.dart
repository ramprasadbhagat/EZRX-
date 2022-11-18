part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryEvent with _$OrderSummaryEvent {
  const factory OrderSummaryEvent.initialized() = _Initialized;
  const factory OrderSummaryEvent.stepContinue() = _StepContinue;
  const factory OrderSummaryEvent.stepCancel() = _StepCancel;
  const factory OrderSummaryEvent.stepTapped({
    required int step,
  }) = _StepTapped;
  const factory OrderSummaryEvent.createDraft({
    required ShipToCodeState shipToCodeState,
    required UserState userState,
    required CartState cartState,
    required CustomerCodeState customerCodeState,
    required SalesOrgState salesOrgStateState,
  }) = _CreateDraft;
}
