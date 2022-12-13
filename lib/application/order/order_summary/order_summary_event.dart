part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryEvent with _$OrderSummaryEvent {
  const factory OrderSummaryEvent.initialized({
    required int step,
    required int maxSteps,
    required int additionalDetailsStep,
    required SalesOrganisationConfigs config,
  }) = _Initialized;
  const factory OrderSummaryEvent.stepContinue() = _StepContinue;
  const factory OrderSummaryEvent.stepCancel() = _StepCancel;
  const factory OrderSummaryEvent.stepTapped({
    required int step,
  }) = _StepTapped;
  const factory OrderSummaryEvent.submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required AdditionalDetailsData data,
    required String orderType,
    required SalesOrganisationConfigs config,
  }) = _SubmitOrder;
}
