part of 'available_credits_bloc.dart';

@freezed
class AvailableCreditsEvent with _$AvailableCreditsEvent {
  const factory AvailableCreditsEvent.initialized() = _initialized;

  const factory AvailableCreditsEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required AvailableCreditFilter appliedFilter,
  }) = _Fetch;
  const factory AvailableCreditsEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;
}
