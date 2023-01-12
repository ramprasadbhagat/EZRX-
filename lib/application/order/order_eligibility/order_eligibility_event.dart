part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityEvent with _$OrderEligibilityEvent {
  const factory OrderEligibilityEvent.initialized({
    required User user,
    required List<PriceAggregate> cartItems,
    required SalesOrganisation salesOrg,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required String orderType,
    required double grandTotal,
    required double subTotal,
  }) = _Initialized;
  const factory OrderEligibilityEvent.update({
    required List<PriceAggregate> cartItems,
    required String orderType,
    required double grandTotal,
    required double subTotal,
  }) = _Update;
}
