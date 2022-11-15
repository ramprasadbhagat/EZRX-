part of 'price_override_bloc.dart';

@freezed
class PriceOverrideEvent with _$PriceOverrideEvent {
  const factory PriceOverrideEvent.initialized() = _Initialized;
  const factory PriceOverrideEvent.fetch({
    required PriceAggregate item,
    required String newPrice,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
}
