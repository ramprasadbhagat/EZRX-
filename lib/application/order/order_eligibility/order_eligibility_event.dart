part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityEvent with _$OrderEligibilityEvent {
  const factory OrderEligibilityEvent.checkMinimumOrderValue({
    required List<PriceAggregate> cartItems,
    required SalesOrganisation salesOrg,
    required SalesOrganisationConfigs configs,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required String orderType,
    required User user,
  }) = _MinimumOrderValue;
}
