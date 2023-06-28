part of 'all_credits_bloc.dart';

@freezed
class AllCreditsEvent with _$AllCreditsEvent {
  const factory AllCreditsEvent.initialized() = _initialized;

  const factory AllCreditsEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
  const factory AllCreditsEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;

  const factory AllCreditsEvent.applyFilters({
    required AllCreditsFilter tempFilter,
  }) = _ApplyFilters;
}
