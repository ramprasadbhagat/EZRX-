part of 'available_credits_bloc.dart';

@freezed
class AvailableCreditsEvent with _$AvailableCreditsEvent {
  const factory AvailableCreditsEvent.initialized({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
  }) = _initialized;

  const factory AvailableCreditsEvent.fetch({
    required AvailableCreditFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory AvailableCreditsEvent.loadMore() = _LoadMore;
}
