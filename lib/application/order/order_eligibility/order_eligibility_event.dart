part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityEvent with _$OrderEligibilityEvent {
  const factory OrderEligibilityEvent.initialized({
    required User user,
    required SalesOrganisation salesOrg,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required String orderType,
  }) = _Initialized;
  const factory OrderEligibilityEvent.update({
    required List<PriceAggregate> cartItems,
    required String orderType,
    required double grandTotal,
    required double zpSubtotal,
    required double mpSubtotal,
    required double subTotal,
  }) = _Update;

  const factory OrderEligibilityEvent.validateOrderEligibility() =
      _ValidateOrderEligibility;
}
