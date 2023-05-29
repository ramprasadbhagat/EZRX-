part of 'all_credits_bloc.dart';

@freezed
class AllCreditsEvent with _$AllCreditsEvent {
  const factory AllCreditsEvent.initialized() = _initialized;

  const factory AllCreditsEvent.fetchAllCreditsList({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required AllCreditsFilter allCreditsFilter,
  }) = _FetchAllCreditsList;
  const factory AllCreditsEvent.loadMoreAllCreditsList({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required AllCreditsFilter allCreditsFilter,
  }) = _LoadMoreAllCreditsList;
}
