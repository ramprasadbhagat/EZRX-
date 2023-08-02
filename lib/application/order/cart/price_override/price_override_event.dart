part of 'price_override_bloc.dart';

@freezed
class PriceOverrideEvent with _$PriceOverrideEvent {
  const factory PriceOverrideEvent.initialized() = _Initialized;
  const factory PriceOverrideEvent.fetch({
    required PriceAggregate item,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
  const factory PriceOverrideEvent.priceOverrideValueChanged({
    required String newPrice,
  }) = _PriceOverrideValueChanged;

  const factory PriceOverrideEvent.onPriceValueChange({
    required String newPrice,
  }) =_OnPriceValueChange;
  
  const factory PriceOverrideEvent.onRemarksValueChange({
    required String newRemarks,
  }) = OnRemarksValueChange;
}
